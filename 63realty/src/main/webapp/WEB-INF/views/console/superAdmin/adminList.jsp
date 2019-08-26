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
		f.attr("action","/console/superAdmin/console");
		f.submit();
	}
	
</script>
<!-- contents -->
<div class="contents">
	<h2 class="title_h2"><span class="spanTitle"></span></h2>

	<ul class="info_txt">
		<li>정확히 입력하신 후 [저장] 버튼을 누르시면 수정된 내용이 등록됩니다.</li>
		<li>* 표시는 핑수 항목입니다.</li>
	</ul>
	
	<form name="searchForm" method="GET" >
	<input type="hidden" name="pageIndex" value="0">
	
	<div class="search_box mt0">
		<strong>관리자 분류</strong>
		<select class="form_select" name="searchType" id="searchType">
			<option value="" ${searchVO.searchType eq ''?"selected='selected'":""}>전체</option>
			<option value="num" ${searchVO.searchType eq 'num'?"selected='selected'":""}>사번</option>
			<option value="name" ${searchVO.searchType eq 'name'?"selected='selected'":""}>담당자명</option>
		</select>
		<input type="text" value="${searchVO.searchText}" class="form_input" id="searchText" name="searchText"/>
		<button class="btn_s1" onclick="searchList(); return false">검색</button>
	</div>
	</form>
	<p class="txt_total">총 <strong>${searchVO.totalCount}</strong>개의 글이 검색되었습니다.</p>
	<div class="table_list">
		<table>
			<colgroup>
				<col style="width:70px;">
				<col style="width:90px;">
				<col style="width:100px;">
				<col style="width:120px;">
				<col style="width:120px;">
				<col>
				<col style="width:70px;">
			</colgroup>
			<thead>
				<tr>
					<th>사번</th>
					<th>담당자명</th>
					<th>부서</th>
					<th>사무실 번호</th>
					<th>핸드폰 번호</th>
					<th>이메일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty adminList}">
					<tr>
						<td colspan="7">
							<span>찾는 검색어 관련 내용이 없습니다.</span>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${adminList }" var="vo" varStatus="status" >
					<tr>
						<td>${vo.admID}</td>
						<td><a href="/console/superAdmin/console_modify/${vo.admID}">${vo.admName}</a></td>
						<td>${vo.departmentName}</td>
						<td>${mtl:makePhoneNumber(vo.telnum,"N")}</td>
						<td>${mtl:makePhoneNumber(vo.mobilenum,"N")}</td>
						<td>${vo.email}</td>
						<td>${vo.isUse=='Y' ? '활성' : '비활성' }</td>
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
			<a href="/console/superAdmin/console_write" class="btn_m1">담당자 등록</a>
		</div>
	</div><!-- list-paging -->

		

</div>
<!-- //contents -->
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>