<?php
namespace Home\Controller;
use Think\Controller;
class FlowController extends CommonController 
{
	// 充值
    public function recharge()
    {
    	// 获取JS-SDK签名并查询用户微信中的openid
    	
    	// 分配数据

    	// 显示模板
    	$this->display();

    	// 充值成功修改用户余额
	}
	//充值记录
	public function rechargeNote(){
		$this->display();
	}
}