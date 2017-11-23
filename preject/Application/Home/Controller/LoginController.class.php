<?php
namespace Home\Controller;
use Think\Controller;

/**
 * 前共控制器
 * 前台控制器login
 * @author 吴智彬 <519002008@qq.com>
 */
class LoginController extends Controller 
{
    public function index()
    {
        $this->display();
    }

    //用户登录
    public function login()
    {
        // 登录检查
        if(!empty($_SESSION['homeuser'])) $this->redirect('Index/index');

        if(IS_POST){         
            //判断验证码是否正确
            $Verify =  new \Think\Verify();
            $res = $Verify->check($_POST['verify_code']);
            if(!$res) $this->error('验证码不对');

            //查询手机号
            $condition['phone'] = $_POST['phone'];
            $info = M('Users')->where($condition)->find();
   
            if($info){
                //接收密码
                $password = MD5($_POST['password']);
                //密码验证
                if ($info['password'] == $password) {
                    //验证成功
                    $_SESSION['homeuser'] = $info;
                    //跳转到主页
                    $this->redirect('Index/index');
                }else{
                    $this->error('您的密码输入错误！');
                }

            }else{
                $this->error('您输入的用户名不存在！');
            }

        }else{
           $this->display(); 
        } 
    }

    //退出登录
    public function logout()
    {
        unset($_SESSION['homeuser']);
        $this->redirect('Login/login');
    }

    //用户登录验证码生成
    public function verifyCode(){
        $config =    array(
            'fontSize'    =>    20,    // 验证码字体大小
            'length'      =>    3,     // 验证码位数
            'useNoise'    =>    false, // 关闭验证码杂点
        );
        $Verify =     new \Think\Verify($config);
        $verify_code = $Verify->entry(); 
    }
}