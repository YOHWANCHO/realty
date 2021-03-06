<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>자주하는 질문 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 고객지원 &gt; <strong>자주하는 질문</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_cs.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>자주하는 질문</h2></div>
		<p class="txt_style1"><strong class="color_org">온라인컨설팅</strong> 관련 자주하는 질문입니다.</p>
		<div class="tabmenu mt25">
			<ul>
				<li style="display: ${faq01Cnt eq '0'?'none' : 'block'}"><a href="/cs/faq01">매입/임대</a></li>
				<li style="display: ${faq02Cnt eq '0'?'none' : 'block'}"><a href="/cs/faq02">서비스센터</a></li>
				<li class="on" style="display: ${faq03Cnt eq '0'?'none' : 'block'}"><a href="/cs/faq03">온라인컨설팅</a></li>
				<li style="display: ${faq04Cnt eq '0'?'none' : 'block'}"><a href="/cs/faq04">홈페이지</a></li>
				<li style="display: ${faq05Cnt eq '0'?'none' : 'block'}"><a href="/cs/faq05">채용정보</a></li>
			</ul>
		</div>
		<form name="searchForm" method="GET" >
			<input type="hidden" name="pageIndex" value="0">
			<!-- 검색 -->
			<div class="search_box">
				<label for="gubun"><strong class="txt">검색</strong></label>
				<select id="gubun" class="form_select" style="width:120px;" name="searchType">
					<option value="" ${searchVO.searchType eq "" ? "selected" : ""}>전체</option>
					<option value="s_title" ${searchVO.searchType eq "s_title" ? "selected" : ""}>제목</option>
					<option value="s_contents" ${searchVO.searchType eq "s_contents" ? "selected" : ""}>내용</option>
				</select>
				<input type="text" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요." class="form_input"  name="searchText" value="${searchVO.searchText}"/>
				<button class="btn_search">검색</button>
			</div>
			<!-- //검색 -->
		</form>
		<!-- faq_list -->
		<ul class="faq_list">
			<c:if test="${empty list}">
				<li class="no_data">조회된 내용이 없습니다.</li>
			</c:if>
			<c:forEach items="${list}" var="vo" varStatus="status" >
				<li>
					<div class="faq_title"><a href="javascript:;">${vo.title}</a></div>
					<div class="faq_con">${vo.contents}</div>
				</li>
			</c:forEach>			
		</ul>
		<!-- //faq_list -->

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
		MYAPP.Menu.init(5, 2, 0);
		MYAPP.Faq.init();
	});
</script>
</body>
</html>