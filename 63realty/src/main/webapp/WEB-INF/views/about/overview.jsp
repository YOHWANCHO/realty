<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>회사개요 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 회사소개 &gt; <strong>회사개요</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_about.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>회사개요</h2></div>
		<div class="overview_img"><img src="/resources/img/overview_img01.jpg" alt="" /></div>
		<dl class="overview_info">
			<dt>대표자</dt>
			<dd>김광성</dd>
			<dt>종업원수</dt>
			<dd>816명</dd>
		</dl>
		<dl class="overview_info">
			<dt>회사명</dt>
			<dd>㈜한화63시티</dd>
			<dt>자본금</dt>
			<dd>100억</dd>
		</dl>
		<dl class="overview_info">
			<dt>설립일</dt>
			<dd>1986년 5월1일</dd>
			<dt>주소</dt>
			<dd>서울특별시 영등포구 여의도동 60번지</dd>
		</dl>
		<div class="overview_box">
			<div class="left_area">
				<h3>사업영역</h3>
				<p>자산관리, 시설관리, 임대차마케팅, 투자자문<br/>시설물 안전점검, 소방시설점검 및 감리, 전기 및 정보통신</p>
			</div>
			<div class="right_area">
				<h3>주요 관리자산</h3>
				<p>한화생명 63빌딩 및 한화생명 38여개사옥<br/>한화빌딩, 소공동사옥, 태평로사옥, 서울역사, 청량리역사<br/>갤러리아(불당, 진주), 네이버그린팩토리, 부산 아모레퍼시픽<br/>부산 센텀리더스마크, 사학연금(서울, 나주, 둔산, 오류, 부산)<br/>상암IT타워, 더작은재단, US-BMC, 경상북도 신청사<br/>한화데이터센터, 신한은행데이터센터, 네이버춘천데이터센터 등</p>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(1, 2, 0);
	});
</script>
</body>
</html>