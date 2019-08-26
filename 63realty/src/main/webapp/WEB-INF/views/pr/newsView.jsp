<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<%@ include file="/WEB-INF/views/inc/topJsp.jsp"%>
<title>뉴스 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 홍보센터 &gt; <strong>뉴스</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>뉴스</h2></div>
		<p class="txt_style1">지속가능한 발전과 사회적 책임을 완수하기 위해 세계수준의 환경안전 시스템을 구축하여 환경안전보호정책을 추진하고 있습니다.</p>
		<div class="tabmenu mt25">
			<ul>
				<li><a href="/pr/socialNews_list">전체</a></li>
				<li><a href="/pr/social_list">사회공헌활동 뉴스</a></li>
				<li class="on"><a href="/pr/news_list">환경안전보건 뉴스</a></li>
				<li><a href="/pr/etcNews_list">기타 뉴스</a></li>
			</ul>
		</div>
		
		<!-- 상세 -->
		<div class="table_view">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:7%;" />
					<col />
					<col style="width:7%;" />
					<col style="width:12%;" />
					<col style="width:9%;" />
					<col style="width:11%;" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td class="al2">${vo.title}</td>
						<th scope="row">일시</th>
						<td class="al2">${mtl:parseDateFormat('yyyy-MM-dd',vo.showDate)}</td>
						<th scope="row">작성자</th>
						<td class="al2">${vo.regName}</td>
					</tr>
					<tr>
						<td colspan="6" class="con_detail">
							${vo.contents}
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- //상세 -->

		
		<!-- 다음글, 이전글 -->
		<dl class="board_nav">
			<dt class="next">다음글</dt>
			<c:choose>
				<c:when test="${empty preNext.nextTitle}">
					<dd>다음글이 없습니다.</dd>
				</c:when>
				<c:otherwise>
					<dd><a href="javascript:;" onclick="goBoardView('/pr/news_view/${preNext.nextMainBoardSeq}');">${preNext.nextTitle}</a></dd>
				</c:otherwise>			
			</c:choose>
		</dl>		
		<dl class="board_nav">		
			<dt class="prev">이전글</dt>
			<c:choose>
				<c:when test="${empty preNext.preTitle}">
					<dd>이전글이 없습니다.</dd>
				</c:when>
				<c:otherwise>
					<dd><a href="javascript:;" onclick="goBoardView('/pr/news_view/${preNext.preMainBoardSeq}');">${preNext.preTitle}</a></dd>					
				</c:otherwise>
			</c:choose>
		</dl>
		<!-- //다음글, 이전글 -->

		<div class="btn_right">
			<a href="/pr/news_list" class="btn_m1">목록</a>
		</div>
	</div>
</div>
<form name="searchForm">
	<input type="hidden" name="searchType" value="${searchVO.searchType}" />
	<input type="hidden" name="searchText" value="${searchVO.searchText}" />
	<input type="hidden" name="searchFromDate" value="${searchVO.searchFromDate}" />
	<input type="hidden" name="searchToDate" value="${searchVO.searchToDate}" />
</form>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 1, 0);
	});
</script>
</body>
</html>