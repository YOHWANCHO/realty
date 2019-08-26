<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Facilities Management | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; Our Services &gt; <strong>Facilities Management</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Facilities Management</h2></div>
		<h3 class="tit_h3">What facilities management services are offered by Hanwha 63City?</h3>
		<p class="txt_style2 mt10">We leverage the technical expertise we have accumulated over the past 20 years to provide optimal building management services for the 21st century. This includes comprehensive building management services in all areas of building management, operations, and maintenance, such as repairs to and the operation of electrical facilities, machinery, equipment, disaster prevention, and communications facilities, building guide, security, and cleaning and sanitation.</p>
		<div class="business_img bg4">
			<p class="txt1"><strong>Facility</strong> Management</p>
			<p class="txt2">We capitalize on the technical expertise we accumulated <br />over the past 20 years to become the market<br />best in building management of the 21st century.</p>
		</div>
		<h3 class="tit_org">Key Services</h3>
		<div class="facility_img02">
			<div class="hidden">
				<h4>Hanwha 63City facility management</h4>
				<ol>
					<li>
						<h5>Facilities Maintenance</h5>
						<p>Building management, operational planning and execution</p>
					</li>
					<li>
						<h5>Cleaning/Parking/Security Management</h5>
						<p>Management and control of outsourced service providers</p>
					</li>
					<li>
						<h5>Construction Management &amp; Supervision</h5>
						<p>Management and supervision of leased interiors  and construction</p>
					</li>
					<li>
						<h5>Energy Control</h5>
						<p>Seeking efficiencies and alternatives by continuously monitoring energy use</p>
					</li>
					<li>
						<h5>Facilities Safety Audits</h5>
						<p>Ability to inspect facilities and firefighting safety independently</p>
					</li>
					<li>
						<h5>Facilities Construction</h5>
						<p>Construction of firefighting facilities in buildings</p>
					</li>
				</ol>
			</div>
		</div>
		<h3 class="tit_org">Workflow</h3>
		<div class="facility_img03">
			<div class="hidden">
				<ol>
					<li>CLIENTS</li>
					<li>Requesting management</li>
					<li>Due diligence of the building
						<ul>
							<li>Management and operating plan</li>
							<li>Scope of management services</li>
							<li>Calculation of management service fees</li>
						</ul>
					</li>
					<li>Proposals(CLIENTS)</li>
					<li>Consultations and decision-making</li>
					<li>Facility management service contract
						<ul>
							<li>Outsourcing contract</li>
							<li>FM operational team building acquisitions/injections</li>
							<li>Taking over building-related documents</li>
						</ul>
					</li>
					<li>Facility management
						<ul>
							<li>Building facilities maintenance and management</li>
							<li>Contractor management (Beautification/cleaning/security, etc.)</li>
							<li>Construction management and supervision</li>
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
		MYAPP.Menu.init(2, 4, 0);
	});
</script>
</body>
</html>