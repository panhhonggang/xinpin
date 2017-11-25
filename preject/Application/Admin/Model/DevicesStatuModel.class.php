<?php
namespace Admin\Model;
use Think\Model;
/**
* 设备状态  
*/
class DevicesStatuModel extends Model
{
    
    public function getAllInfo()
    {
        $res = $this->select();

        return $res;
    }
    
}