<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>History | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; About Us &gt; <strong>History</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_about.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>History</h2></div>
		<div><img src="/resources/eng/img/history_img.jpg" alt="HIGHEST &amp; BEST USE OF REALITY" /></div>
		<!-- history list -->
		<ul class="history_list">
			<li>
				<h3>2016</h3>
				<ul>
					<li>history contents</li>
				</ul>
			</li>
		</ul>
		<!-- //history list -->
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(1, 4, 0);
	});
</script>
</body>
</html>