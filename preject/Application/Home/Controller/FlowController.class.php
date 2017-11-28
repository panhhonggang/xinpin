<?php
namespace Home\Controller;
use Think\Controller;
use \Org\Util\WeixinJssdk;

class FlowController extends CommonController 
{
	// 充值
    public function recharge()
    {
    	//调用微信JS-SDK类获取签名需要用到的数据
        $weixin = new WeixinJssdk;
        $signPackage = $weixin->getSignPackage();

        // 查询用户微信中的openid
        $openId = $weixin->GetOpenid();

        //分配数据        
        $this->assign('info',$signPackage);
        $this->assign('openId',$openId);

        // 显示模板
    	$this->display();

    	// 充值成功修改用户余额
	}

    /**
     * 统一下单并返回数据
     * @return string json格式的数据，可以直接用于js支付接口的调用
     */
    public function uniformOrder()
    {
    	$money = I('money');
    	$openId = I('openId');
        //echo 1;exit;
        //微信examle的WxPay.JsApiPay.php
        vendor('WxPay.jsapi.WxPay#JsApiPay');
        $tools = new \JsApiPay();
        //②、统一下单
        vendor('WxPay.jsapi.WxPay#JsApiPay');
        $input = new \WxPayUnifiedOrder();
        $input->SetBody("充值".($money/100)."元水费");
        $input->SetAttach("love");
        $input->SetOut_trade_no(\WxPayConfig::MCHID.date("YmdHis"));
        $input->SetTotal_fee($money);//单位为分
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 300));
        $input->SetGoods_tag("test");
        $input->SetNotify_url("http://wuzhibin.cn/Home/Flow/notify");
        $input->SetTrade_type("JSAPI");
        $input->SetOpenid($openId);
        $order = \WxPayApi::unifiedOrder($input);
        $jsApiParameters = $tools->GetJsApiParameters($order);
        echo $jsApiParameters;
        exit;
    }
    
    // 充值完成的回调
	public function notify(){
		//$this->display();
		echo '充值完成的回调';
	}

	// 充值记录
	public function rechargeNote(){
		$this->display();
	}


}