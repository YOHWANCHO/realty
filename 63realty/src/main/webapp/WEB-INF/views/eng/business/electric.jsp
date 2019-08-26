<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Engineering-Electric | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; Our Services &gt; Engineering &gt; <strong>Engineering-Electric</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Engineering-Electric</h2></div>
		<p class="txt_style2">Professional engineers with many years of experience in 63 Building and national licenses provide professional construction services, e.g. electric and IT construction, design and repairs.</p>
		<h3 class="tit_org">Systems for receiving and distributing electricity and power units</h3>
		<div class="electric_list">
			<div class="list_box">
				<div class="img"><img src="/resources/eng/img/electric_img01.jpg" alt="" /></div>
				<ul>
					<li>Management, installation and expansion of systems for receiving and distributing power</li>
					<li>Trunk line construction and automated control system construction</li>
					<li>Installation and operation of remote wattmeters</li>
					<li>Installation of UPS, AVR and power supplies in the computing room</li>
				</ul>
			</div>
			<div class="list_box">
				<div class="img"><img src="/resources/eng/img/electric_img02.jpg" alt="" /></div>
				<ul>
					<li>Management, installation and expansion of power units</li>
					<li>Replacement of mcc inverters</li>
					<li>Installation of motors and sumps in the machine room</li>
					<li>Installation of power for the ice storage chillers</li>
					<li>All other electric works</li>
				</ul>
			</div>
		</div>		
		<h3 class="tit_org">Energy diagnostics, consulting and post-management</h3>
		<p class="txt_style2">We use a thermal imaging camera for the power receiving and distributing systems to measure the temperature of T/R and cables and keep them in the best conditions.</p>
		<div class="electric_list">
			<div class="list_box">
				<div class="img"><img src="/resources/eng/img/electric_img03.jpg" alt="" /></div>
				<ul>
					<li>Maintenance of the power receiving and distributing systems (using the thermal imaging camera to measure the temperature of T/R)</li>
					<li>Keeping the power receiving and distributing systems in the best condition</li>
				</ul>
			</div>
			<div class="list_box">
				<div class="img"><img src="/resources/eng/img/electric_img04.jpg" alt="" /></div>
				<ul>
					<li>Selecting and installing high-efficiency lighting fixtures</li>
					<li>Replacing the power units with high-efficiency units</li>
					<li>Energy diagnosis, consulting and post-management</li>
				</ul>
			</div>
		</div>		
		<h3 class="tit_org">Lighting fixtures</h3>
		<p class="txt_style2">We diagnose lighting efficiency, use power-saving lighting fixtures, improve the level of illumination, and use LED lamps.</p>
		<div class="electric_list">
			<div class="list_box">
				<div class="img"><img src="/resources/eng/img/electric_img05.jpg" alt="" /></div>
				<ul>
					<li>Using power-saving lighting fixtures and improving the level of illumination</li>
					<li>Interior lighting works</li>
				</ul>
			</div>
			<div class="list_box">
				<div class="img"><img src="/resources/eng/img/electric_img06.jpg" alt="" /></div>
				<ul>
					<li>Improving the level of illumination by installing LED lamps in the basement parking lot</li>
					<li>Diagnosing lighting efficiency and calculating the quantity and value of saved energy, and the payback period</li>
					<li>Installing lighting fixtures in high-class restaurants</li>
				</ul>
			</div>
		</div>		
		<h3 class="tit_org">IT facilities</h3>
		<p class="txt_style2">We capitalize on our technical expertise of 63 Building IT systems to install, operate and manage all low-voltage systems.</p>
		<div class="electric_list">
			<div class="list_box">
				<div class="img"><img src="/resources/eng/img/electric_img07.jpg" alt="" /></div>
				<ul>
					<li>Installing and maintaining MDF switching systems</li>
					<li>Installing optical cables and networks</li>
					<li>Installing key phone systems and VMS</li>
					<li>All communication works</li>

				</ul>
			</div>
			<div class="list_box">
				<div class="img"><img src="/resources/eng/img/electric_img08.jpg" alt="" /></div>
				<ul>
					<li>Installing broadcasting systems</li>
					<li>Installing CCTV’s</li>
					<li>Installing DID (digital information display) systems</li>
					<li>Installing auxiliary wireless communication systems</li>
				</ul>
			</div>
		</div>		
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 5, 4);
	});
</script>
</body>
</html>