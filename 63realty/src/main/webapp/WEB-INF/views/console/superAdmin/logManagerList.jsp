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
		f.attr("action","/console/superAdmin/log_manager");
		f.submit();
	}
	
</script>
<!-- contents -->
<div class="contents">
	<h2 class="title_h2"><span class="spanTitle"></span></h2>

	<ul class="info_txt">
		<li></li>
	</ul>
	
	<form name="searchForm" method="GET" >
	<input type="hidden" name="pageIndex" value="0">
	
	<div class="search_box mt0">
		<strong>관리자 분류</strong>
		<select class="form_select" name="searchType" id="searchType">
			<option value="adm" ${searchVO.searchType eq 'adm' ? "selected='selected'":""}>계정</option>
			<option value="name" ${searchVO.searchType eq 'name' ? "selected='selected'":""}>관리자명</option>
			<option value="ip" ${searchVO.searchType eq 'ip' ? "selected='selected'":""}>IP</option>
		</select>
		<input type="text" value="${searchVO.searchText}" class="form_input" id="searchText" name="searchText"/>
		<button class="btn_s1" onclick="searchList(); return false">검색</button>
	</div>
	</form>
	<p class="txt_total">ARTICLE : <strong>${searchVO.totalCount}</strong></p>
	<div class="table_list">
		<table>
			<colgroup>				
				<col>
				<col style="width:120px;">
				<col style="width:120px;">
				<col style="width:180px;">
				<col style="width:80px;">				
			</colgroup>
			<thead>
				<tr>
					<th>로그인 일자</th>
					<th>계정</th>
					<th>관리자명</th>
					<th>IP</th>
					<th>로그인 성공</th>					
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">
							<span>찾는 검색어 관련 내용이 없습니다.</span>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${list}" var="vo" varStatus="status" >
					<tr>
						<td>${vo.regDate}</td>
						<td>${vo.admID}</td>
						<td>${vo.admName}</td>						
						<td>${vo.ip}</td>
						<td>${vo.loginYN}</td>
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
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>