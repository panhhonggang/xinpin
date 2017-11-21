<?php
namespace Home\Controller;
use Think\Controller;

/**
 * 前共控制器
 * 前台控制器Register
 * @author 吴智彬 <519002008@qq.com>
 */
class RegisterController extends Controller 
{
    public function index()
    {
        $this->display();
    }

    //用户注册-手机验证
    public function register()
    {
    	if(IS_POST){

            // 查询手机号码是否存在
            $user = M('Users');
            $map['phone'] = array('eq', $_POST['phone']);
            $res = $user->where($map)->find();
            if($res) $this->error('亲，您的手机号码已被注册');
                
            // 判断手机验证码是否有效
            if($_SESSION['phone_code']!=$_POST['phone_code'])  $this->error('验证码错误，请重新输入');
               
            // 跳转到下一页
            $this->redirect('registerNext');
    	}else{
            $this->display();
        }
    }

    // 用户注册-资料填写
    public function registerNext()
    {
        if(IS_POST){

            $user = D('Users');
            $info = $user->create();

            $info['phone'] = $_SESSION['phone'];
            
            if($info){
                $mes = $user->add($info);
                if($mes){
                    // 跳转到主页
                    $this->redirect('Index/index');
                }else{
                    $this->error('注册失败');
                }
            }else{
                $this->error($user->getError());
            }
        }else{
            $this->display();
        }
    }

    // 检测输入的验证码是否正确，$code为用户输入的验证码字符串
    function check_verify($code, $id = ''){
        $verify = new \Think\Verify();
        return $verify->check($code, $id);
    }

    // 获取手机验证码
    public function getcode()
    {
        // 短信接口地址
        $target = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
        // 获取手机号
        $phone = $_POST['phone'];
        if(empty($phone)){
            exit('手机号不能为空');
        }

        //生成的随机数
        $mobile_code = $this->random(4,1);

        $post_data = "account=C28097321&password=f06fdea38f009cb2872ae4fc3d702aa3&mobile=".$phone."&content=".rawurlencode("您的验证码是：".$mobile_code."。请不要把验证码泄露给其他人。");
        $gets =  $this->xml_to_array($this->Post($post_data, $target));

        //手机验证码信息发送成功
        if($gets['SubmitResult']['code']==2){
            //开启SESSION
            session_start();

            $_SESSION['phone'] = $phone;
            $_SESSION['phone_code'] = $mobile_code;
        }
        echo $gets['SubmitResult']['msg'];
    }

    //请求数据到短信接口，检查环境是否 开启 curl init。
    protected function Post($curlPost,$url)
    {
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_HEADER, false);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_NOBODY, true);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $curlPost);
            $return_str = curl_exec($curl);
            curl_close($curl);
            return $return_str;
    }

    //将 xml数据转换为数组格式。
    protected function xml_to_array($xml)
    {
        $reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";
        if(preg_match_all($reg, $xml, $matches)){
            $count = count($matches[0]);
            for($i = 0; $i < $count; $i++){
            $subxml= $matches[2][$i];
            $key = $matches[1][$i];
                if(preg_match( $reg, $subxml )){
                    $arr[$key] = $this->xml_to_array( $subxml );
                }else{
                    $arr[$key] = $subxml;
                }
            }
        }
        return $arr;
    }

    //random() 函数返回随机整数。
    protected function random($length = 6 , $numeric = 0) 
    {
        PHP_VERSION < '4.2.0' && mt_srand((double)microtime() * 1000000);
        if($numeric) {
            $hash = sprintf('%0'.$length.'d', mt_rand(0, pow(10, $length) - 1));
        } else {
            $hash = '';
            $chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789abcdefghjkmnpqrstuvwxyz';
            $max = strlen($chars) - 1;
            for($i = 0; $i < $length; $i++) {
                $hash .= $chars[mt_rand(0, $max)];
            }
        }
        return $hash;
    }
}