<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>e-브로셔 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 홍보센터 &gt; <strong>e-브로셔</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>e-브로셔</h2></div>
		<h3 class="ac"><img src="/resources/img/hanwha_txt.gif" alt="HIGHEST &amp; BEST USE OF REALTY Hanwha 63 City" /></h3>
		<div class="brochure_img">
			<div class="hidden">
				<p>다양한 관리경험으로 축척 된 노하우</p>
				<p>최고의 자산관리 전문가 그룹 한화63시티를 만나보십시오</p>
				<p>한화63시티는 자산관리 인적 네트워크와 체계화 된 부동산 자산경영시스템으로 대한민국을 넘어 세계 부동산을 경영하는 종합부동산 서비스 기업입니다.</p>
			</div>
			<a href="/resources/pdf/2017_e_brochure.pdf" target="_blank" class="down">e-브로셔 다운로드</a>
			<!-- <a href="javascript:alert('준비중입니다.');" class="down">e-브로셔 다운로드</a> -->
			<a href="javascript:;" onclick="MYAPP.NewWindow.init('pop_ebrochure', 'e-brochure', '1130', '730', 'yes');" class="view">e-브로셔 바로보기</a>
		</div>
		<div class="btn_right">
			<a href="https://get.adobe.com/kr/reader/" target="_blank"><img src="/resources/img/btn_viewer.gif" alt="뷰어 다운로드" /></a>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 2, 0);
	});
</script>
</body>
</html>