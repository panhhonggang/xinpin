<?php
namespace Home\Controller;
use Think\Controller;
class FlowController extends CommonController 
{
	//充值
    public function recharge()
    {
    	$this->display();

	}
	//充值记录
	public function rechargeNote(){
		$this->display();
	}
}