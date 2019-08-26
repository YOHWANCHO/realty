<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>고객의 소리 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 고객지원 &gt; <strong>고객의 소리</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_cs.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>고객의 소리</h2></div>
		<p class="vision_txt">고객님의 의견을 <strong class="color_org">적극 검토</strong>하여<br /><strong class="color_org">보다 나은 서비스</strong>를 제공하도록 노력하겠습니다.</p>
		<div class="complete_box">
			<p class="txt1">고객님께서 작성하신 내용이 접수되었습니다.</p>
			<p class="txt2"><img src="/resources/img/tit_63.png" alt="한화63시티" />고객의 소리를 이용하여 주셔서 감사합니다.</p>
			<div class="logo"><img src="/resources/img/logo_63.png" alt="한화63시티" /></div>
		</div>

		<div class="btn_center">
			<a href="/cs/voc_list" class="btn_m1">확인</a>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(5, 4, 0);
	});
</script>
</body>
</html>