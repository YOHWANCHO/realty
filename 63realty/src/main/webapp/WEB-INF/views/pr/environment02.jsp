<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>환경안전보건방침 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 홍보센터 &gt; 환경안전보건경영 &gt; <strong>환경안전보건방침</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>환경안전보건방침</h2></div>
		<p><img src="/resources/img/environment_txt.gif" alt="한화63시티는 자산 및 시설관리 등 경영 활동 전 과정에서 환경/안전/보건을 우선하여 검토하며, 지속적인 기업발전과 사회적 책임완수를 위하여, 다음 사항을 적극 실천한다." /></p>
		<ul class="environment02_list">
			<li>
				<h3><span>01</span> 인간존중 경영활동</h3>
				<p>경영활동의 전 과정에서 고객 및 근로자,  한화63시티를 <br />대신하여 활동하는 사람에게 인명과 재산손실의 피해가 <br />발생하지 않도록 안전과 보건을 확보하며, 친환경적 <br />서비스를 지속적으로 개발한다.</p>
			</li>
			<li>
				<h3><span>02</span> 자원 및 에너지 효율적 이용</h3>
				<p>경영활동의 전 과정에서 소요되는  자원과 에너지를 <br />효율적으로 이용하며, 저탄소사회 실현과 자연환경 <br />보전을 위한 사용량 절감 및 오염물질의 배출 저감에 <br />노력한다.</p>
			</li>
			<li>
				<h3><span>03</span> 관련법규 준수와 지속적 개선</h3>
				<p>환경/안전/보건에 대한 국제 협약, 국내 법규, 조직이 <br />약속한 사항을 적극 준수하며, 환경/안전/보건 수준을 <br />지속적으로 향상시킨다.</p>
			</li>
			<li>
				<h3><span>04</span> 환경/안전/보건 경영 전원참여</h3>
				<p>모든 임직원/협력사 직원의 적극적인 환경/안전/보건 <br />경영 참여를 유도하며, 관련 교육을 지속적으로 <br />실시한다.</p>
			</li>
		</ul>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 5, 2);
	});
</script>
</body>
</html>