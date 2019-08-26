<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>리서치 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; 투자자문 &gt; <strong>리서치</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>리서치</h2></div>
		<p class="txt_style2">국내 오피스 시장의 주요 이슈 및 분석을 담은 분기/월간 Office Market Report와, 부동산 특집이슈를 다룬 Issue Brief를 발행하고<br /> 있습니다.</p>
		<ul class="research_box">
			<li>
				<h3>Office Market Report</h3>
				<img src="/resources/img/research_img01.jpg" alt="" />
			</li>
			<li>
				<h3>Issue Brief</h3>
				<img src="/resources/img/research_img02.jpg" alt="" />
			</li>
		</ul>
		<div class="btn_center"><a href="/pr/office_list" class="btn_m1">오피스 리포트 바로가기</a></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 3, 2);
	});
</script>
</body>
</html>