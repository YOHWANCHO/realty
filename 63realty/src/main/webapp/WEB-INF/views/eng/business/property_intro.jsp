<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Intro | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; Our Services &gt; Property Management &gt; <strong>Intro</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Intro</h2></div>
		<h3 class="tit_h3">What is Hanwha 63City’s property management?</h3>
		<p class="txt_style2 mt10">We maximize the value of real estate by increasing rents and reducing the cost of real estate management. We also provide real estate services that satisfy both the lessor and the lessee. This includes establishing property management plans, operating real estate, and offering feedback.</p>
		<div class="business_img bg1">
			<p class="txt1"><strong>Property</strong> Management</p>
			<p class="txt2">The advanced 365-day property management <br />service will ensure 100% customer satisfaction <br />and maximize property value.</p>
		</div>
		<h3 class="tit_org">Key Services</h3>
		<div class="property_img02">
			<div class="hidden">
				<h4>Hanwha 63City Property management</h4>
				<ol>
					<li>
						<h5>Leasing and Building Management</h5>
						<ul>
							<li>Vacancy management and aggressive lease marketing</li>
							<li>Leasing package development</li>
							<li>Periodical performance measurements, reporting, and analyses<br /><strong>[quarterly/monthly PM reports, budget and performance reports, etc.]</strong></li>
							<li>Service satisfying tenants<br /><strong>[Continuous tenant and customer CS program]</strong></li>
						</ul>
					</li>
					<li>
						<h5>Capital Expenditures and Construction Management</h5>
						<ul>
							<li>Managing and supervising interiors for tenants</li>
							<li>Facilities construction, management, and supervision</li>
							<li>Maintaining and increasing the value of assets by systematically planning and carrying out capital expenditures</li>
						</ul>
					</li>
					<li>
						<h5>Accounting and Financial Management</h5>
						<ul>
							<li>Preparing annual operating budgets and periodically reporting on operations</li>
							<li>Receiving rents and maintenance fees</li>
							<li>Payment of property taxes</li>
							<li>Payment of energy bills and efficient management</li>
						</ul>
					</li>
					<li>
						<h5>Legal Services</h5>
						<ul>
							<li>Legal affairs relating to building management</li>
						</ul>
					</li>
				</ol>
			</div>
		</div>
		<h3 class="tit_org">Workflow</h3>
		<div class="property_img03">
			<div class="hidden">
				<ol>
					<li>CLIENTS</li>
					<li>Requesting Property Management</li>
					<li>Due Diligence
						<ul>
							<li>Physical due diligence</li>
							<li>Investigation of current management status</li>
							<li>Market research, etc.</li>
						</ul>
					</li>
					<li>Due diligence planning
						<ul>
							<li>A. Revenues
								<ul>
									<li>Leasing package development</li>
									<li>Vacancy management plans</li>
									<li>Review investments, e.g. remodeling/renovations</li>
								</ul>
							</li>
							<li>B. Costs
								<ul>
									<li>Review management services</li>
									<li>Review maintenance fees</li>
									<li>Tax management/systematic budget management</li>
								</ul>
							</li>
							<li>C. Management
								<ul>
									<li>Tenant services planning</li>
									<li>Systematization of PM/FM work</li>
									<li>Physical/financial/legal risk hedging</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>Proposal(CLIENTS)</li>
					<li>Increase revenues and property value through efficient management</li>
					<li>Property Management
						<ul>
							<li>Lease management (new/cancellations/renewals, etc.)</li>
							<li>Financial management (rents/maintenance fees, operating expenses, taxes, etc.)</li>
							<li>Building management (transparent operations based on reports, servicing contractor management, facilities management)</li>
							<li>Legal management (matters related to litigation during building management)</li>
							<li>Tenant management, etc.</li>
						</ul>
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 1, 1);
	});
</script>
</body>
</html>