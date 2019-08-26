<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>부동산 자료실 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 홍보센터 &gt; <strong>부동산 자료실</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>부동산 자료실</h2></div>
		<p class="txt_style1">한화63시티는 고객님에게 <strong class="color_org">빠른 자료전달</strong>을 목표로 합니다.</p>
		<div class="tabmenu mt25">
			<ul>
				<li><a href="/pr/office_list">오피스 마켓 리포트</a></li>
				<li><a href="/pr/monthly_list">월간 리포트</a></li>
				<li class="on"><a href="/pr/issue_list">이슈 브리프</a></li>
				<li><a href="/pr/daily_list">데일리 리포트</a></li>
			</ul>
		</div>
		
		<!-- 상세 -->
		<div class="table_view">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:8%;" />
					<col />
					<col style="width:8%;" />
					<col style="width:11%;" />
					<col style="width:10%;" />
					<col style="width:7%;" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td class="al2">${vo.title}</td>
						<th scope="row">등록일</th>
						<td>${mtl:parseDateFormat('yyyy-MM-dd',vo.showDate)}</td>
						<th scope="row">첨부파일</th>
						<td>
							<c:if test="${not empty fileVO.fileOrgnm}">
							<a href="/comm/mainBoardFileDownload?mainBoardFileSeq=${fileVO.mainBoardFileSeq}" title="${fileVO.fileOrgnm}"><img src="/resources/img/ico_file.png" alt="첨부파일" /></a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="6" class="con_detail">
							${vo.contents }
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
					<dd><a href="javascript:;" onclick="goBoardView('/pr/issue_view/${preNext.nextMainBoardSeq}');">${preNext.nextTitle}</a></dd>
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
					<dd><a href="javascript:;" onclick="goBoardView('/pr/issue_view/${preNext.preMainBoardSeq}');">${preNext.preTitle}</a></dd>					
				</c:otherwise>
			</c:choose>
		</dl>
		<!-- //다음글, 이전글 -->

		<div class="btn_right">
			<a href="/pr/issue_list" class="btn_m1">목록</a>
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
		MYAPP.Menu.init(3, 6, 0);
	});
</script>
</body>
</html>