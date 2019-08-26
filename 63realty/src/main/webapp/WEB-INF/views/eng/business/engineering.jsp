<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Intro | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; Our Services &gt; Engineering &gt; <strong>Intro</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Intro</h2></div>
		<p class="txt_style2">We offer the ultimate in professional manpower, skills, and equipment Hanwha 63City, for the very best in engineering services</p>
		<div class="business_img bg5">
			<p class="txt1"><strong>Engineering</strong> Service</p>
			<p class="txt2">Experience the topnotch scientific and systematic <br />engineering service of Hanwha 63 City that does <br />not allow any loose ends.</p>
		</div>
		<p class="txt_style2 mt30">The best way to guarantee a building’s value and safety is by conducting regular inspections.</p>
		<p class="txt_style2 mt20">Hanwha 63City’s systematic facilities safety audit system uses Korea’s very best engineers and equipment.</p>
		<div class="mt25"><img src="/resources/eng/img/engineering_img02.jpg" alt="" /></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 5, 1);
	});
</script>
</body>
</html>