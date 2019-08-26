<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>환경안전보건경영 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 홍보센터 &gt; 환경안전보건경영 &gt; <strong>환경안전보건경영</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>환경안전보건경영</h2></div>
		<div class="environment_box">
			<p class="txt1"><strong>지속 가능한 발전과 사회적 책임을 완수하기 위해</strong><br />세계수준의 환경 안전 시스템을 구축하여 환경안전 보호 정책을<br />추진하고 있습니다.</p>
			<div class="ac"><img src="/resources/img/environment_img.gif" alt="eco YHES" /></div>
			<p>한화63시티는 한화그룹의 '환경안전보건 방침 *ECO YHES' 을 토대로 전체 사업 부문의 활동, 제품, 서비스로 인해 발생되는 환경영향<br /> 및 위험성을 최소화하기 위하여 지속적인 개선을 시행하며, 쾌적하고 안전한 사업장을 만들고 지역사회에 기여하는 선도적인 기업의<br /> 역할을 수행하고 있습니다.</p>
			<p class="color_brown">* ECO YHES <br />보건(Health), 환경(Enviroment), 안전(Safety)를 뜻하는 HES와 'YES'의 조합을 숲(환경상징)의 형태에 담아 기업의 지속적인 발전과 사회적 책임을<br /> 다하고자 하는 한화 기업경영의 고유가치입니다.</p>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 5, 1);
	});
</script>
</body>
</html>