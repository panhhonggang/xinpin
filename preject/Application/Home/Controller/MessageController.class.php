<?php
namespace Home\Controller;
use Think\Controller;
use Org\Util\SmsDemo;
class MessageController extends Controller 
{
    public function index()
    {
    	$this->display();
	}

    public function editor()
    {
    	$this->display();
	}
	
    public function message()
    {
    	$this->display();
	}

}