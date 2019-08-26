<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>한화63시티</title>
</head>
<body class="main">
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<section id="contents" class="main_visual">
	<div class="visual_slider">
		<div class="slide_item visual1"></div>
		<div class="slide_item visual2"></div>
		<div class="slide_item visual3"><a href="/business/property_intro" class="btn_go"><img src="/resources/img/main/btn_go.png" alt="바로가기" /></a></div>
		<div class="slide_item visual4"><a href="/business/leasing_intro" class="btn_go left" style="top:312px;"><img src="/resources/img/main/btn_go.png" alt="바로가기" /></a></div>
		<div class="slide_item visual5"><a href="/business/investment_intro" class="btn_go right"><img src="/resources/img/main/btn_go.png" alt="바로가기" /></a></div>
		<div class="slide_item visual6"><a href="/business/facility_intro" class="btn_go left"><img src="/resources/img/main/btn_go.png" alt="바로가기" /></a></div>
		<div class="slide_item visual7"><a href="/business/engineering" class="btn_go left" style="top:312px;"><img src="/resources/img/main/btn_go.png" alt="바로가기" /></a></div>
	</div>
	<button id="btn_playPause" class="btn_playPause pause">정지</button>
</section>

<div class="main_con">
	<!-- QUICK 검색 -->
	<a href="javascript:;" class="quick_open">QUICK 검색 OPEN</a>
	<section class="main_quick">
		<div class="quick_slider">
			<c:forEach var="vo" items="${buildingList}" varStatus="status">				
				<div class="slide_item"><a href="/business/property_view/${vo.bldInfoSeq}">
					<span class="img">
						<c:if test="${not empty vo.fileSavenm}">
							<img src="${viewPath}${vo.filePath}${vo.fileSavenm}" alt="" />
						</c:if>						
						</span> <span class="txt">${vo.bldName}</span></a></div>
			</c:forEach>			
		</div>
		<a href="javascript:;" class="quick_close">QUICK 검색 CLOSE</a>
	</section>
	<!-- //QUICK 검색 -->

	<div class="group">
		<!-- 공지사항 -->
		<section class="main_box main_board">
			<h2><a href="/cs/notice_list">공지사항</a></h2>
			<ul>
				<c:if test="${empty noticeList}">
					<li>등록 된 글이 없습니다.</li>
				</c:if>
				<c:forEach var="vo" items="${noticeList}" varStatus="status">
					<li><a href="/cs/notice_view/${vo.mainBoardSeq}">${vo.title}</a></li>
				</c:forEach>
			</ul>
		</section>
		<!-- //공지사항 -->
		
		<section class="main_box main_brochure">
			<a href="/pr/socialNews_list">			
				<h2>뉴스</h2>
				<p class="txt"><span class="main_img_txt">한화63시티</span>를 <br />알기 쉽고 편하게 <br />만나보십시오!</p>
				<span class="txt_go">go</span>
			</a>
		</section>
		<!-- <section class="main_box main_brochure">
			<a href="javascript:alert('준비중입니다.');">
				<h2>브로슈어</h2>
				<p class="txt">한화63시티를 <br />알기 쉽고 편하게 <br />만나보십시오!</p>
				<span class="txt_go">go</span>
			</a>
		</section> -->
		<section class="main_box main_lease">
			<a href="/business/leasing_intro">
				<h2>임대 정보</h2>
				<p class="txt">임대 정보에 관한 <br />컨설팅을 알려주는<br />간편 서비스</p>
				<span class="txt_go">go</span>
			</a>
		</section>
		<section class="main_box main_cs">
			<a href="/cs/contact">
				<h2>담당자 정보</h2>
				<p class="txt"><span class="main_img_txt">한화63시티</span>의<br />궁금하신 사항을<br />알려드립니다.</p>
				<span class="txt_go">go</span>
			</a>
		</section>
		<section class="main_box main_other">
			<div class="report_area">
				<a href="/pr/office_list">
					<h2>오피스마켓리포트</h2>
					<p class="txt">시장분석 전문가</p>
				</a>
			</div>
			<div class="down_area">
				<c:choose>
					<c:when test="${empty oneFileVO.boardID}">
						<a href="javascript:alert('준비중입니다.');">
					</c:when>
					<c:otherwise>						
						<a href="/comm/oneFileDownload?boardID=${oneFileVO.boardID}">
					</c:otherwise>
				</c:choose>
					<h2>임대안내문 내려받기</h2>
					<p class="txt">최고의 전문가가 제안하는<br />Total Solution</p>
				</a>
			</div>
		</section>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script src="/resources/js/slick.min.js"></script>
<script>
	$(function(){
		MYAPP.Menu.init(0, 0, 0);
		mainFunc.init();
	});

	//main js
	var mainFunc = (function($){
		var init;
		var _visualSlider, _quickSlider, _quickSearch;
		
		init = function(){
			_visualSlider();
			_quickSlider();
			_quickSearch();
		};

		//visual slider
		_visualSlider = function(){
			$(".visual_slider .btn_go").css("visibility","visible");
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
					$this.text("시작").removeClass("pause").addClass("play");
					$(".visual_slider").slick('slickPause');
				}else {
					$this.text("정지").removeClass("play").addClass("pause");
					$(".visual_slider").slick('slickPlay');
				}
			});
		};

		//quick slider
		_quickSlider = function(){
			$(".quick_slider").slick({ 
				fade: false,
				infinite: true,
				autoplay: false,
				arrows:true,
				prevArrow: "<a href='javascript:;' class='slick-prev'>이전</a>",
				nextArrow: "<a href='javascript:;' class='slick-next'>다음</a>",
				draggable :false,
				slidesToShow: 7,
				slidesToScroll: 7,
				speed: 600,
				dots: false,
				focusOnSelect: false
			});
		};

		//quick search
		_quickSearch = function(){
			var $btnOpen = $(".quick_open"),
				$btnClose = $(".quick_close"),
				$quickWrap = $(".main_quick");
			
			$btnOpen.on("click", function(){
				TweenMax.to($quickWrap, .5, {css:{"visibility":"visible", y:-183}, ease:Power4.easeOut});
			});
			$btnClose.on("click", function(){
				TweenMax.to($quickWrap, .5, {css:{y:0}, ease:Quint.easeOut});
				TweenMax.to($quickWrap, .1, {css:{"visibility":"hidden"}, delay:0.3});
			});
		};

		return{
			init: init
		}
	})(jQuery);
</script>
</body>
</html>