<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Vision | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; About Us &gt; <strong>Vision</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_about.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Vision</h2></div>
		<p class="vision_txt">We are transforming ourselves from the country’s leader in high-rise building management<br /><strong>to a professional property management services provider.</strong></p>
		<div class="vision_img">
			<div class="hidden">
				<h3>Value Chain No.1</h3>
				<ul>
					<li>Value Chain - Support for all your business field activities</li>
					<li>No.1 - The Best, leader and expertis</li>
					<li>to a professional property management services provider - All industries including Real Estate, Energy, Asset Management</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(1, 3, 0);
	});
</script>
</body>
</html>