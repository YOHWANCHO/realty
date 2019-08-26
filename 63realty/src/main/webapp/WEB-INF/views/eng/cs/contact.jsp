<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Contact Us | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; Customer Support &gt; <strong>Contact Us</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_cs.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Contact Us</h2></div>
		<h3 class="tit_h3">Service Center</h3>
		<p class="contact_txt">Hanwha 63City is committed to <br /><strong class="color_org">speedy communications</strong> with its customers.</p>
		<div class="contact_box">
			<div class="item">
				<p class="txt_name">Facility Management</p>
				<p class="txt_tel">82-2-789-6699</p>
				<p class="txt_mail"><a href="mailto:zet1114@hanwha.com">zet1114@hanwha.com</a></p>
			</div>
			<div class="item">
				<p class="txt_name">Customer Service</p>
				<p class="txt_tel">82-2-789-5619</p>
				<p class="txt_mail"><a href="mailto:hhkim@hanwha.co.kr">hhkim@hanwha.co.kr</a></p>
			</div>
			<div class="item">
				<p class="txt_name">Property Management</p>
				<p class="txt_tel">82-2-789-6539</p>
				<p class="txt_mail"><a href="mailto:min9lee@hanwha.com">min9lee@hanwha.com</a></p>
			</div>
			<div class="item">
				<p class="txt_name">Leasing & Marketting</p>
				<p class="txt_tel">82-2-789-5338</p>
				<p class="txt_mail"><a href="mailto:jylee1227@hanwha.com">jylee1227@hanwha.com</a></p>
			</div>
			<div class="item">
				<p class="txt_name">Investment Advisory</p>
				<p class="txt_tel">82-2-789-6645</p>
				<p class="txt_mail"><a href="mailto:sujigwak@hanwha.com">sujigwak@hanwha.com</a></p>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(4, 1, 0);
	});
</script>
</body>
</html>