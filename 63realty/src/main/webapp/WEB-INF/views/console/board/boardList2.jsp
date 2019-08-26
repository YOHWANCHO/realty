<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_top.jsp"%>
<%@ include file="/WEB-INF/views/console/inc/inc_lnb.jsp"%>
<script type="text/javascript">
	$(function(){
		menuOn();
	});
	
	function searchList(){
		var f = $('form[name=searchForm]');
		f.attr("method","get");
		f.attr("action","");
		f.submit();
	}
	
</script>
<!-- contents -->
<div class="contents">
	<h2 class="title_h2"><span class="spanTitle"></span></h2>

	<ul class="info_txt">		
	</ul>
	
	<form name="searchForm">
	<input type="hidden" name="pageIndex" value="0">
	
	<div class="search_box">
		<strong style="width:80px;">구분</strong>
		<select class="form_select" name="searchType">
			<option value="" ${searchVO.searchType eq "" ? "selected" : ""}>전체</option>
			<option value="s_title" ${searchVO.searchType eq "s_title" ? "selected" : ""}>제목</option>
			<option value="s_contents" ${searchVO.searchType eq "s_contents" ? "selected" : ""}>내용</option>
		</select>
		<input type="text" class="form_input" name="searchText" value="${searchVO.searchText}"/>		

		<div class="mt5">
			<strong style="width:80px;">기간</strong>			
			<input type="text" class="form_input" id="searchFromDate" name="searchFromDate" readonly style="width:100px;" value="${searchVO.searchFromDate}"/>~
			<input type="text" class="form_input" id="searchToDate" name="searchToDate" readonly style="width:100px;" value="${searchVO.searchToDate}"/>
			<button class="btn_s1">검색</button>
		</div>
	</div>
	</form>
	<p class="txt_total">총 <strong>${searchVO.totalCount}</strong>개의 글이 검색되었습니다.</p>
	<div class="table_list">
		<table>
			<colgroup>
				<col style="width:30px;">
				<col>
				<col style="width:60px;">
				<col style="width:120px;">
				<col style="width:80px;">				
				<col style="width:80px;">				
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>첨부파일</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>노출</th>					
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6">
							<span>찾는 검색어 관련 내용이 없습니다.</span>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${list}" var="vo" varStatus="status" >
					<tr>
						<td>${searchVO.totalCount - ( status.index+((searchVO.pageIndex-1)*searchVO.pageCount))}</td>
<%-- 						<td><a href="${reqUri}_view/${vo.mainBoardSeq}">${vo.title}</a></td> --%>
						<td><a href="javascript:;" onclick="goBoardView('${reqUri}_view/${vo.mainBoardSeq}');">${vo.title}</a></td>
						<td>
							<c:if test="${vo.mainBoardFileSeq ne 0}">
								<a href="/comm/mainBoardFileDownload?mainBoardFileSeq=${vo.mainBoardFileSeq}"><img src="/resources/img/ico_file.png" alt="첨부파일" /></a>							
							</c:if>							
						</td>
						<td>${mtl:parseDateFormat('yyyy-MM-dd',vo.showDate)}</td>
						<td>${vo.hitCount}</td>
						<td>${vo.isUse}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="list_bottom">
		<div class="page_wrap">
			<a class="btn_arrow btn_first" href="javascript:onPaging( document.searchForm, ${searchVO.firstPageIndex})">
				<img src="/resources/console/img/btn_first.gif" alt="" />
			</a>
			<a class="btn_arrow btn_prev" href="javascript:onPaging( document.searchForm, ${searchVO.prevPageIndex})">
				<img src="/resources/console/img/btn_prev.gif" alt="" />
			</a>
			<c:forEach var="i" begin="${searchVO.startPageIndex}" end="${searchVO.endPageIndex}" step="1">
				<c:choose>
					<c:when test="${i eq searchVO.pageIndex }">
						<a href="javascript:onPaging( document.searchForm, ${i})" class="current">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:onPaging(document.searchForm, ${i})"> ${i} </a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a class="btn_arrow btn_next" href="javascript:onPaging( document.searchForm, ${searchVO.nextPageIndex})">
				<img src="/resources/console/img/btn_next.gif" alt="" />
			</a>
			<a class="btn_arrow btn_last" href="javascript:onPaging( document.searchForm, ${searchVO.finalPageIndex})">
				<img src="/resources/console/img/btn_last.gif" alt="" />
			</a>
		</div>
		<div class="btn_right">
			<a href="${reqUri}_write" class="btn_m1">글쓰기</a>
		</div>
	</div><!-- list-paging -->
</div>
<!-- //contents -->
<script>
$(function(){
	//datepicker
	$("#searchFromDate").datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		changeYear: true
	});
	$("#searchToDate").datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		changeYear: true
	});
});
</script>

<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>