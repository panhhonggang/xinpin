//$('.page').height($(window).height());
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
//服务器提示信息
function hint(hint){
	if(hint)
	{
		$('.hint_bg').css("display","block");
		$('.hint_bg').height($(window).height());
		$('.hint_text').html(hint);
		$('.hint_btn').click(function(){
			$('.hint_bg').css("display","none");
		});
	}
}