<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>시설물 안전점검 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; 엔지니어링 &gt; <strong>시설물 안전점검</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>시설물 안전점검</h2></div>
		<p class="txt_style2">시설물 정밀점검, 건설현장 정밀 안전 점검, 시설물 특별점검, 구조 보수공사 공법 검토 등 지속적이고 정기적으로 특수 안전 점검과 보수를 적시에 진행함으로서 건축물의 수명 및 시스템을 가장 적정하게 유지시켜 주는 한화63시티만의 안전진단시스템입니다.</p>
		<div class="mt30"><img src="/resources/img/safety_img01.jpg" alt="" /></div>
		
		<ul class="safety_list">
			<li><img src="/resources/img/safety_img02.jpg" alt="주차장 기울기 측정" /></li>
			<li><img src="/resources/img/safety_img03.jpg" alt="외부 건축물 기울기 측정" /></li>
			<li class="has_bl"><img src="/resources/img/safety_img04.jpg" alt="초음파 강도 측정" /></li>
			<li><img src="/resources/img/safety_img05.jpg" alt="초음파 강도 측정" /></li>
			<li><img src="/resources/img/safety_img06.jpg" alt="초음파 강도 측정" /></li>
			<li><img src="/resources/img/safety_img07.jpg" alt="초음파 강도 측정" /></li>
			<li class="has_bl"><img src="/resources/img/safety_img08.jpg" alt="반발 강도측정" /></li>
			<li><img src="/resources/img/safety_img09.jpg" alt="반발 강도측정" /></li>
			<li><img src="/resources/img/safety_img10.jpg" alt="초음파 철근탐사" /></li>
			<li><img src="/resources/img/safety_img11.jpg" alt="초음파 철근탐사" /></li>
			<li class="has_bl"><img src="/resources/img/safety_img12.jpg" alt="균열 거리측정" /></li>
			<li><img src="/resources/img/safety_img13.jpg" alt="균열 거리측정" /></li>
			<li><img src="/resources/img/safety_img14.jpg" alt="중성화측정 위치 CORE 작업" /></li>
			<li><img src="/resources/img/safety_img15.jpg" alt="중성화 시험" /></li>
			<li class="has_bl"><img src="/resources/img/safety_img16.jpg" alt="중성화측정" /></li>
			<li><img src="/resources/img/safety_img17.jpg" alt="중성화측정" /></li>
			<li><img src="/resources/img/safety_img18.jpg" alt="균열폭 점검(크랙모니터)" /></li>
			<li><img src="/resources/img/safety_img19.jpg" alt="크랙모니터 및 크랙콘 설치" /></li>
			<li class="has_bl"><img src="/resources/img/safety_img20.jpg" alt="균열폭 측정 (크랙확대경)" /></li>
			<li><img src="/resources/img/safety_img21.jpg" alt="균열폭 측정 (크랙확대경)" /></li>
			<li><img src="/resources/img/safety_img22.jpg" alt="균열폭 측정 (버어니어캘리퍼스)" /></li>
			<li><img src="/resources/img/safety_img23.jpg" alt="균열폭 측정 (버어니어캘리퍼스)" /></li>
			<li class="has_bl"><img src="/resources/img/safety_img24.jpg" alt="구조물 타격시험" /></li>
			<li><img src="/resources/img/safety_img25.jpg" alt="구조물 타격시험" /></li>
		</ul>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 5, 2);
	});
</script>
</body>
</html>