<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>사업소개 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; 투자자문 &gt; <strong>사업소개</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>사업소개</h2></div>
		<h3><img src="/resources/img/investment_title.gif" alt="한화 63시티의 투자자문 서비스란?" /></h3>
		<p class="txt_style2 mt10">부동산의 매입, 매각에 따른 수익의 안전성 확보 및 투자수익 창출을 위하여 오랜 경험과 실적을 보유한 검증된 부동산 전문가들이<br /> 최상의 서비스를 준비하고 있습니다. </p>
		<div class="business_img bg3">
			<p class="txt1"><strong>Investment</strong> Advisory</p>
			<p class="txt2">투자자문 서비스</p>
			<p class="txt3">운영 투자수익 창출을 위한 전문적인 자문서비스를<br /> 통해 최적의 성과를 이끌어 내고 있습니다.</p>
		</div>
		<h3 class="tit_org">주요서비스</h3>
		<div class="investment_img02">
			<div class="hidden">
				<h4>한화63시티 투자자문 서비스</h4>
				<ol>
					<li>
						<h5>투자자문 및 컨설팅서비스</h5>
						<p>시장분석 개발 및 투자자문, 수익성 분석, 적정 매입, 매각가 산정, 적정 임대가 산정, 자산실사, 권리분석, 사업 타당성 분석 등 컨설팅 서비스를 제공해드립니다.</p>
					</li>
					<li>
						<h5>매입 / 매각 자문서비스</h5>
						<p>합리적인 입지, 수익성 분석에서 정확한 자산실사와 금융구조자문, 투자가능 부동산 잠재 매수사 발굴까지 매입/매각의 모든 프로세스에 대한 자문서비스를 제공합니다.</p>
					</li>
					<li>
						<h5>리서치 및 마켓 리포트 발행</h5>
						<p>Office Market Report/Weekly Report발행하여 오피스 시장 및 지역 분석 예측, 시장 트렌드 및 주요 정보를 수집하여 시장 동향을 분석해 드립니다.</p>
					</li>
				</ol>
			</div>
		</div>
		<h3 class="tit_org">업무 흐름도</h3>
		<div class="investment_img03">
			<div class="hidden">
				<h4>투자자문 서비스</h4>
				<p>대상물건의 입지/부속요인 검토 → 법률 및 투자 수익성 분석 → 종합부동산 컨설팅서비스 → Market Research(시장 동향분석 및 예측) &gt; 반복 실행</p>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 3, 1);
	});
</script>
</body>
</html>