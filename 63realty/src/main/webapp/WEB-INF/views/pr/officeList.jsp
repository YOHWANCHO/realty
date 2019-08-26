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
				<li class="on"><a href="/pr/office_list">오피스 마켓 리포트</a></li>
				<li><a href="/pr/monthly_list">월간 리포트</a></li>
				<li><a href="/pr/issue_list">이슈 브리프</a></li>
				<li><a href="/pr/daily_list">데일리 리포트</a></li>
			</ul>
		</div>
		
		<form name="searchForm" method="GET" >
			<input type="hidden" name="pageIndex" value="0">
			<!-- 검색 -->
			<div class="search_box">
				<label for="gubun"><strong class="txt">검색</strong></label>
				<select id="gubun" class="form_select" name="searchType">
					<option value="" ${searchVO.searchType eq "" ? "selected" : ""}>전체</option>
					<option value="s_title" ${searchVO.searchType eq "s_title" ? "selected" : ""}>제목</option>
					<option value="s_contents" ${searchVO.searchType eq "s_contents" ? "selected" : ""}>내용</option>
				</select>
				<input type="text" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요." class="form_input"  name="searchText" value="${searchVO.searchText}"/>
				<button class="btn_search">검색</button>
			</div>
			<!-- //검색 -->
		</form>

		<!-- 리스트 -->
		<div class="table_list">			
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:8%;" />
					<col />
					<col style="width:12%;" />
					<col style="width:12%;" />
					<col style="width:10%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">첨부파일</th>
						<th scope="col">등록일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr><td colspan="5">검색된 내용이 없습니다.</td></tr>
					</c:if>
					
					<c:forEach var="vo" items="${list}"  varStatus="status">
						<tr>
							<td>${searchVO.totalCount - ( status.index+((searchVO.pageIndex-1)*searchVO.pageCount))}</td>
							<td class="al"><a href="javascript:;" onclick="goBoardView('/pr/office_view/${vo.mainBoardSeq}')">${vo.title}</a></td>
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
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 6, 0);
	});
</script>
</body>
</html>