<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>복지제도 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 채용안내 &gt; <strong>복지제도</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_recruit.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>복지제도</h2></div>
		<h3 class="recruit_title mt0">복리후생</h3>
		<p class="recruit_txt1 mt0">한화63시티는 직원을 가족같이 생각하는 마음으로 다양한 복리후생을 지원합니다.</p>
		<ul class="welfare_list">
			<li class="li1">
				<h4><strong>01<br />생활안정지원</strong></h4>
				<ul>
					<li>경조비 / 경조 휴가</li>
					<li>임직원 자녀 학자금 지원</li>
					<li>전 직원 단체 상해보험 가입</li>
				</ul>
			</li>
			<li class="li2">
				<h4><strong>02<br />WITH 일·가정 양립지원</strong></h4>
				<ul>
					<li>Moms Package 축하선물</li>
					<li>출산 전 근로시간 단축근무</li>
					<li>취학 전 후 돌봄휴가</li>
				</ul>
			</li>
			<li class="li3">
				<p><strong>03<br />회사생활지원</strong>
				<ul>
					<li>창립기념일/근로자의 날 기념품 지급</li>
					<li>생일 기념일 선물 지급</li>
					<li>장기근속자 포상</li>
				</ul>
			</li>
			<li class="li4">
				<p><strong>04<br />여가활동지원</strong></p>
				<ul>
					<li>하계 휴양시설 지원</li>
					<li>Refresh 휴가제도</li>
					<li>동호회 지원</li>
					<li>한화리조트 지원</li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(4, 4, 0);
	});
</script>
</body>
</html>