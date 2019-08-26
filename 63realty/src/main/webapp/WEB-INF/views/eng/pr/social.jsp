<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Social Contribution | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; PR Center &gt; <strong>Social Contribution</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Social Contribution</h2></div>
		<div class="social_img">
			<div class="hidden">
				<h3>Social Contribution Activities</h3>
				<p>Starting in 2004, Hanwha City, which started full-fledged social contribution activities, has participated in various social contribution activities such as ‘ Safety House ’ and ‘ Green carpentry’. And along with the Hanwha spirit, which go together, the company led the social enterprise.</p>
			</div>
		</div>
		<div class="social_intro">
			<h3>Past activities</h3>
			<div class="line">
				<h4>Beautiful Store Campaign</h4>
				<p>Hanwha City has implemented social contributions to society by hosting beautiful store and donating contribution.</p>
			</div>
			<div class="line">
				<h4>Fostering global talent</h4>
				<p>By inviting foreign students to participate in the 63 building, Korea's landmark building, We sponsored by the Fostering global talent.</p>
			</div>
			<div class="line">
				<h4>Together 63 City</h4>
				<p>Hanwha 63 City's headquarters and other regional headquarters are making great contributions to the local community through social contribution activities every week.</p>
			</div>

			<h3>Special programs</h3>
			<div class="line">
				<h4>Safe home campaign</h4>
				<p>Employees volunteers regularly visit households in Yeongdeungpo-gu, Mapo-gu, where Hanwha 63 City is located, and the elderly and boys and girls living alone, to improve the residential environment in the home (electricity, wallpaper and fixtures).</p>
				<div class="img"><img src="/resources/eng/img/social_img02.jpg" alt="" /></div>
			</div>
			<div class="line">
				<h4>Eco-friendly woodworking lesson</h4>
				<p>Hanwha 63 City is doing eco-friendly woodworking classes for elementary school students in Yeongdeungpo-gu through making woodworking lessons using recycled materials and making energy lamps.</p>
				<div class="img"><img src="/resources/eng/img/social_img03.jpg" alt="" /></div>
			</div>
			<div class="line">
				<h4>Eco-friendly mural painting</h4>
				<p>Hanwha 63 City is leading the way in creating an eco-friendly community through mural paintings using environmentally friendly paints to visit aged facilities and institutions in order to develop local communities.</p>
				<div class="img"><img src="/resources/eng/img/social_img04.jpg" alt="" /></div>
			</div>
			<h4>Clean up Han river</h4>
			<p>Hanwha 63 City is taking the initiative to clean up the Han River every year by creating a clean environment. With the slogan of "greening the Han River" and "beautiful nature"</p>
			<div class="img mb0"><img src="/resources/eng/img/social_img05.jpg" alt="" /></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 2, 0);
	});
</script>
</body>
</html>