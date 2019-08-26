<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>시설관리 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; <strong>시설관리</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>시설관리</h2></div>
		<h3><img src="/resources/img/facility_title.gif" alt="한화 63시티의 시설관리란?" /></h3>
		<p class="txt_style2 mt10">20여년간 축적해온 최고의 기술과 노하우, 그리고 장인정신이 살아있는 서비스를 토대로 21세기 빌딩관리와 MARKET BEST를 추구합니다. 전기, 기계, 설비, 방재, 통신시설 등의 시설물 보수와 운영, 빌딩 내 안내, 보안, 미화, 위생 등 빌딩의 경영, 운영, 유지관리에 이르기까지 전 분야에 걸친 종합적 빌딩관리서비스를 제공하고 있습니다.</p>
		<div class="business_img bg4">
			<p class="txt1"><strong>Facility</strong> Management</p>
			<p class="txt2">시설관리</p>
			<p class="txt3">20년간 축적한 기술과 노하우로 21세기 빌딩관리의<br /> MARKET BEST를 실현합니다.</p>
		</div>
		<h3 class="tit_org">주요서비스</h3>
		<div class="facility_img02">
			<div class="hidden">
				<h4>한화63시티 시설관리</h4>
				<ol>
					<li>
						<h5>시설물 유지관리</h5>
						<p>건물 관리, 운영 계획 및 실행</p>
					</li>
					<li>
						<h5>미화/주차/보안 관리</h5>
						<p>아웃소싱 업체 관리 및 통제</p>
					</li>
					<li>
						<h5>공사관리 감독</h5>
						<p>입주사 인테리어 및 자체 공사 관리 감독</p>
					</li>
					<li>
						<h5>에너지 관리</h5>
						<p>지속적인 에너지 사용 현황을 모니터링 효율화 방안을 모색, 대안 마련</p>
					</li>
					<li>
						<h5>시설물 안전 점검</h5>
						<p>시설물, 소방 안전점검 자체 실시 가능</p>
					</li>
					<li>
						<h5>시설물 공사</h5>
						<p>건물의 소방시설물 공사 등</p>
					</li>
				</ol>
			</div>
		</div>
		<h3 class="tit_org">업무 흐름도</h3>
		<div class="facility_img03">
			<div class="hidden">
				<ol>
					<li>CLIENT</li>
					<li>관리의뢰</li>
					<li>소유주 빌딩 자산실사
						<ul>
							<li>관리운영 계획</li>
							<li>관리용역범위</li>
							<li>관리용역단가 산정</li>
						</ul>
					</li>
					<li>제안(CLIENT)</li>
					<li>협의 및 의사결정</li>
					<li>시설관리 용역 계약
						<ul>
							<li>아웃소싱 업체계약</li>
							<li>FM운영단 건물 인수/투입</li>
							<li>빌딩관련 서류 인수</li>
						</ul>
					</li>
					<li>시설관리
						<ul>
							<li>건물시설물 유지, 관리</li>
							<li>용역사 관리(미화/청소/경비 등)</li>
							<li>공사관리 감독</li>
							<li>입주사 관리 등</li>
						</ul>
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 4, 0);
	});
</script>
</body>
</html>