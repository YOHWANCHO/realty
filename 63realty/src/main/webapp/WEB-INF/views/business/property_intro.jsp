<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>




<title>사업소개 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; 자산관리 &gt; <strong>사업소개</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>사업소개</h2></div>
		<h3><img src="/resources/img/property_title.gif" alt="한화 63시티의 자산관리란?" /></h3>
		<p class="txt_style2 mt10">임대수익을 증대시키고 부동산 경영과 관리에 소요되는 제반 비용을 절감시켜 부동산 자산가치를 극대화하고 있습니다. 또한 입주사의<br /> 부동산 자산관리계획 수립, 운영, 피드백 등을 통해 소유주와 임차인 모두를 만족시키는 최고의 부동산서비스를 제공하고 있습니다.</p>
		<div class="business_img bg1">
			<p class="txt1"><strong>Property</strong> Management</p>
			<p class="txt2">자산관리</p>
			<p class="txt3">365일 진보하는 자산관리 서비스로 100% 고객만족과<br /> 자산가치 극대화를 추구하고 있습니다.</p>
		</div>
		<h3 class="tit_org">주요서비스</h3>
		<div class="property_img02">
			<div class="hidden">
				<h4>한화63시티 자산관리</h4>
				<ol>
					<li>
						<h5>임대차 및 건물운영 관리</h5>
						<ul>
							<li>공실 관리 및 적극적 임대 마케팅</li>
							<li>LEASING PACKAGE 개발</li>
							<li>주기적 성과 측정보고/분석<br /><strong>[분기/월별 PM리포트,예산 실적 보고서 등]</strong></li>
							<li>입주사 만족 서비스<br /><strong>[지속적 입주사 및 이용고객 CS 프로그램 운영]</strong></li>
						</ul>
					</li>
					<li>
						<h5>자본적 지출 및 공사관리</h5>
						<ul>
							<li>입주사 인테리어 관리 감독</li>
							<li>시설물관련 공사 및 관리 감독</li>
							<li>체계적 자본지출 계획 및 실행을 통한 자산가치 유지 및 증대</li>
						</ul>
					</li>
					<li>
						<h5>회계 및 재무관리</h5>
						<ul>
							<li>연간 운영 예산 작성 및 주기적 운영 보고</li>
							<li>임대료, 관리비 수납업무</li>
							<li>건물보유세 관련 대납업무</li>
							<li>에너지 관련 비용 대납 및 효율적 관리</li>
						</ul>
					</li>
					<li>
						<h5>법률검토</h5>
						<ul>
							<li>빌딜관리시 발생되는 법률적 소송 업무 </li>
						</ul>
					</li>
				</ol>
			</div>
		</div>
		<h3 class="tit_org">업무 흐름도</h3>
		<div class="property_img03">
			<div class="hidden">
				<ol>
					<li>CLIENT</li>
					<li>자산관리의뢰</li>
					<li>자산실사
						<ul>
							<li>물리심사</li>
							<li>현 관리 실태 조사</li>
							<li>시장조사 등</li>
						</ul>
					</li>
					<li>자산실사 계획수립
						<ul>
							<li>A. 수익측면
								<ul>
									<li>LEASING PACKAGE 개발</li>
									<li>공실관리 계획</li>
									<li>리모델링/리노베이션등 투자 검토</li>
								</ul>
							</li>
							<li>B. 비용측면
								<ul>
									<li>관리용역 검토</li>
									<li>관리비 효율 검토</li>
									<li>세금관리/체계적 예산 관리</li>
								</ul>
							</li>
							<li>C.관리측면
								<ul>
									<li>TENANT 서비스 계획</li>
									<li>PM/FM 업무 SYSTEM화</li>
									<li>물리적/재무적/법적 RISK HEDGING</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>제안(CLIENT)</li>
					<li>효율적 관리를 통한 수익증대 및 자산가치 증대</li>
					<li>자산관리
						<ul>
							<li>임대관리(신규/해지/갱신 등)</li>
							<li>재무관리(임/관리비, 운영 비용,세금 등)</li>
							<li>빌딩관리(보고서를 통한 운영의 투명화, 용역사 관리, 시설관리)</li>
							<li>법적관리(빌딩관리시 발생하는 법률적 소송 관련 업무)</li>
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
		MYAPP.Menu.init(2, 1, 1);
	});
</script>
</body>
</html>