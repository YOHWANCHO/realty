<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Hanwha 63 City</title>
</head>
<body class="main">
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<section id="contents" class="main_visual">
	<div class="visual_slider">
		<div class="slide_item visual1"><a href="/eng/business/property_intro" class="btn_go"><img src="/resources/eng/img/main/btn_go.png" alt="View" /></a></div>
		<div class="slide_item visual2"><a href="/eng/business/leasing_intro" class="btn_go"><img src="/resources/eng/img/main/btn_go.png" alt="View" /></a></div>
		<div class="slide_item visual3"><a href="/eng/business/investment_intro" class="btn_go"><img src="/resources/eng/img/main/btn_go.png" alt="View" /></a></div>
		<div class="slide_item visual4"><a href="/eng/business/facility_intro" class="btn_go"><img src="/resources/eng/img/main/btn_go.png" alt="View" /></a></div>
		<div class="slide_item visual5"><a href="/eng/business/engineering" class="btn_go"><img src="/resources/eng/img/main/btn_go.png" alt="View" /></a></div>
	</div>
	<button id="btn_playPause" class="btn_playPause pause">Stop</button>
</section>

<div class="main_con">	
	<div class="group">
		<!-- 공지사항 
		<section class="main_box main_board">
			<h2><a href="/eng/pr/office_list">Corporate Profile</a></h2>
			<ul>
				<c:if test="${empty engList}">
					<li>NO DATA</li>
				</c:if>
				<c:forEach var="vo" items="${engList}" varStatus="status">
					<li><a href="/eng/pr/office_view/${vo.mainBoardSeq}">${vo.title}</a></li>
				</c:forEach>				
			</ul>
		</section>
		<!-- //공지사항 -->
		
		<section class="main_box main_board2">
			<a href="/eng/about/overview">
				<h2>Corporate Profile</h2>
				<p class="txt">As the No. 1<br />real estate<br />service<br />provider in Korea</p>
				<span class="txt_go">go</span>
			</a>
		</section>
			
		<section class="main_box main_lease">
			<a href="/eng/business/leasing_intro">
				<h2>leasing Information</h2>
				<p class="txt">This convenient <br />service will provide <br />you with leasing <br />information.</p>
				<span class="txt_go">go</span>
			</a>
		</section>
		
		<section class="main_box main_brochure">
			<a href="/eng/pr/social">
				<h2>Social Contribution</h2>
				<p class="txt">based on the<br />Hanwha spirit<br />called<br />"far away together"</p>
				<span class="txt_go">go</span>
			</a>
		</section>
		
		<section class="main_box main_cs">
			<a href="/eng/cs/contact">
				<h2>Contact Us</h2>
				<p class="txt">You will get answers <br />to all your questions <br />about <span class="main_img_txt">Hanwha 63 City.</span></p>
				<span class="txt_go">go</span>
			</a>
		</section>
		<section class="main_box main_other">
			<a href="/eng/pr/office_list">
				<h2>Office Market Report</h2>
				<p class="txt">Market analyst</p>
				<span class="txt_go" style="display:inline-block;margin-top:36px;">go</span>
			</a>
		</section>
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script src="/resources/js/slick.min.js"></script>
<script>
	$(function(){
		MYAPP.Menu.init(0, 0, 0);
		mainFunc.init();
	});

	//main js
	var mainFunc = (function($){
		var init;
		var _visualSlider;
		
		init = function(){
			_visualSlider();
		};

		//visual slider
		_visualSlider = function(){
			$(".visual_slider").slick({ 
				fade: true,                                 
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				arrows:false,
				draggable :false,
				speed: 800,
				dots: true,
				pauseOnHover: false,
				pauseOnFocus: false,
				focusOnSelect: false
			});

			$("#btn_playPause").on("click", function(){
				$this = $(this);
				if($this.hasClass("pause")){
					$this.text("Start").removeClass("pause").addClass("play");
					$(".visual_slider").slick('slickPause');
				}else {
					$this.text("Stop").removeClass("play").addClass("pause");
					$(".visual_slider").slick('slickPlay');
				}
			});
		};

		return{
			init: init
		}
	})(jQuery);
</script>
</body>
</html>