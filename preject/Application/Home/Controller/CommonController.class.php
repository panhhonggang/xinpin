<?php
namespace Home\Controller;
use Think\Controller;

/**
 * 前共控制器
 * 前台控制器除login外必须继承我
 * @author 吴智彬 <519002008@qq.com>
 */

class CommonController extends Controller 
{
	/**
     * 初始化
     * @author 吴智彬 <519002008@qq.com>
     */
    public function _initialize()
    {	
    	// 登录检测
    	if(empty($_SESSION['homeuser'])) $this->redirect('Login/login');

        // 查询用户IC卡号 xp_card
        $uid = $_SESSION['homeuser']['id'];
        // 查询用户名是否绑定IC卡
        $icid = M('Card')->field('id')->where('`uid`='.$uid)->find();
        // 如果没有绑定IC卡
    	if(empty($icid)) $this->redirect('Home/Card/add');

    }


}