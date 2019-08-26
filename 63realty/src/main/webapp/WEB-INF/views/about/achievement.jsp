<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>실적 및 제휴 | 한화63시티</title>
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
				<li class="on"><a href="/about/achievement">주요실적</a></li>
				<%--<li><a href="/about/partnership">업무제휴</a></li>--%>
				<li><a href="/about/membership">가입단체</a></li>
			</ul>
		</div>

		<div class="achi_list">
			<div class="list_box">
				<div class="img"><img src="/resources/img/achi_img01.jpg" alt="" /></div>
				<h3>2013 ~ 2010</h3>
				<ul class="list">
					<li>서울형 가족친화경영 우수기업 선정<br />(출산·양육 및 교육지원제도 부문, 서울시)</li>
					<li>고용창출 100대 우수기업 선정<br />(고용노동부)</li>
					<li>㈜한화63시티 자산관리 전문 회사로 도약<br />[식음/문화사업부는 한화호텔앤드리조트(주)로 편입]</li>
					<li>H&amp;M [발주처:에이치앤엠헤네스 앤모리츠(주)2호점] <br />기술지원 서비스 계약체결 [755.16평 (7층/지하1층)]</li>
					<li>(주)한화갤러리아 센터시티점 시설관리 업무 수임<br />[연면적 33,440,41평(지하 6층/지상 10층)]</li>
					<li>그린홈,그린빌리지 태양광발전: 250kw</li>
					<li>KINTEX 제 2전시장 태양광 발전공사: 136Kw</li>
				</ul>
			</div>
			<div class="empty_space"></div>
			<div class="list_box">
				<div class="img"><img src="/resources/img/achi_img02.jpg" alt="" /></div>
				<h3>2009 ~ 2007</h3>
				<ul class="list">
					<li>자산관리사업부 인터넷 홈페이지”한화63리얼티”OPEN</li>
					<li>대한생명 마산사옥 경산남도 에너지 촉진대회 에너지절약 <br />우수건물표창</li>
					<li>PM및 FM분야 일본 미츠비시 에스테이트 위탁연수실시(3차)</li>
					<li>무선원격절전시스템 “WEPS(WIRELESS ELECTRIC <br />POWER SAVING SYSTEM)”사업추진</li>
					<li>정보통신 공사업 등록을 통한 E-비즈니스 환경구축사업 추진<br /></li>
					<li>부산 금정타워 PM,FM용역 수행</li>
					<li>태양광사업 진출(시스템개발,시공,설비 및 운영분야)</li>
				</ul>
			</div>
		</div>

		<div class="achi_list">
			<div class="list_box">
				<div class="img"><img src="/resources/img/achi_img03.jpg" alt="" /></div>
				<h3>2006 ~ 2003</h3>
				<ul class="list">
					<li>석탑산업훈장수상(2003년 에너지 절약 유공자)</li>
					<li>ISO14001,OHSA18001 인증획득</li>
					<li>고객만족경영대상 최우수상 수상(한국능률협회)</li>
					<li>PM및 FM분야 일본 미츠비시 에스테이트 위탁연수실시(1차)</li>
					<li>일본 미스비츠에스테이트(MITSUTBISH IESTATE.CO.LTD)와 업무제휴체결</li>
					<li>부동산 컨설팅 및 PM사업 착수</li>
					<li>PM및 FM분야 일본 미츠비시 에스테이트 위탁연수실시(2차)</li>
					<li>대한생명 보유 사옥 PM계약체결(35개동 608.803㎡)</li>
					<li>2006년 사회공헌활동 대상수상(한국언론인포럼)</li>
				</ul>
			</div>
			<div class="empty_space"></div>
			<div class="list_box">
				<div class="img"><img src="/resources/img/achi_img04.jpg" alt="" /></div>
				<h3>2002 ~ 1986</h3>
				<ul class="list">
					<li>서울올림픽 및 아시안 게임 경기장 시설물 관리[86.6-90.6]</li>
					<li>법인설립: ㈜대생개발/63빌딩 시설물 운영관리</li>
					<li>대한생명보험㈜지방사옥 수임관리 개시</li>
					<li>전국QM분임조 경진대회 대통령상 수상[2회]</li>
					<li>한화그룹계열사 편입[2002년]</li>
					<li>㈜63시티 창립-대생개발(자산관리),대생기업(식음,관광),<br />63쇼핑(유통)통합</li>
				</ul>
			</div>
		</div>
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