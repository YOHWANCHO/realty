<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>담당자 정보 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 고객지원 &gt; <strong>담당자 정보</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_cs.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>담당자 정보</h2></div>
		<h3 class="tit_h3">서비스 센터</h3>
		<p class="contact_txt">고객님에게 <strong class="color_org">빠른 소통</strong>을 약속 드리며<br /><strong class="color_org">감동</strong>을 선물해 드리겠습니다.</p>
		<div class="contact_box">
			<div class="item">
				<p class="txt_name">시설물관련 고객지원</p>
				<p class="txt_tel">02-789-6699</p>
				<p class="txt_mail"><a href="mailto:zet1114@hanwha.com">zet1114@hanwha.com</a></p>
			</div>
			<div class="item">
				<p class="txt_name">Customer Service</p>
				<p class="txt_tel">02-789-5619</p>
				<p class="txt_mail"><a href="mailto:hhkim@hanwha.co.kr">hhkim@hanwha.co.kr</a></p>
			</div>
			<div class="item">
				<p class="txt_name">부동산자산·시설관리</p>
				<p class="txt_tel">02-789-6539</p>
				<p class="txt_mail"><a href="mailto:min9lee@hanwha.com">min9lee@hanwha.com</a></p>
			</div>
			<div class="item">
				<p class="txt_name">임대차마케팅</p>
				<p class="txt_tel">02-789-5338</p>
				<p class="txt_mail"><a href="mailto:jylee1227@hanwha.com">jylee1227@hanwha.com</a></p>
			</div>
			<div class="item">
				<p class="txt_name">리서치</p>
				<p class="txt_tel">02-789-6645</p>
				<p class="txt_mail"><a href="mailto:sujigwak@hanwha.com">sujigwak@hanwha.com</a></p>
			</div>
		</div>
		<ul class="txt_note">
			<li>고객님의 소중한 질문에 빠른 시간에 답변해 드리겠습니다.</li>
			<li>고객님을 먼저 생각하는 한화63시티가 되겠습니다.</li>
		</ul>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(5, 3, 0);
	});
</script>
</body>
</html>