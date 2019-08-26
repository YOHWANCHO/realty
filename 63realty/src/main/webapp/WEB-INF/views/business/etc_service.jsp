<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>기타 엔지니어 서비스 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; 엔지니어링 &gt; <strong>기타 엔지니어 서비스</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>기타 엔지니어 서비스</h2></div>
		<p class="txt_style2">깨끗한 실내환경을 위하여 정기적인 세관작업 및 DUCT 청소를 실시하여 유해 세균을 원천적으로 방지합니다.</p>
		<h3 class="tit_org">열원기기 세관 / Over – Haul 공사</h3>
		<ul class="txt_note v2 mt10">
			<li>정기적인 검사, 꾸준한 유지관리 및 세관은 열효율은 물론 장기 사용을 위한 기기관리의 3대 요소입니다.</li>
			<li>한화 63시티는 전문 인력을 파견하여 열원기기의 수명연장을 위하여 특별한 서비스를 제공해 드립니다.</li>
		</ul>
		<div class="etcService_img01">
			<div class="hidden">
				<ul>
					<li>검사
						<ul>
							<li>연관식, 노통연관식, 수관식보일러 검사 및 세관공사, 보일러 연비 측정 및 공연비 조정, 효율적인 운전관리</li>
						</ul>
					</li>
					<li>관리
						<ul>
							<li>흡수, 터보, 저온터보, 압축식, 왕복등</li>
							<li>냉동기 오버홀 및 세관공사</li>
							<li>냉동기 효율측정 및 운전관리</li>
							<li>향온 향습기 설치 및 유지관리</li>
						</ul>
					</li>
					<li>필요성
						<ul>
							<li>열효율 증대 및 에너지 절감</li>
							<li>안전사고 예방</li>
							<li>장비의 수명 연장</li>
							<li>수질관리, 장비운전의 효율성</li>
							<li>운전중의 문제점 해결</li>
							<li>성능 및 개방검사</li>
							<li>스케일 및 슬럿지 제거</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>			
		<h3 class="tit_org">주방후드 및 닥트 청소</h3>
		<ul class="txt_note v2 mt10">
			<li>각종 오염의 산실 탁트내 슬럿지, 정기적인 점검과 청소로 최적의 환경을 유지 할 수 있습니다.</li>
			<li>한화63시티는 전문 특수 장비와 초음파 세척기등 각종 장비를 사용하여 100% 제거해 드립니다.</li>
		</ul>
		<div class="etcService_img02">
			<div class="hidden">
				<h4>Process</h4>
				<ul>
					<li>고객 요청</li>
					<li>현장방문 오염도 확인</li>
					<li>도면확인 및 범위선정</li>
					<li>계약체결</li>
					<li>도면정리 계획수립</li>
					<li>작업실시</li>
					<li>준공서류 제출</li>
				</ul>
				<h4>필요성</h4>
				<ul>
					<li>화재예방 (후드화재 발생빈번)</li>
					<li>주방내부 환경개선</li>
					<li>미생물 발생억제</li>
					<li>질병 예방</li>
					<li>소음 감소 및 효율증대</li>
					<li>에너지절감 및 공기흐름 개선</li>
				</ul>
			</div>
		</div>
		<h3 class="tit_org">공조기 필터 교체</h3>
		<ul class="txt_note v2 mt10">
			<li>실내환경 오염으로 인한 두통, 만성피로, 알레르기, 호흡기질환, 집중력감소 등을 일으키는 빌딩 증후군 및 정압상승에 의한 에너지 증가를<br /> 적절한 교체주기를 통하여 감소시킬 수 있습니다.</li>
		</ul>
		<div class="mt25 ac"><img src="/resources/img/etc_service_img03.jpg" alt="" /></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 5, 5);
	});
</script>
</body>
</html>