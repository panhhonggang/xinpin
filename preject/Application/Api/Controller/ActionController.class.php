<?php
namespace Api\Controller;
use Think\Controller;
use Think\Log;
use Org\Util\Gateway;

class ActionController extends Controller
{
    public function __construct()
    {
        Gateway::$registerAddress = '127.0.0.1:9504';
    }
    // 接收信息
    public function receive()
    {
        $message = I('post.');
        if(isset($message['client_id']))
        {
            $client_id = $message['client_id'];
            unset($message['client_id']);
        }

        foreach ($message as $key => $value) {
            file_put_contents('message', $key);
        }

        if( isset($message['PackType']) ){

            if( empty( Gateway::getSession($client_id) ) ){
                Gateway::setSession($client_id, $message);
            } else {
                $res = Gateway::getSession($client_id);

                $message['DeviceID'] = $res['DeviceID'];
            }
// $data['EnOut'],$data['OutWaterFlow'],$data['MaxTime']
            
            Log::write( json_encode($message), 'message_2');
            switch ($message['PackType']) {
                case 'login':
                    $this->loginAction($message);
                    break;
                case 'Select':
                    $this->selectAction($message);
                    break;
                case 'Requestwater':
                    $message = $this->RequesAction($message);
                    break;
                case 'Stopwater':
                    $this->stopAction($message);
                    break;
                default:
                    # code...
                    break;
            }
            Log::write( json_encode($message), 'message_4');

            if($message['PackType'] == 'login'){
                
                Gateway::bindUid($client_id, $message['DeviceID']);

            }

            if( isset($message['DeviceID']) ){
                if( Gateway::getClientCountByGroup($message['DeviceID']) > 0 ){
                    Gateway::sendToGroup( $message['DeviceID'], json_encode($message) );
                }
            }
            Gateway::sendToClient($client_id, $message);

        } else {
            $message = file_get_contents('message');
            $ReviveArray=json_decode($message, true);
            if( $ReviveArray['PackType'] == 'login' ){
                Gateway::joinGroup( $client_id, $ReviveArray['DeviceID'] );
            } else {
                Gateway::sendToUid($ReviveArray['DeviceID'], $ReviveArray);
            }
        }
    }

    // 出水请求
    public function RequesAction($message)
    {
        // 查询IC卡的类型
        $icCard = M('card')->where('iccard='.$message['iccard'])->find();
        // Log::write( json_encode($icCard), 'message_1');
        if( !empty($icCard) && $icCard['type'] == 0 ){
            $message['EnOut'] = -1;
            $message['OutWaterFlow'] = -1;
            $message['MaxTime'] = -1;
            // Log::write( json_encode($message), 'message_3');
            return $message;
        }

        
        if( !empty($icCard) && $icCard['type'] == 1){
            // 计算出水量
            $user = M('users')->where('id='.$icCard['uid'])->find();
            $outwater = floor($user['balance'] / 1.5 * 100) / 100;
            session( 'water'.$user['id'], $outwater);
            Log::write($outwater, '可用水量');
            $message['EnOut'] = -1;
            $message['OutWaterFlow'] = $outwater;
            $message['MaxTime'] = -1;
            // Log::write( json_encode($message), 'message_2');
            return $message;
        }

    }

    // 停水处理
    public function stopAction($message)
    {

        // $icCard = M('card')->where('iccard='.$message['iccard']->find();
        Log::write($message, 'card数据');
        // if( !empty($icCard) && $icCard['water'] > 0 ){
            // $user = M('users')->where('id='.$icCard['uid'])->find();
            // $totalWater = session('water'.$user['id']) - $message['water'];
            // session('water'.$user['id'], $totalWater);
            // $this->saveConsume($user['id'], $icCard['iccard'], $totalWater);
        // }
        return 1111;
    }


    // 保存消费记录
    // public function saveConsume($uid, $iccard, $totalWater)
    // {
    //     // id  int(11) 无符号、非空、自增   主键  自增ID
    //     // uid int(11) 无符号、非空  普通索引    用户ID
    //     // icid    int(11) 无符号、非空  普通索引    IC卡ID
    //     // flow    int(10) 非空      消费流量
    //     // address varchar(255)    非空      消费地点
    //     // time    int(11) 非空      消费时间
    //     $time = time();
    //     M('consume')->add();

    // }

    // 更新用户余额
    // public function updateBalance($balance)
    // {

    // }

    // 登陆数据处理
    public function loginAction($message)
    {
        $data = [
                    'DataCmd'      => $message['DataCmd'],
                    'Device'       => $message['Device'],
                    'PackType'     => $message['PackType'],
                    'AliveStause'  => $message['AliveStause'],
                    'DeviceType'   => $message['DeviceType'],
                    'DeviceID'     => $message['DeviceID'],
                    'ICCID'        => $message['ICCID'],
                    'CSQ'          => $message['CSQ'],
                    'Loaction'     => $message['Loaction']
                ];
        $devices_id = M('devices')->where("device_code={$message['DeviceID']}")->getField('id');
        $status_id  = M('devices_statu')->where("DeviceID={$message['DeviceID']}")->getField('id');
        
        if( empty($status_id) ){
            $res = $this->saveData($data);
            if($res){
                $data['updatetime'] = time();
                $data['device_status'] = 1;
                $result = M('devices')->where('device_code=' . $message['DeviceID'])->save($data);
            }
        } else {
            $res = $this->updateData($status_id, $data);
        }

    }

    // 查询数据处理
    public function selectAction($message)
    {
        $data = [
            'DeviceStause' => $message['DeviceStause'],
            'ReFlow'       => $message['ReFlow'],
            'Reday'        => $message['Reday'],
            'SumFlow'      => $message['SumFlow'],
            'SumDay'       => $message['SumDay'],
            'RawTDS'       => $message['RawTDS'],
            'PureTDS'      => $message['PureTDS'],
            'Temperature'  => $message['Temperature'],
            'FilerNum'     => $message['FilerNum'],
            'LeasingMode'  => $message['LeasingMode'],
        ];

        if( $message['FilerNum'] != null ){
            $res = $this->filterAction($message);

            $data = array_merge( $data, $res );
        }

        $status_id = M('devices_statu')->where("DeviceID=" . $message['DeviceID'])->getField('id');
        $this->updateData($status_id, $data);
    }


    // 存储数据 将数据存到 devices_statu表中
    public function saveData($data)
    {
        $data['addtime'] = time();
        return M('devices_statu')->add($data);
    }

    // 更新数据
    public function updateData($id, $data)
    {
        $data['updatetime'] = time();
        return M('devices_statu')->where("id={$id}")->save($data);
    }

    // 滤芯处理
    public function filterAction($message)
    {
        if( $message['FilerNum'] != null ){
            $data = array();
            for( $i = 1; $i <= $message['FilerNum']; $i ++)
            {
                $data['ReFlowFilter' . $i]   = $message['ReFlowFilter' . $i];
                $data['ReDayFilter' . $i]    = $message['ReDayFilter' . $i];
            }
            return $data;
        }
    }




}