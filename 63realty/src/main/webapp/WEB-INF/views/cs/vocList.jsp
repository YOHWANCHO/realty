<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>고객의 소리 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 고객지원 &gt; <strong>고객의 소리</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_cs.jsp"%>	
	<div id="contents" class="contents">
		<div class="title_box"><h2>고객의 소리</h2></div>
		<p class="txt_style1"><strong class="color_org">입주사</strong> 및 <strong class="color_org">빌딩 이용 고객님</strong>의 의견에 귀 기울이는 공간입니다.</p>
		<p class="voc_txt1">한화63시티는 항상 고객의 의견에 귀를 기울이며,  고객님의 의견을 가장 빠르고 정확하게 처리해드릴 것을 약속합니다. <br />한화63시티 고객의 소리는 다음과 같은 프로세스로 처리됩니다.</p>
		<div><img src="/resources/img/voc_step.gif" alt="Step01 고객의 소리 접수, Step02 담당자 확인, Step03 해당부서 전달, Step04 답변 및 조치, Step05 결과안내" /></div>
		<ul class="txt_note v2">
			<li>게시판의 성격에 맞지 않다고 판단되는 글(광고, 비방 등)은 관리자의 권한으로 삭제하오니 참고하시기 바랍니다.</li>
			<li>고객님의 의견은 확인 후, 게시되며 불만, 제안사항은 개별 회신되오니 정확한 이메일 주소를 기재해 주시기 바랍니다.</li>
		</ul>
		<form name="searchForm" method="GET" >
			<input type="hidden" name="pageIndex" value="0">
			<!-- 리스트 -->
			<div class="table_list mt25">
				<table>
					<caption></caption>
					<colgroup>
						<col style="width:8%;" />
						<col />
						<col style="width:9%;" />
						<col style="width:12%;" />
						<col style="width:12%;" />
						<col style="width:10%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">상태</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach varStatus="status" items="${list}" var="vo">
							<tr>							
								<td>${searchVO.totalCount - ( status.index+((searchVO.pageIndex-1)*searchVO.pageCount))}</td>
								<td class="al"><a href="/cs/voc_view/${vo.custVoiceSeq}">${vo.custTitle}</a></td>
								<td>${vo.custName}</td>
								<td><span class="txt_label ${vo.isReply eq 'Y' ? 'org' : 'gray'}" >${vo.isReply eq 'Y' ? '답변완료' : '답변준비중'}</span></td>
								<td>${mtl:parseDateFormat('yyyy-MM-dd',vo.regDate)}</td>
								<td>${vo.hitCount}</td>
							</tr>					
						</c:forEach>
					</tbody>
				</table>
			</div>
			</form>
		<!-- //리스트 -->

		<div class="page_wrap">
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
			<div class="btn_right">
				<a href="/cs/voc_write" class="btn_m1">고객의 소리 등록</a>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(5, 4, 0);
	});
</script>
</body>
</html>