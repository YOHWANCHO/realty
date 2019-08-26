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
		<li>부동산 자료 구독관리</li>	
	</ul>
	
	<form name="searchForm">
	<input type="hidden" name="pageIndex" value="0">
	<div class="search_box">
		<strong style="width:80px;">기간</strong>			
			<input type="text" class="form_input" id="searchFromDate" name="searchFromDate" readonly style="width:100px;" value="${searchVO.searchFromDate}"/>~
			<input type="text" class="form_input" id="searchToDate" name="searchToDate" readonly style="width:100px;" value="${searchVO.searchToDate}"/>
		<div class="mt5">
			<strong style="width:80px;">검색분류</strong>
			<select class="form_select" name="userFlag">			
				<option value="" ${searchVO.userFlag eq '' ? 'selected' : ''}>전체</option>
				<option value="Y" ${searchVO.userFlag eq 'Y' ? 'selected' : ''}>구독하기</option>
				<option value="N" ${searchVO.userFlag eq 'N' ? 'selected' : ''}>구독취소</option>
			</select>			
			<input type="text" class="form_input" name="searchText" value="${searchVO.searchText}"/>
			<button class="btn_s1">검색</button>
			<button type="button" class="btn_s1" onclick="onExcelDown();">엑셀변환</button>
		</div>
	</div>
	</form>
	<p class="txt_total">총 <strong>${searchVO.totalCount}</strong>개</p>
	<div class="table_list">
		<table>
			<colgroup>
				<col style="width:30px;">
				<col style="width:120px;">
				<col style="width:120px;">
				<col style="width:120px;">
				<col>
				<col style="width:150px;">							
<!-- 				<col style="width:150px;">							 -->
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>등록일</th>
<!-- 					<th>취소일</th> -->
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
						<td>${vo.userFlag eq 'Y' ? '구독하기' : '구독취소'}</td>
						<td>${vo.readerName}</td>
						<td>${vo.readerPhone}</td>
						<td>${vo.email}</td>
						<td>${mtl:parseDateFormat('yyyy-MM-dd HH:mm:ss',vo.regDate)}</td>						
<%-- 						<td>${mtl:parseDateFormat('yyyy-MM-dd HH:mm:ss',vo.cancelDate)}</td> --%>
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
	</div><!-- list-paging -->
</div>
<!-- //contents -->
<form name="exForm">
	<input type="hidden" name="userFlag" value="${searchVO.userFlag}">
	<input type="hidden" name="searchText" value="${searchVO.searchText}">
	<input type="hidden" name="searchFromDate" value="${searchVO.searchFromDate}">
	<input type="hidden" name="searchToDate" value="${searchVO.searchToDate}">	
</form>
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

function onExcelDown(){
	var fm = $('form[name=exForm]');
	fm.attr("method","post");
	fm.attr("action","/console/contents/bldLetter_excel");
	fm.submit();
}
</script>

<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>