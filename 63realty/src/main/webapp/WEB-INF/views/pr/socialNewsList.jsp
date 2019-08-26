<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
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
		<div class="title_box"><h2>전체뉴스</h2></div>
		<p class="txt_style1">한화63시티는 인간존중 이념에서 비롯된 <strong class="color_org">나눔 활동</strong>을 통해 고객과 사회에 헌신하고 있습니다.</p>
		<div class="tabmenu mt25">
			<ul>
				<li class="on"><a href="/pr/socialNews_list">전체</a></li>
				<li><a href="/pr/social_list">사회공헌활동 뉴스</a></li>
				<li><a href="/pr/news_list">환경안전보건 뉴스</a></li>
				<li><a href="/pr/etcNews_list">기타</a></li>
			</ul>
		</div>
		
		<form name="searchForm" method="GET" >
			<input type="hidden" name="pageIndex" value="0">
			<!-- 검색 -->
			<div class="search_box">
				<label for="gubun"><strong class="txt">검색</strong></label>
				<select id="gubun" class="form_select" name="searchType">
					<option value="" ${searchVO.searchType eq "" ? "selected" : ""}>전체</option>
					<option value="s_title" ${searchVO.searchType eq "s_title" ? "selected" : ""}>장소</option>
					<option value="s_contents" ${searchVO.searchType eq "s_contents" ? "selected" : ""}>내용</option>
				</select>
				<input type="text" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요." class="form_input"  name="searchText" value="${searchVO.searchText}"/>
				<button class="btn_search">검색</button>
			</div>
			<!-- //검색 -->
		</form>

		<!-- social_list -->
		<ul class="social_list">
			<c:if test="${empty list}">
				<li class="no_data">검색된 내용이 없습니다.</li>
			</c:if>
			<c:forEach var="vo" items="${list}"  varStatus="status">
				<li>
					<a href="javascript:;" onclick="goBoardView('/pr/socialNews_view/${vo.mainBoardSeq}')">
						<div class="img">
							<c:if test="${not empty vo.fileSavenm}">
								<img src="${viewPath}${vo.filePath}${vo.fileSavenm}" alt="" />
							</c:if>							
						</div>
						<div class="txt">
							<h3>${vo.title }</h3>
							<p>${mtl:textOverflow(mtl:delHtmlTag(vo.contents),70)}</p>
						</div>
						<span class="date">[${mtl:parseDateFormat('yyyy-MM-dd',vo.showDate)}]</span>
					</a>
				</li>			
			</c:forEach>
		</ul>
		<!-- //social_list -->
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
		MYAPP.Menu.init(3, 1, 0);
	});	
</script>
</body>
</html>