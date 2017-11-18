<?php
namespace Home\Controller;
use Think\Controller;
class UsersController extends Controller 
{
    public function index()
    {
        $this->display();
    }

    public function register()
    {
    	if(IS_POST){
    		// var_dump($_POST);
    		

    		$user = D('users');
            $info = $user->create();
            if($info){
                $mes = $user->add();
                if($mes){
                    
                    $this->success('注册成功啦！！！',U('Users/index'));
                }else{
                    $this->error('注册失败');
                }
            }else{
                $this->error($user->getError());
            }
    	}else{
    		$this->display();
    	}
    	//

    	
    }
}