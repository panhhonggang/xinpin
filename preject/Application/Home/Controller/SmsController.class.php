<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        
    	$sms = new \Org\Util\SmsDemo;
		$response = $sms::sendSms(
		    "阿里云短信测试专用", // 短信签名
		    "SMS_112735031", // 短信模板编号
		    "13425492760", // 短信接收者
		    Array(  // 短信模板中字段的值
		        "code"=>"123654",
		        "product"=>"dsd"
		    ),
		    "123"   // 流水号,选填
		);
		print_r($response);
    }


}