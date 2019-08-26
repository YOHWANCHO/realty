<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>인재상 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 채용안내 &gt; 인재육성 &gt; <strong>인재상</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_recruit.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>인재상</h2></div>
		<div class="right_people">
			<div class="hidden">
				<p><strong>도전(Challenge)하는 사람<br /> 기존의 틀에 안주하지 않고 변화와 혁신을 통해 최고를 추구합니다.</strong></p>
				<ul>
					<li>맡은 분야에서 최고가 되기 위해 적극적인 자기개발을 하는 사람</li>
					<li>열린 사고와 창의적 발상으로 새로운 발안과 기회를 찾아내는 사람</li>
					<li>할 수 있다는 자신감으로 도전적인 목표를 설정하고 달성하는 사람</li>
				</ul>
				<p><strong>헌신(Dedication)하는 사람<br /> 회사, 고객, 동료와의 인연을 소중히 여기며 보다 큰 목표를 위해 혼신의 힘을 다합니다.</strong></p>
				<ul>
					<li>우리를 먼저 생각하며 공동의 목표를 최우선으로 여기는 사람</li>
					<li>고객과의 약속을 지키며 가치를 지속적으로 창출하는 사람</li>
					<li>공동운명체 의식으로 서로의 가능성을 믿으며 협력하는 사람</li>
				</ul>
				<p><strong>정도(Integrity)를 지키는 사람<br /> 자긍심을 바탕으로 원칙에 따라 바르고 공정하게 행동합니다.</strong></p>
				<ul>
					<li>눈앞의 이익에 흔들리지 않고 원칙에 따라 정직하게 행동하는 사람</li>
					<li>공과 사를 구분하여 능력과 성과에 따라 공정하게 대우하는 사람</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(4, 2, 1);
	});
</script>
</body>
</html>