<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>Real Estate Information | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; PR Center &gt; <strong>Real Estate Information</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>Real Estate Information</h2></div>
		<p class="txt_style1">Hanwha 63City is committed to delivering data to its customers promptly.</p>		
		
		<h3 class="tit_black">Office Market Reports</h3>
		<!-- 상세 -->
		<div class="table_view mt0">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:8%;" />
					<col />
					<col style="width:20%;" />
					<col style="width:12%;" />
					<col style="width:13%;" />
					<col style="width:7%;" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">Title</th>
						<td class="al2">${vo.title}</td>
						<th scope="row">Date of registration</th>
						<td>${mtl:parseDateFormat('yyyy-MM-dd',vo.showDate)}</td>
						<th scope="row">Attachment</th>
						<td>
							<c:if test="${not empty fileVO.fileOrgnm}">
							<a href="/comm/mainBoardFileDownload?mainBoardFileSeq=${fileVO.mainBoardFileSeq}" title="${fileVO.fileOrgnm}"><img src="/resources/eng/img/ico_file.png" alt="Attachment" /></a>
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
			<dt class="next">Next</dt>
			<c:choose>
				<c:when test="${empty preNext.nextTitle}">
					<dd>There is no next report</dd>
				</c:when>
				<c:otherwise>
					<dd><a href="javascript:;" onclick="goBoardView('/eng/pr/office_view/${preNext.nextMainBoardSeq}');">${preNext.nextTitle}</a></dd>
				</c:otherwise>			
			</c:choose>
		</dl>	
		<dl class="board_nav">			
			<dt class="prev">Previous</dt>
			<c:choose>
				<c:when test="${empty preNext.preTitle}">
					<dd>There is no Previous report</dd>
				</c:when>
				<c:otherwise>
					<dd><a href="javascript:;" onclick="goBoardView('/eng/pr/office_view/${preNext.preMainBoardSeq}');">${preNext.preTitle}</a></dd>					
				</c:otherwise>
			</c:choose>
		</dl>
		<!-- //다음글, 이전글 -->

		<div class="btn_right">
			<a href="/eng/pr/office_list" class="btn_m1">List</a>
		</div>
	</div>
</div>
<form name="searchForm">
	<input type="hidden" name="searchType" value="${searchVO.searchType}" />
	<input type="hidden" name="searchText" value="${searchVO.searchText}" />
	<input type="hidden" name="searchFromDate" value="${searchVO.searchFromDate}" />
	<input type="hidden" name="searchToDate" value="${searchVO.searchToDate}" />
</form>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 3, 0);
	});
</script>
</body>
</html>