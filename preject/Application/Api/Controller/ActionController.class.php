<?php
namespace Api\Controller;
use Think\Controller;
use Think\Log;
use Org\Util\Gateway;

class ActionController extends Controller
{
    // 接收信息
    public function receive()
    {
        $message = I('post.');
        Log::write(json_encode($message));

        // 判断session是否为空
        if( empty( session('client_id') ) ){
            // 绑定用户
            $this->bind($message);
        }

        // 判断类型
        if( !isset($message['PackType']) ){

        }


        /*if( isset($message['PackType']) ){
            var_dump($message);
            // 判断session 中是否保存了连接
            if( empty( Gateway::getSession($message['client_id']) ) ){
                // 将发送的信息保存到连接中
                Gateway::setSession($message['client_id'], $message);
            } else {
                // 获取连接
                $res = Gateway::getSession($message['client_id']);
                // 将连接设为DeviceID
                $message['DeviceID'] = $res['DeviceID'];
            }

            // 将信息发送到连接
            Gateway::sendToClient($message['client_id'],$message);
            // 判断信息的类型
            if($message['PackType'] == 'login'){
                // 登陆状态下将设备ID与连接绑定
                Gateway::bindUid($message['client_id'], $message['DeviceID']);
            }
            // 判断设备ID是否存在
            if( isset($message['DeviceID']) ){
                // 判断组里面的设备是否大于0
                if( Gateway::getClientCountByGroup($message['DeviceID']) > 0 ){
                    // 将json格式的数据发送到 以设备ID命名的组里面
                    Gateway::sendToGroup( $message['DeviceID'], json_encode($message) );
                }
            }
        } else {
            var_dump($message['client_id']);
            $ReviveArray=json_decode($message,true);
            if( $ReviveArray['PackType'] == 'login' ){
                Gateway::joinGroup( $message['client_id'], $ReviveArray['DeviceID'] );
            } else {
                Gateway::sendToUid($ReviveArray['DeviceID'], $ReviveArray);
            }
        }*/

    }

    // 绑定用户
    public function bind($message)
    {
        // 用户跟deviceID绑定
        Gateway::bindUid( $message['client_id'], $message['DeviceID'] );

        // 绑定完成后直接存到session
        session('client_id', $message['DeviceID']);
    }

    // 登陆数据处理
    public function loginAction($message)
    {
        $data = [
                    'DataCmd'      => $message['DataCmd'],
                    'Device'       => $message['Device'],
                    'PackType'     => $message['PackType'],
                    'DeviceStause' => $message['DeviceStause'],
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