<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>임대안내문 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; 임대차 컨설팅 &gt; <strong>임대안내문</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>임대안내문</h2></div>
		<div>
			<img src="/resources/img/leasing_guide.jpg" alt="" usemap="#map_leasingGuide" />
			<map name="map_leasingGuide">
				<c:choose>
					<c:when test="${empty vo.boardID}">
						<area shape="rect" coords="265,95,485,305" href="javascript:;alert('준비중입니다.');" alt="임대안내문 내려받기" />
					</c:when>
					<c:otherwise>
						<area shape="rect" coords="265,95,485,305" href="/comm/oneFileDownload?boardID=${vo.boardID}" alt="임대안내문 내려받기" />
					</c:otherwise>
				</c:choose>				
			</map>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 2, 2);
	});
</script>
</body>
</html>