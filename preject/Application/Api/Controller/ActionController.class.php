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
        $client_id = $message['client_id'];
        unset($message['client_id']);
        Log::write(json_encode($message));

        if( isset($message['PackType']) ){
            if( empty( Gateway::getSession($client_id) ) ){
                Gateway::setSession($client_id, $message);
            } else {
                $res = Gateway::getSession($client_id);
                $message['DeviceID'] = $res['DeviceID'];
            }

            Gateway::sendToClient($client_id, $message);
            if($message['PackType'] == 'login'){
                Gateway::bindUid($client_id, $message['DeviceID']);
            }
            if( isset($message['DeviceID']) ){
                if( Gateway::getClientCountByGroup($message['DeviceID']) > 0 ){
                    Gateway::sendToGroup( $message['DeviceID'], json_encode($message) );
                }
            }

            switch ($message['PackType']) {
                case 'login':
                    $this->loginAction($message);
                    break;
                case 'Select':
                    $this->selectAction($message);
                    break;
                default:
                    # code...
                    break;
            }

        } else {
            $ReviveArray=json_decode($message,true);
            if( $ReviveArray['PackType'] == 'login' ){
                Gateway::joinGroup( $client_id, $ReviveArray['DeviceID'] );
            } else {
                Gateway::sendToUid($ReviveArray['DeviceID'], $ReviveArray);
            }
        }
    }

    // 绑定用户
    public function bind($message)
    {
        // 用户跟deviceID绑定
        Gateway::bindUid( $message['client_id'], $message['DeviceID'] );

        // 绑定完成后直接存到session
        Gateway::setSession($message['client_id'], $message['DeviceID']);
    }

    // 发送数据
    public function sendData($data)
    {

    }

    // 登陆数据处理
    public function loginAction($message)
    {
        $data = [
                    'DataCmd'      => $message['DataCmd'],
                    'Device'       => $message['Device'],
                    'PackType'     => $message['PackType'],
                    // 'DeviceStause' => $message['DeviceStause'],
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

        $status_id = M('devices_statu')->where("DeviceID={$message['DeviceID']}")->getField('id');
        Log::write(json_encode($data));
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