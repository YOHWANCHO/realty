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
		<!-- 검색 -->
		<form name="searchForm" method="GET" >
			<input type="hidden" name="pageIndex" value="0">
			<div class="search_box">
				<label for="gubun"><strong class="txt">Search</strong></label>
				<select id="gubun" class="form_select" name="searchType">
					<option value="" ${searchVO.searchType eq "" ? "selected" : ""}>All</option>
					<option value="s_title" ${searchVO.searchType eq "s_title" ? "selected" : ""}>Title</option>
					<option value="s_contents" ${searchVO.searchType eq "s_contents" ? "selected" : ""}>Contents</option>					
				</select>
				<input type="text" placeholder="Please enter your search term" title="Please enter your search term" class="form_input" name="searchText" value="${searchVO.searchText}"/>
				<button class="btn_search">Search</button>
			</div>
		</form>
		<!-- //검색 -->

		<h3 class="tit_black">Office Market Reports</h3>
		<!-- 리스트 -->
		<div class="table_list">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:8%;" />
					<col />
					<col style="width:12%;" />
					<col style="width:22%;" />
					<col style="width:10%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">Title</th>
						<th scope="col">Attachment</th>
						<th scope="col">Date of registration</th>
						<th scope="col">Display</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr><td colspan="5">NO DATA.</td></tr>
					</c:if>
					<c:forEach var="vo" items="${list}"  varStatus="status">
						<tr>
							<td>${searchVO.totalCount - ( status.index+((searchVO.pageIndex-1)*searchVO.pageCount))}</td>
							<td class="al"><a href="javascript:;" onclick="goBoardView('/eng/pr/office_view/${vo.mainBoardSeq}')">${vo.title}</a></td>
							<td>
								<c:if test="${vo.mainBoardFileSeq ne 0}">
									<a href="/comm/mainBoardFileDownload?mainBoardFileSeq=${vo.mainBoardFileSeq}"><img src="/resources/img/ico_file.png" alt="첨부파일" /></a>
								</c:if>								
							</td>
							<td>${mtl:parseDateFormat('yyyy-MM-dd',vo.showDate)}</td>
							<td>${vo.hitCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- //리스트 -->

		<!-- paging -->
		<div class="paging">
			<a href="javascript:onPaging( document.searchForm, ${searchVO.firstPageIndex})" class="page_arrow first"><span class="hidden">첫 페이지로 이동</span></a>
			<a href="javascript:onPaging( document.searchForm, ${searchVO.prevPageIndex})" class="page_arrow prev"><span class="hidden">이전 페이지로 이동</span></a>
			
			
			<c:forEach var="i" begin="${searchVO.startPageIndex}" end="${searchVO.endPageIndex}" step="1">
				<c:choose>
					<c:when test="${i eq searchVO.pageIndex }">
						<a href="javascript:onPaging( document.searchForm, ${i})" class="current" title="현재페이지">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:onPaging(document.searchForm, ${i})"> ${i} </a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<a href="javascript:onPaging( document.searchForm, ${searchVO.nextPageIndex})" class="page_arrow next"><span class="hidden">다음 페이지로 이동</span></a>
			<a href="javascript:onPaging( document.searchForm, ${searchVO.finalPageIndex})" class="page_arrow last"><span class="hidden">마지막 페이지로 이동</span></a>
		</div>
		<!-- //paging -->
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 3, 0);
	});
</script>
</body>
</html>