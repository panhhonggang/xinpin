<?php
namespace Home\Controller;
use Think\Controller;
class UsersController extends CommonController 
{
	//我的
    public function index()
    {
        $this->display();        
    }
	
	//个人信息
	public function personalInformation()
	{
		$this->display();
	}
}