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
        array('type_id','require','设备类型不能为空'),
        // array('type_id', '{$this->getCate()}','设备类型不正确', '1', 'in'),

    );

    // 自动完成
    protected $_auto = array(
        array('device_statu', '1'),
        array('addtime', 'time', 1, 'function'),
    );

    // 获取产品类型
    public function getCate()
    {
        $data = M('DeviceType')->field('id')->select();
        $res = array_column( $data, 'id' );
        return $res;
    }

    /**
     * 获取信息
     * @return [type] [description]
     */
    public function getInfo()
    {
        $bind = D('binding');
        $crew = M('Crew');
        $devices_statu = M('DevicesStatu');
        $vendor = M('Vendors');
        // 通过经销商获取绑定的机组
        $res = $bind->select();
        $cids = array_column($res, 'cid');
        // 通过机组获取设备编码
        $crews = $crew->where(['id' => ['in', $cids]])->select();
        $dcode = array_column($crews, 'dcode');
        // 通过设备编码获取设备信息
        $result = $devices_statu->where(['DeviceID' => ['in', $dcode]])->select();

        $vendor = $this->join('xp_crew ON xp_devices.device_code = xp_crew.dcode')
                              ->join('xp_binding ON xp_crew.id = xp_binding.cid')
                              ->join('xp_vendors ON xp_binding.vid = xp_vendors.id')
                              ->field('xp_devices.device_code,xp_vendors.name')
                              ->select();

        $data = $this->order('updatetime desc')->select();
        $array = array();
        foreach ($data as $key => $value) {
            foreach ($result as $k => $val) {
                if($value['device_code'] == $val['deviceid']){
                    foreach ($val as $keys => $values) {
                        $value['d'.$keys] = $values;
                    }
                }
            }

            foreach ($vendor as $vkey => $v) {
                if($value['device_code'] == $v['device_code']){
                    foreach ($v as $ven) {
                        $value['name'] = $ven;
                    }
                }
            }

            $array[] = $value;
        }
        return $array;
    }

}