<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	</div>
	<!-- //container -->
	
	<!-- footer -->
	<div id="footer">
		<p class="copyright">COPYRIGHT© 2017 Hanhwa63City ALL RIGHTS RESERVED.</p>
	</div>
	<!-- //footer -->
</div>
<!-- //wrap -->

<script type="text/javascript">
//leftmenu
function menuOn(){
	
	var servletPath="${reqUri}";	//호출된 서블릿페이지 주소		
	var titleText="";	
	$.each($(".lnb>ul>li"),function(e){
		var _href = $(this).children().attr("href").replace("_list", "");
		if(servletPath.indexOf(_href) > -1){
			$(this).addClass("on");
			titleText=$(this).text();
			return false;
		}
	})
	
	if($(".spanTitle").length>0){
		$(".spanTitle").text(titleText);
	}	
	
}

//gnb
var gnb = (function($){
	var _init = function(){
		var $gnb = $("#gnb");
		var gnbH = $gnb.find(".depth01").outerHeight();
		
		$gnb.find(".depth01>li").on("mouseenter", function(){
			$gnb.stop().animate({"height":gnbH + "px"}, 100);
		});
		$gnb.on("mouseleave", function(){
			$gnb.stop().delay(100).animate({"height":"49px"}, 100);
		});
	};
	return {
		init:_init
	}
})(jQuery);

//layer popup
function popupOpen(target){
	$.magnificPopup.open({
		items: {
			src: target
		},
		showCloseBtn:false,
		closeOnBgClick:false,
		mainClass: 'mfp-fade',
		removalDelay: 300
	});
}

//layer popup
function popupOpenAdmin(target, id, name){
	$("#_Flag").val(id);
	$("#selName").text(name);
	$.magnificPopup.open({
		items: {
			src: target
		},
		showCloseBtn:false,
		closeOnBgClick:false,
		mainClass: 'mfp-fade',
		removalDelay: 300
	});
}

$(function(){
	gnb.init();
});
</script>
</body>
</html>