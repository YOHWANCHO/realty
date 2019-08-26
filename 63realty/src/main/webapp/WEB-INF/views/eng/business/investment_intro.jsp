<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Investment Advisory | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; Our Services &gt; <strong>Investment Advisory</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Investment Advisory</h2></div>
		<h3 class="tit_h3">What is Hanwha 63City’s Investment Advisory?</h3>
		<p class="txt_style2 mt10">Real estate professionals with broad experience offer you total real estate consulting service from site appraisal to legal inspection of investment profitability.</p>
		<div class="business_img bg3">
			<p class="txt1"><strong>Investment</strong> Advisory</p>
			<p class="txt2">Our professional consulting service for creating <br />investment profits will help you perform <br />as best as you can.</p>
		</div>
		<h3 class="tit_org">Key Services</h3>
		<div class="investment_img02">
			<div class="hidden">
				<h4>Hanwha 63City Investment Advisory</h4>
				<ol>
					<li>
						<h5>Investment Advisory and Consulting</h5>
						<p>We provide the total consulting service including market analysis, investment advisory, profit analysis, acquisition &amp; deposition, feasibility analysis.</p>
					</li>
					<li>
						<h5>Advisory on acquisition &amp; disposal</h5>
						<p>Investment advisory upon every process of acquisition &amp; disposal including due diligence on site and profitability appraisal is provided.</p>
					</li>
					<li>
						<h5>Publication of research and market report.</h5>
						<p>Office Market Report/Weekly Report gives you perspective on office market and market trends through the information collected and analyzed by our professionals.</p>
					</li>
				</ol>
			</div>
		</div>
		<h3 class="tit_org">Workflow</h3>
		<div class="investment_img03">
			<div class="hidden">
				<h4>Investment Advisory Survice</h4>
				<p>Site/other factor appraisal of the property. → Analysis on investment profitability and legal matter. → Total real estate consulting service → Market Research(Market Research) &gt; Repeat execution</p>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 3, 0);
	});
</script>
</body>
</html>