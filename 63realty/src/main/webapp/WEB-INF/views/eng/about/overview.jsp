<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Corporate Profile | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; About Us &gt; <strong>Corporate Profile</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_about.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Corporate Profile</h2></div>
		<div class="overview_img"><img src="/resources/eng/img/overview_img01.jpg" alt="" /></div>
		<dl class="overview_info">
			<dt>CEO</dt>
			<dd>Kim Gwang Seong</dd>
			<dt>No. of employees</dt>
			<dd>816</dd>
		</dl>
		<dl class="overview_info">
			<dt>Company name</dt>
			<dd>Hanwha 63City Co., Ltd.</dd>
			<dt>Capital</dt>
			<dd>KRW 10 billion</dd>
		</dl>
		<dl class="overview_info">
			<dt>Date of Establishment</dt>
			<dd>May 1, 1986</dd>
			<dt>Address</dt>
			<dd>60 Yeoeuido-dong, Yeongdeungpo-gu, Seoul</dd>
		</dl>
		<!--<div class="overview_box">
			<div class="left_area">
				<h3>Type of business</h3>
				<p>사업영역빌딩운영, 임대차관리, 회계∙재무관리, 임대대행, 임차대행, <br />투자자문및컨설팅, 매입∙매각대행, 리서치및마켓리포트발간, <br />시설물유지관리및안전점검, 미화/주차/보안관리, 에너지관리, <br />시설물안전진단, 전문소방시설관리/공사</p>
			</div>
			<div class="right_area">
				<h3>Key Properties Under Management</h3>
				<p>주요관리자산한화생명63빌딩및한화생명40여개사옥, <br />한화장교빌딩, 한화송공빌딩, 한화서소문빌딩, 여의도한화증권빌딩, <br />서울역사, 청량리역사, 상암IT타워, 네이버그린팩토리, <br />아모레퍼시픽(부산, 초량) 부산센텀리더스 마크, 사학연금5개회관<br />(서울, 나주, 둔산, 오류,  부산회관) 더작은재단빌딩, 한화죽전IDC, <br />신한은행IDC, 나이스IDC, 네이버춘천데이터센터, US-BMC<br />(미공군기지), 판교넥슨사옥, LH공사진주사옥, 경상북도신청사등</p>
			</div>
		</div>-->
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(1, 2, 0);
	});
</script>
</body>
</html>