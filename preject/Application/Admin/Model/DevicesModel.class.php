<?php
namespace Admin\Model;
use Think\Model;

/**
 * Class DevicesModel
 * @package Admin\Model
 * 设备添加操作
 * @author 陈昌平 <chenchangping@foxmail.com>
 */
class DevicesModel extends Model
{
    // 自动验证
    protected $_validate = array(
        array('device_code', '16', '请输入正确的设备编码', '3', 'length'),
        array('device_code', '/^\d{16}$/', '设备编码只能是数字', '2', 'regex'),
        array('device_code', '', '请不要重复录入', '1', 'unique'),
    );

    // 自动完成
    protected $_auto = array(
        array('device_statu', '1'),
        array('created_at', 'time', 1, 'function'),
    );

    public function getDevicesInfo($user_id)
    {
        // 查询设备
        /*$data = M()->table('pub_vendors vendors')
            ->join('__BINDING__ on vendors.id = __BINDING__.vid', 'left')
            ->join('__DEVICES__ on __BINDING__.did = __DEVICES__.id', 'left')
            ->join('__FILTERS__ on __DEVICES__.id = __FILTERS__.device_id', 'left')
            ->join('__DEVICES_STATU__ on __DEVICES__.id = __DEVICES_STATU__.device_id', 'left')
            ->where("vendors.id={$user_id}")
            ->getField('pub_devices_statu.device_statu,pub_devices_statu.updated_at,pub_devices.*,pub_filters.*');
        return $data;*/
    }

    // 设备插入数据库
    public function add_device($code)
    {
        return $this->add($code);
    }

    // 获取经销商绑定的设备
    public function getBindDevice($user_id)
    {
        // 根据登陆ID得到该用户绑定的所有的设备ID
        $bind = M('binding')->where("vid={$user_id}")->field('did')->select();
        dump($user_id);
        $res = array_column($bind, 'did');
        dump($res);
        return $res;
    }

    // 查询所有的滤芯
    public function getAllFilters($device_id)
    {
        dump($device_id);
        $deviceInfo = M('filters')->where(['device_id' => ['in', $device_id]])->select();
        return $deviceInfo;
    }

    // 查询设备状态
    public function getDevcieStatus($device_id)
    {

        return $deviceStatus;
    }

}