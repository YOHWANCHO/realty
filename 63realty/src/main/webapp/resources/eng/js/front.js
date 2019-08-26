var MYAPP = MYAPP || {};

//MYAPP의 프로퍼티 중복 방지
MYAPP.namespace = function(obj_name) {
	var parts = obj_name.split("."),
		parent = MYAPP,
		i;

	//처음에 중복되는 전역 객체명은 제거
	if(parts[0] === "MYAPP"){
		parts = parts.slice(1);
	}	

	for(i=0; i<parts.length; i++){
		//프로퍼티가 존재하지 않으면 생성한다.
		if(typeof parent[parts[i]] === "undefined"){
			parent[parts[i]] = {};
		}

		parent = parent[parts[i]];
	}
	return parent;
};

//--------------------- MYAPP Start ---------------------//
(function(app, $){
    //Menu
	app.namespace("Menu");
	app.Menu = (function () {
		var init;
		var _gnb, _lnb, _subTop;

		init = function(level1, level2, level3){
			_gnb(level1, level2);
			_lnb(level2, level3);
			_subTop(level1);
		};

		//Gnb
		_gnb = function(level1, level2){
			var _open, _close, _currentActive;
			var $el, $header, $depth1, $depth2;

			$el = $("#gnb");
			$header = $("#header");
			$depth1 = $el.find(" > ul");
			$depth2 = $el.find("ul.depth2");

			_open = function(){
				TweenMax.to($header, 0.1, {css:{className:"+=on"}});
				$el.addClass("hover");
				$depth2.css("display","none");
			};
			_close = function(){
				if(level1 == 0){
					TweenMax.to($header, 0.1, {css:{className:"-=on"}});
				}
				$depth2.css("display","none");
				$el.removeClass("hover");
			};
			_currentActive = function(){
				$depth1.find(">li.active .depth2").css("display","block");
			};

			if(level1 > 0){
				$header.addClass("on");
				$el.find("li.m-" + level1).addClass("active");
				$el.find(">ul>li.active li.s-" + level2).addClass("active");
				_currentActive();
			}

			$depth1.find(">li").on({
				"mouseenter":function(){
					_open();
					var $this = $(this);
					$this.addClass("on");
					$this.children("ul.depth2").css("display","block");
				},
				"mouseleave":function(){
					_close();
					$(this).removeClass("on");
				}
			});

			$depth1.find(">li>a").on({
				"focusin":function(){
					_open();
					var $this = $(this);
					$this.parent().addClass("on");
					$this.siblings("ul.depth2").css("display","block");
				},
				"focusout":function(){
					var $this = $(this);
					$this.parent().removeClass("on");
					if($this.parent().index() == $depth1.find(">li").length - 1){
						_close();
						$this.parent().removeClass("on");
						if(level1 > 0){
							_currentActive();
						}
					}
				}	
			});

			$depth2.find(">li:last-child>a").on({
				"focusout":function(){
					_close();
					$(this).parent().parent().parent("li").removeClass("on");
				}
			});
			
			$el.on("mouseleave", function(){
				_currentActive();
			});
		};

		//Lnb
		_lnb = function(level2, level3){
			if(level2 > 0){
				var $el = $(".lnb");
				$el.find("li.s-" + level2).addClass("active");
				if(level3 > 0){
					$el.find(">ul>li.active li.t-" + level3).addClass("active");
					$el.find(">ul>li.active .depth2").css("display","block");
				}
			}
		};

		//Sub Top
		_subTop = function(level1){
			var $el = $(".sub_top"),
				$txt = $el.find(".txt"),
				$img = $el.find(".img");

			if(level1 > 0){
				$el.addClass("bg" + level1);
				$el.find(".sub_top_in").css("visibility", "visible");
				TweenMax.from($txt, .8, {css:{y:80}, ease:Cubic.easeOut, delay:0.1});
				TweenMax.from($img, 1.8, {css:{autoAlpha:0}, ease:Cubic.easeOut, delay:0.6});
			}else{
				$el.remove();
			}
		};

		return{
			init: init
		}
	})();

	//Common
	app.namespace("Common");
	app.Common = (function(){
		var init;
		var _allmenu;

		init = function(){
			$(".allmenu")[0] ? _allmenu() : "";
		};

		//Allmenu
		_allmenu = function(){
			var $el = $(".allmenu_list"),
				$open = $(".allmenu_open"),
				$close = $(".allmenu_close");
			var con = $("#gnb>ul").clone();
			
			$el.prepend(con);
			$open.on("click", function(){
				if($el.is(":hidden")){
					$el.slideDown(200);
				}else{
					$el.slideUp(200);
				}
			});
			$close.on("click", function(){
				$el.slideUp(200);
			});
		};

		return{
			init: init
		}
	})();

    //Tab
	app.namespace("Tab");
	app.Tab = (function () {
		var init;
		var $el;

	    init = function(target){
			$el = $(target);
			if($el.length < 1) throw '탭메뉴 target 가 존재하지 않습니다.';

			var prev;
			$el.find("a").on("click", function(e){
				e.preventDefault();
				var url = $(this).attr("href");
				if(prev){
					prev.parent().removeClass("on");
					$(prev.attr("href")).css("display", "none");
				}
				$(this).parent().addClass("on");
				$(url).css("display", "block");
				prev = $(this);
			});
			$el.find("li").eq(0).find("a").trigger("click");
		};

		return{
			init: init
		}
	})();

	//New Window
	app.namespace("NewWindow");
	app.NewWindow = (function () {
		var init;
	    init = function(mypage,myname,w,h,scroll){
			LeftPosition = (screen.width) ? (screen.width-w)/2 : 0; 
			TopPosition = (screen.height) ? (screen.height-h)/2 : 0; 
			settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable' ;
			var myname = window.open(mypage, myname, settings);
			myname.focus();
		};
		return{
			init: init
		}
	})();
})(MYAPP||{}, jQuery);

$(function(){
	MYAPP.Common.init();
});