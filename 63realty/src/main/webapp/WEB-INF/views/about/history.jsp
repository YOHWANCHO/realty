<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>연혁 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 회사소개 &gt; <strong>연혁</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_about.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>연혁</h2></div>
		<div><img src="/resources/img/history_img.jpg" alt="믿을 수 있는 자산관리 전문가 HIGHEST &amp; BEST USE OF REALITY" /></div>
		<!-- 연혁 리스트 -->
		<ul class="history_list">
			<li>
				<h3>2016</h3>
				<ul>
					<li>정부세종청사</li>
					<li>LH진주사옥 시설관리용역 수주(총연면적: 509,229 ㎡)</li>
				</ul>
			</li>
			<li>
				<h3>2015</h3>
				<ul>
					<li>넥슨판교사옥</li>
					<li>상암오벨리스크</li>
					<li>사학연금나주회관</li>
					<li>더작은재단 시설관리용역 수주</li>
				</ul>
			</li>
			<li>
				<h3>2014</h3>
				<ul>
					<li>아모레퍼시픽 설화수 빌딩 종합자산관리용역 수주(256,846 ㎡)</li>
					<li>나이스그룹 IDC 센터 시설관리용역 수주</li>
					<li>US –Air Force SITE 시설관리용역 수주</li>
				</ul>
			</li>
			<li>
				<h3>2013</h3>
				<ul>
					<li>신도림 디큐브시티 및 신한은행 데이터센터 종합관리용역 수주(249,308 ㎡)</li>
				</ul>
			</li>
			<li>
				<h3>2012</h3>
				<ul>
					<li>NHN 본사사옥(그린팩토리) 및 춘천 IDC센터 FM관리용역 수주</li>
				</ul>
			</li>
			<li>
				<h3>2011</h3>
				<ul>
					<li>사학연금공단 지방 5개회관 (서울,둔산,오류,나주,부산) 종합자산관리 수주(249,308㎡)</li>
					<li>H&amp;M 시설관리 전속계약체결(15개점)</li>
					<li>킨텍스 1,2전시장 FM운영 컨설팅 수행</li>
				</ul>
			</li>
			<li>
				<h3>2010</h3>
				<ul>
					<li>부산Y빌딩매입자문및물리실사</li>
					<li>제주U빌리지개발사업계획평가</li>
					<li>CBD오피스마켓분석컨설팅수행(삼일회계법인)</li>
					<li>광명역세권복합단지개발적정가치분석컨설팅</li>
				</ul>
			</li>
			<li>
				<h3>2009~2007</h3>
				<ul>
					<li>마포구 상암동 M빌딩 매입지원 컨설팅 수행</li>
					<li>종로K빌딩, 강남S사옥, 부산금정타워</li>
					<li>매입적정성 컨설팅 및 물리적실사 수행</li>
					<li>부산금정타워 자산관리용역 수행</li>
					<li>SK네트웍스 사옥 매각대행 수행</li>
					<li>아모레퍼시픽 부산사옥PM 및 나인스에비뉴 자산관리용역 수행</li>
				</ul>
			</li>
			<li>
				<h3>2006~2003</h3>
				<ul>
					<li>상암IT타워, 명동눈스퀘어, 서울역사 등 자산관리용역수행, H연수원운영관리</li>
					<li>컨설팅수행, 대한생명보유사옥PM계약체결(총35개동/608,803㎡)</li>
					<li>현대스위스타워 MRI 사무수탁계약체결 및 자산관리보고용역수행</li>
					<li>D증권 매각자산 조사 및 가치평가 컨설팅 수행</li>
					<li>시설물 유지관리 정밀점검 용역수행 (부산 침레병원, 소공동 지하보차도)</li>
					<li>시설물 유지관리 정밀점검 용역수행 (한화유통, 한화리조트, 신동아화재사옥 등)</li>
					<li>서울역사 시설관리용역 수주(79,917㎡)</li>
				</ul>
			</li>
			<li>
				<h3>2002~1986</h3>
				<ul>
					<li>[1986.6-1990.6]서울올림픽 및 아시안 게임 경기장 시설물 관리</li>
					<li>법인설립:㈜대생개발/63빌딩 시설물 운영관리</li>
					<li>대한생명보험㈜지방사옥 수임관리 개시</li>
					<li>전국QM분임조 경진대회 대통령상 2회 수상</li>
					<li>2002년 한화그룹계열사 편입</li>
					<li>㈜63시티 창립: 대생개발[자산관리],대생기업[식음/관광],63쇼핑[유통]통합</li>
				</ul>
			</li>
		</ul>
		<!-- //연혁 리스트 -->
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(1, 4, 0);
	});
</script>
</body>
</html>