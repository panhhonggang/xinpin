<?php
namespace Home\Controller;
use Think\Controller;
class CardController extends CommonController 
{
    public function index()
    {
        $this->display();
    }

    //更新
    //IC卡必须后台存在
    public function add()
    {

    	//判断是否更新IC卡
    	if(IS_POST){	
    		$user = D('Card');
    		
            $info = $user->getIccard();

    		if($info){
                //获取IC卡状态
                $status = $info['status'];
                if($status==0){
                    $res = $user->create();
                    if($res){
                        $data['name'] = $_SESSION['homeuser']['name'];
                        $data['studentcode'] = $res['studentcode'];
                        $data['school'] = $res['school'];
                        $data['uid'] = $_SESSION['homeuser']['id'];
                        $data['status'] = 1;
                        $info = $user->where('iccard="'.$_POST['iccard'].'"')->save($data);
                        //dump($_SESSION);exit();
                        if($info){
                           //跳转到用户中心
                            $this->success('添加成功',U('Users/index')); 
                        }else{
                            $this->error('添加失败');
                        }
                    }else{
                        //返回自动验证提示信息
                        $this->error($user->getError());
                    }

                }elseif($status==1){
                    $this->error('该卡已被绑定');
                }else{
                    $this->error('该卡已被挂失');
                }

    		}else{
                $this->error('IC卡号不存在');
            }

    	}else{
    		$this->display();	
    	}
    	
    }

    //挂失
    //挂失：IC卡处于绑定状态
    public function reportTheLossOf()
    {
    	$this->display();
    }

    //解挂
    //解挂后:IC卡处于未绑定状态
    public function hangingSolution()
    {
    	$this->display();
    }    

}