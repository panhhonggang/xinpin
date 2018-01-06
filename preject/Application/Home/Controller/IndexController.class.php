<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends CommonController 
{
    public function index()
    {
    	
    	// 读取用户余额
    	$money = (int) M('users')->where('id='.$_SESSION['homeuser']['id'])->find()['balance'];
        $map['uid'] = session('homeuser.id');
        $card = M('card')->where($map)->select();
        // 拿到IC卡号
        $iccard = array_column($card,'iccard', 'id');

        // 查询每张IC卡一周的使用记录
        $icid = array_column($card, 'id');
        $where['icid'] = ['in', $icid];
        $times = strtotime('-7 days');
        $where['time'] = ['egt', $times];
        $record = M('consume')
            ->where($where)
            ->field("did,icid,flow,address,FROM_UNIXTIME(time,'%Y-%m-%d') as time")
            ->group('time,icid')
            ->order('time asc')
            ->select();

    	//分配数据     
        $assign = [
            'money' => $money/100,
            'iccard' => json_encode($res),
            'record' => json_encode($record),
        ];   
        $this->assign($assign);
    	$this->display();
	}

}