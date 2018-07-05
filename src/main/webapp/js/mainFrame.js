window.onload=function(){
	//left_menu左边手风琴效果、
	$(document).on("click",".fir_menu",function(){
		$(this).siblings(".sec_menu").slideToggle()
		$(this).children(".iconfont").toggleClass("icon-shangjiantou").toggleClass("icon-xiajiantou")
	
	})
	//左边点击链接跳转
	$(document).on("click",".sec_menu li",function(){
		$(".sec_menu li").removeClass("secMenu_choosed")
		$(this).addClass("secMenu_choosed")
		$("iframe").attr("src",$(this).attr("data_href"))	
	})
	//头部切换
    $(".user_info").attr("flag","0").hover(function(){
        var _this = this;
        if($(_this).attr("flag") == "1") return;
        $(".user_toggle").slideDown("100", function(){
            $(_this).attr("flag","0");
        });
    },function(){
        var _this = this;
        $(".user_info").attr("flag","1");
        $(".user_toggle").slideUp("100",function(){
            $(_this).attr("flag","0");
        });
    });
	//*左边栏切换按钮*/
	$(".toggle_menu_btn").hover(function(){
		$(".left_menu").toggleClass("hover_active")
        $(this).toggleClass("hover_active")
		$(".main_iframe").toggleClass("hover_active")



        },function(){
		return false
		}
	)




}