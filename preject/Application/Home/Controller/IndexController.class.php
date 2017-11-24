<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends CommonController 
{
    public function index()
    {
    	$this->display();
    	//qrcode('http://baidu.com/s?word=qrcode类库',4);
	}
}