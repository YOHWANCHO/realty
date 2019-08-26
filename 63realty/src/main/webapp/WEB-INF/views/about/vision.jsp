<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>비전 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 회사소개 &gt; <strong>비전</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_about.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>비전</h2></div>
		<!-- <p class="vision_txt">국내 초고층빌딩 관리의 선구자에서<br /><strong>부동산 종합 서비스 기업</strong>으로 도약합니다.</p> -->
		<div class="vision_img">
			<div class="hidden">
				<h3>Value Chain No.1</h3>
				<ul>
					<li>Value Chain - 본원의 기업활동부터 지원까지 업무 각 분야</li>
					<li>No.1 - 최고, 1등, 리더, 전문가</li>
					<li>부동산 종합 자산관리 서비스 - 부동산, 에너지 등 자산 관리 전 분야</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(1, 3, 0);
	});
</script>
</body>
</html>