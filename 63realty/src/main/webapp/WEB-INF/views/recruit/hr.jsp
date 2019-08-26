<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>인사제도 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 채용안내 &gt; <strong>인사제도</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_recruit.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>인사제도</h2></div>
		<h3 class="recruit_title mt0">직급체계</h3>
		<p class="recruit_txt1 mt0">한화63시티는 능력 및 성과주의를 지향하는 인사체계를 구성하고 있습니다.</p>
		<div class="mt20"><img src="/resources/img/hr_img01.gif" alt="3급-사원, 2을-대리, 2갑-과장, 1을-차장, 1갑-부장" /></div>
	
		<h3 class="recruit_title mt0">보상제도</h3>
		<p class="recruit_txt1 mt0">한화63시티는 개인 및 조직의 성과를 반영한 기본연봉과 성과급을 지급하고 있으며, 경영성과에 따른 수익을 <br />개인별 능력 및 업적을 기반으로 하여 보상하고 있습니다.</p>
		<ul class="recruit_txt3">
			<li>※ 기본연봉: 매년 성과 및 역량평가에 따른 기본연봉 책정 및 보상구조 구축</li>
			<li>※ 성과급 : 조직성과와 개인성과에 기반한 성과보상체계</li>
		</ul>
	
		<h3 class="recruit_title">평가제도</h3>
		<p class="recruit_txt1 mt0">업적평가는 보상과 연계되며 역량평가는 육성/교육 및 이동/배치, 채용 등에 활용</p>
		<p class="recruit_txt1 mt0">종합평가결과(업적평가 + 역량평가)는 보상 및 승진에 활용</p>
		<div class="mt40"><img src="/resources/img/hr_img02.gif" alt="업적평가 + 역량평가 = 종합평가" /></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(4, 3, 0);
	});
</script>
</body>
</html>