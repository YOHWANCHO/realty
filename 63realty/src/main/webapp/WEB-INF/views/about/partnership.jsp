<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>업무제휴 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 회사소개 &gt; <strong>실적 및 제휴</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_about.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>실적 및 제휴</h2></div>
		<div class="tabmenu">
			<ul>
				<li><a href="/about/achievement">주요실적</a></li>
				<li class="on"><a href="/about/partnership">업무제휴</a></li>
				<li><a href="/about/membership">가입단체</a></li>
			</ul>
		</div>

		<ul class="partner_list">
			<li>
				<div class="img_area"><img src="/resources/img/partnership_img01.gif" alt="" /></div>
				<div class="txt_area">
					<p class="date">2009-03-04</p>
					<p class="txt">한국태양광발전협동조합 업무제휴 협정체결</p>
				</div>
			</li>
			<li>
				<div class="img_area"><img src="/resources/img/partnership_img02.gif" alt="" /></div>
				<div class="txt_area">
					<p class="date">2008-12-04</p>
					<p class="txt">충북대학교 WEPS추진 업무제휴 협정체결</p>
				</div>
			</li>
			<li>
				<div class="img_area"><img src="/resources/img/partnership_img03.gif" alt="" /></div>
				<div class="txt_area">
					<p class="date">2005-06-23</p>
					<p class="txt">주식회사 코리츠 업무제휴 협정체결</p>
				</div>
			</li>
			<li>
				<div class="img_area"><img src="/resources/img/partnership_img04.gif" alt="" /></div>
				<div class="txt_area">
					<p class="date">2004-09-17</p>
					<p class="txt">日本 미츠비시 에스테이트 (주)업무제휴 협정체결</p>
				</div>
			</li>
		</ul>		
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(1, 5, 0);
	});
</script>
</body>
</html>