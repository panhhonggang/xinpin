<?php
namespace Home\Controller;
use Think\Controller;
class UsersController extends CommonController 
{
    public function index()
    {
        if(empty($_SESSION['homeuser'])){
            //跳转到登录页面
            $this->success('请先登录',U('Users/index'));
        }else{
            $this->display();
        }
        
    }
}