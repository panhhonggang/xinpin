//设置字体自适应大小
(function (doc, win) {
	var docEl = doc.documentElement,
	resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
	recalc = function () {
	  var clientWidth = docEl.clientWidth;
	  if (!clientWidth) return;
	  docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
	};
  	if (!doc.addEventListener) return;
  	win.addEventListener(resizeEvt, recalc, false);
  	doc.addEventListener('DOMContentLoaded', recalc, false);
})(document, window);

//设置软件盘弹出后优化页面布局
function solveCompatible(obj){
    var oHeight = $(document).height(); //浏览器当前的高度
    $(window).resize(function(){
        if($(document).height() < oHeight){
            obj.css("position","static");
        }else{
            obj.css("position","absolute");
        } 
    });
}
//layuiHint弹框提示封装
function layuiHint(text){
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.msg(text);
    });  
}
//密码验证封装
function passwordVaild(obj){
    var reg = /^[0-9a-zA-Z]{6,12}$/;
    if(!reg.test(obj)){
        layuiHint("密码只能由6-12位数字或字母组成");
        return 0;
    }else{
        return 1;
    }
}