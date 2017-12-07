//计算左边导航栏高度
	window.onload=function(){
		if($(".nav").height()<$("body").height()-140){
			$(".nav").height($("body").height()-136);
		}else{
			$(".nav").height($(".contentRight").height());
		}
	}
	function getLocalTime(nS) {     
        return new Date(parseInt(nS) * 1000).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " "); 
    }  
