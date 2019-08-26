<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>사업소개 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; 임대차 컨설팅 &gt; <strong>사업소개</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>사업소개</h2></div>
		<h3><img src="/resources/img/leasing_title.gif" alt="한화 63시티의 임대차  컨설팅 서비스란?" /></h3>
		<p class="txt_style2 mt10">초고층 빌딩의 임대영업전략과 축적된 임차인 관리노하우를 바탕으로 한 한화63시티는, 임차인 선호도 분석 및 심도 있는 시장분석과<br /> 더불어 과학적인 데이터베이스 와 NETWORK를 접목하여 한차원 높은 맞춤 임대차 컨설팅 서비스를 제공하고 있습니다.</p>
		<div class="business_img bg2">
			<p class="txt1"><strong>Leasing</strong> Service</p>
			<p class="txt2">임대차서비스</p>
			<p class="txt3">대한민국 최고의 전문가가 제안하는<br /> 임대차 Total Solution</p>
		</div>
		<h3 class="tit_org">주요서비스</h3>
		<div class="leasing_img02">
			<div class="hidden">
				<h4>한화63시티 임대차 컨설팅</h4>
				<ol>
					<li>
						<h5>임대 컨설팅 서비스</h5>
						<ul>
							<li>임대 계획 수립</li>
							<li>LEASING PACKAGE 개발</li>
							<li>적정 임대료/관리비 산출 HIGH Quality TENTANT Service</li>
							<li>계약 관리 (신규/변경/갱신/해지 등)</li>
							<li>임대료 및 관리비 수납</li>
							<li>TENANT 관리</li>
							<li>임대관련 소송</li>
						</ul>
					</li>
					<li>
						<h5>임차 컨설팅 서비스</h5>
						<ul>
							<li>물건 확보를 위한 시장조사</li>
							<li>임차 대상 건물 소유주 및 물건의 권리 현황조사, 담보 평가</li>
							<li>계약업무(신규/변경/갱신/해지 등)</li>
							<li>채권 회수 업무(보증금 회수)</li>
							<li>임차 관련 소송</li>
						</ul>
					</li>
				</ol>
			</div>
		</div>
		<h3 class="tit_org">업무 흐름도</h3>
		<div class="leasing_img03">
			<div class="hidden">
				<ol>
					<li>CLIENT</li>
					<li>임대/임차 의뢰</li>
				</ol>
				<ol>
					<li>CLIENT</li>
					<li>임대 컨설팅 서비스</li>
					<li>대상물건의 조사/분석
						<ul>
							<li>임대계획 수립</li>
							<li>임대 면적 산출 등</li>
						</ul>
					</li>
					<li>LEASING PACKAGE 개발
						<ul>
							<li>적정 임/관리비 산정 </li>
							<li>효율적 TENANT 관리</li>
							<li>기타 계약조건</li>
						</ul>
					</li>
					<li>마케팅/임차인 선정/협상
						<ul>
							<li>Portential tenant 발굴, 유치</li>
							<li>계약 조건 협상</li>
							<li>TENANT 구성(우량/일반 TENANT의 구성)</li>
						</ul>
					</li>
					<li>계약 체결
						<ul>
							<li>계약기간, 임/관리비, 기타조건 등</li>
						</ul>
					</li>
					<li>사후관리
						<ul>
							<li>임대관리(신규/해지/갱신 등)</li>
							<li>재무관리(임/관리비 수납 등)</li>
							<li>법적관리(임대관련 소송)</li>
						</ul>
					</li>
				</ol>
				<ol>
					<li>CLIENT</li>
					<li>임차 컨설팅 서비스</li>
					<li>시장조사 및 물건 확보
						<ul>
							<li>CLIENT의 요구 조건에 부합하는 임차 공간/입지 등 시장조사를 통한 물건 확보</li>
						</ul>
					</li>
					<li>임차대상물건 실사
						<ul>
							<li>대상 빌딩의 소유주, 건물상태, 계약 조건, 법적 상태 조사</li>
						</ul>
					</li>
					<li>임차대상빌딩 선정
						<ul>
							<li>임차대상 빌딩 소유주와 세부계약 협상</li>
						</ul>
					</li>
					<li>계약 체결
						<ul>
							<li>계약기간, 임/관리비, 기타조건 등</li>
						</ul>
					</li>
					<li>사후관리
						<ul>
							<li>임차관리(신규/해지/갱신 등)</li>
							<li>재무관리(임/관리비 지급 등)</li>
							<li>법적관리(임차관련 소송)</li>
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
		MYAPP.Menu.init(2, 2, 1);
	});
</script>
</body>
</html>