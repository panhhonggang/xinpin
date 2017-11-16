<?php
namespace Admin\Model;

use Think\Model;

/**
 * Class 机组数据处理
 * @package Admin\Model
 * @author 潘宏钢 <619328391@qq.com>
 */
class CrewModel extends Model
{   

    // 自动验证
    protected $_validate = array(
        array('cname','require','机组名称不能为空'),
        array('cname','','该机组名称已存在，请换一个试试，如清华大学清华园1号机',0,'unique',1)
        
        // array('url','/@(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:\'".,<>?«»“”‘’]))@','网址格式不对',1,'regex')
    );


    // 自动完成
    protected $_auto = array ( 
        array('addtime','time',3,'function'), // 对addtime字段在新增和编辑的时候写入当前时间戳 

    );


}