<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<%@ include file="/WEB-INF/views/inc/topJsp.jsp"%>

<title>부동산 자료실 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 고객지원 &gt; <strong>공지사항</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_cs.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>공지사항</h2></div>
		<p class="txt_style1"><strong class="color_org">공지</strong>와 <strong class="color_org">보도자료</strong> 등을 확인 하실 수 있습니다.</p>
		
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
					<dd><a href="javascript:;" onclick="goBoardView('/cs/notice_view/${preNext.nextMainBoardSeq}');">${preNext.nextTitle}</a></dd>
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
					<dd><a href="javascript:;" onclick="goBoardView('/cs/notice_view/${preNext.preMainBoardSeq}');">${preNext.preTitle}</a></dd>					
				</c:otherwise>
			</c:choose>
		</dl>
		<!-- //다음글, 이전글 -->

		<div class="btn_right">
			<a href="/cs/notice_list" class="btn_m1">목록</a>
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
		MYAPP.Menu.init(5, 1, 0);
	});
</script>
</body>
</html>