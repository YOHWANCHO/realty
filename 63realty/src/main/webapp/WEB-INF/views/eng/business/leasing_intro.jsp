<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Leasing | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; Our Services &gt; <strong>Leasing</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Leasing</h2></div>
		<h3 class="tit_h3">What is Hanwha 63City’s Leasing Agency Service?</h3>
		<p class="txt_style2 mt10">We combine high-rise building leasing strategies with our extensive lessee management expertise to conduct lessee preference analyses and in-depth market analyses. Then we merge the data into a scientific database and network, providing both lessors and lessees with high-level, customized services.</p>
		<div class="business_img bg2">
			<p class="txt1"><strong>Leasing</strong> Service</p>
			<p class="txt2">The total leasing solution proposed by <br />the topnotch experts in Korea</p>
		</div>
		<h3 class="tit_org">Key Services</h3>
		<div class="leasing_img02">
			<div class="hidden">
				<h4>Hanwha 63City Leasing service</h4>
				<ol>
					<li>
						<h5>Services for Lessors</h5>
						<ul>
							<li>Lease planning</li>
							<li>Leasing package development
								<ul>
									<li>Calculating appropriate rents/maintenance fees</li>
									<li>High-quality tenant service</li>
									<li>Parking operations, etc.</li>
								</ul>
							</li>
							<li>Contract management <br />(new/changes/renewals/cancellations, etc.) </li>
							<li>Receiving rents and maintenance fees </li>
							<li>Tenant management </li>
							<li>Litigation</li>
						</ul>
					</li>
					<li>
						<h5>Services for Lessees</h5>
						<ul>
							<li>Market research to develop lease objects</li>
							<li>Investigating lessors and rights of the buildings to rent, assessing collaterals </li>
							<li>Contract work <br />(new/changes/renewals/cancellations, etc.) </li>
							<li>Collecting receivables (collecting deposits)</li>
							<li>Litigation</li>
						</ul>
					</li>
				</ol>
			</div>
		</div>
		<h3 class="tit_org">Workflow</h3>
		<div class="leasing_img03">
			<div class="hidden">
				<ol>
					<li>CLIENTS</li>
					<li>Requests</li>
				</ol>
				<ol>
					<li>CLIENTS</li>
					<li>Services for Lessors</li>
					<li>Investigations and analyses of lease objects
						<ul>
							<li>Lease planning</li>
							<li>Calculating lease area, etc.</li>
						</ul>
					</li>
					<li>Leasing package development
						<ul>
							<li>Calculating appropriate rents/maintenance fees </li>
							<li>Efficient tenant management</li>
							<li>Other contract conditions</li>
						</ul>
					</li>
					<li>Marketing/selecting lessees/negotiations
						<ul>
							<li>Identifying and maintaining potential tenants</li>
							<li>Negotiations regarding contract conditions</li>
							<li>Tenant configuration </li>
						</ul>
					</li>
					<li>Contract conclusion
						<ul>
							<li>contract period, rents/maintenance fees, other conditions, etc.</li>
						</ul>
					</li>
					<li>Post-management
						<ul>
							<li>Lease management (new/cancellation/renewal, etc.)</li>
							<li>financial management (receiving rents/maintenance fees, etc)</li>
							<li>legal management (litigation)</li>
						</ul>
					</li>
				</ol>
				<ol>
					<li>CLIENTS</li>
					<li>Service for Lessees</li>
					<li>Market research and securing lease objects
						<ul>
							<li>Securing lease objects based on market research, e.g. leases space/locations meeting client’s requirements</li>
						</ul>
					</li>
					<li>Due diligence of lease objects
						<ul>
							<li>Investigating lessors in the building to be rented, conditions of the building, contract conditions, and legal status</li>
						</ul>
					</li>
					<li>Selecting building to rent
						<ul>
							<li>Detailed negotiations with the lessor of the building to be rented</li>
						</ul>
					</li>
					<li>Contract conclusion
						<ul>
							<li>Contract period, rents/maintenance fees, other conditions, etc.</li>
						</ul>
					</li>
					<li>Post-management
						<ul>
							<li>Rental management (new/cancellations/renewals, etc.)</li>
							<li>Financial management (paying rents/maintenance fees, etc.)</li>
							<li>Legal management (litigation)</li>
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
		MYAPP.Menu.init(2, 2, 0);
	});
</script>
</body>
</html>