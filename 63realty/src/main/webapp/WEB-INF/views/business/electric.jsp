<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>전기 및 정보통신 공사 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; 엔지니어링 &gt; <strong>전기 및 정보통신 공사</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>전기 및 정보통신 공사</h2></div>
		<p class="txt_style2">63빌딩에서의 다년간의 경험과 국가공인 자격증 소지 전문 기술진들이 전기공사 정보통신공사, 설계, 시공, 보수 등 전문 공사를<br /> 진행해 드립니다.</p>
		<h3 class="tit_org">수-배전, 동력 분야</h3>
		<div class="electric_list">
			<div class="list_box">
				<div class="img"><img src="/resources/img/electric_img01.jpg" alt="" /></div>
				<ul>
					<li>수-배전설비 관리 신설 및 증설 공사</li>
					<li>간선공사 및 자동제어 공사</li>
					<li>원격 적산전력계 설치 운영 공사</li>
					<li>UPS,AVR,전산실 전원 설치 공사</li>
				</ul>
			</div>
			<div class="list_box">
				<div class="img"><img src="/resources/img/electric_img02.jpg" alt="" /></div>
				<ul>
					<li>동력설비 관리 신설 및 증설 공사</li>
					<li>mcc 인버터 설비 교체공사</li>
					<li>기계실 관련 motor,sump 등 설치</li>
					<li>빙축열 냉동기 전력 설치 공사</li>
					<li>기타 모든 전기공사</li>
				</ul>
			</div>
		</div>		
		<h3 class="tit_org">수-배전 진단분야</h3>
		<p class="txt_style2">수-배전설비의 열화상 카메라를 이용하여 T/R 및 케이블의 온도를 측정 최상의 상태를 유지 관리하여 드립니다.</p>
		<div class="electric_list">
			<div class="list_box">
				<div class="img"><img src="/resources/img/electric_img03.jpg" alt="" /></div>
				<ul>
					<li>수-배전설비 시설물 유지관리 (열화상 카메라로 T/R 온도측정)</li>
					<li>수-배전설비 최적관리</li>
				</ul>
			</div>
			<div class="list_box">
				<div class="img"><img src="/resources/img/electric_img04.jpg" alt="" /></div>
				<ul>
					<li>고효율 조명기기 선정 설치</li>
					<li>동력설비 고효율 장비 대체</li>
					<li>에너지진단 컨설팅 사후관리</li>
				</ul>
			</div>
		</div>		
		<h3 class="tit_org">조명 설비 분야</h3>
		<p class="txt_style2">조명 효율성을 진단하여 절전형 등기구 채용, 조도개선, LED LAMP 채용 등 조명공사를 진행해 드립니다.</p>
		<div class="electric_list">
			<div class="list_box">
				<div class="img"><img src="/resources/img/electric_img05.jpg" alt="" /></div>
				<ul>
					<li>절전형 등기구  채용 조도 개선</li>
					<li>인테리어 조명공사</li>
				</ul>
			</div>
			<div class="list_box">
				<div class="img"><img src="/resources/img/electric_img06.jpg" alt="" /></div>
				<ul>
					<li>지하주차장 LED 교체 조명개선</li>
					<li>조명 효율진단 및 에너지절감량 절감금액,설치비 회수기간 산정</li>
					<li>고급식당가 조명설치 공사</li>
				</ul>
			</div>
		</div>		
		<h3 class="tit_org">정보 통신 설비 분야</h3>
		<p class="txt_style2">63빌딩정보통신운영시설의 기술력을 바탕으로 모든 약전설비 설치 및 운영관리.</p>
		<div class="electric_list">
			<div class="list_box">
				<div class="img"><img src="/resources/img/electric_img07.jpg" alt="" /></div>
				<ul>
					<li>MDF 교환기 설치및 유지보수</li>
					<li>광케이블,네트워크 구축공사</li>
					<li>키 폰장치및 VMS 설치 공사</li>
					<li>모든 통신공사</li>
				</ul>
			</div>
			<div class="list_box">
				<div class="img"><img src="/resources/img/electric_img08.jpg" alt="" /></div>
				<ul>
					<li>방송설비 설치 공사</li>
					<li>CCTV 설치 공사</li>
					<li>영업장 DID(digital information display)SYSTEM 구축 공사</li>
					<li>무선통신보조설비 설치 공사</li>
				</ul>
			</div>
		</div>		
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 5, 4);
	});
</script>
</body>
</html>