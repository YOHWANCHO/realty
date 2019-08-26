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
		f.attr("action","/console/customer/manager");
		f.submit();
	}
</script>
<!-- contents -->
<div class="contents">
	<h2 class="title_h2"><span class="spanTitle"></span></h2>
	<ul class="info_txt">
		<li>고객문의 권한을 관리할 수 있습니다.</li>
	</ul>

	<form name="searchForm" method="GET" >
		<input type="hidden" name="pageIndex" value="0">		
		<div class="search_box">
			<strong style="width:80px;">빌딩선택</strong>
			<select class="form_select" id="bldZone" name="bldZone" onchange="selecBbldDivision(this)">
				<option value="">지역선택</option>
				<c:forEach var="vo1" items="${combo1}" varStatus="status">
					<option value="${vo1.bldCodeSeq}" ${searchVO.bldZone eq vo1.bldCodeSeq?'selected':''}>${vo1.codeName}</option>
				</c:forEach>
			</select>
			<select class="form_select" id="bldDivision" name="bldDivision" onchange="selecBldInfoSeq('bldZone',this)">
				<option value="">빌딩구분</option>
				<c:forEach var="vo2" items="${combo2}" varStatus="status">
					<option value="${vo2.bldCodeSeq}" ${searchVO.bldDivision eq vo2.bldCodeSeq?'selected':''}>${vo2.codeName}</option>
				</c:forEach>
			</select>
			<select class="form_select" id="bldInfoSeq" name="bldInfoSeq">
				<option value="">빌딩명 선택</option>
				<c:forEach var="vo3" items="${combo3}" varStatus="status">
					<option value="${vo3.bldCodeSeq}" ${searchVO.bldInfoSeq eq vo3.bldCodeSeq?'selected':''}>${vo3.codeName}</option>
				</c:forEach>
			</select>
			<button type="button" class="btn_s1" onclick="searchList();">검색</button>
		</div>
	</form>
	<p class="txt_total">총 <strong>${searchVO.totalCount}</strong>개의 글이 검색되었습니다.</p>
	<div class="table_list">
		<table>
			<colgroup>
				<col style="width:25%;">
				<col style="width:25%;">
				<col style="width:25%;">				
				<col style="width:25%;">
			</colgroup>
			<thead>
				<tr>
					<th>빌딩명</th>
					<th>현장담당자</th>
					<th>CS 담당자</th>
					<th>PM'er</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4"><span>찾는 검색어 관련 내용이 없습니다.</span></td>
					</tr>
				</c:if>
				<c:forEach var="vo" items="${list}" varStatus="status">
					<tr>						
						<td><a href="/console/customer/manager_modify/${vo.bldManagerSeq}">${vo.bldName}</a></td>
						<td><a href="javascript:;" onclick="findAdminOne('${vo.placeManager}');">${vo.placeName}</a></td>
						<td><a href="javascript:;" onclick="findAdminOne('${vo.csManager}');">${vo.csName}</a></td>
						<td><a href="javascript:;" onclick="findAdminOne('${vo.pmer}');">${vo.pmerName}</a></td>
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
			<a href="/console/customer/manager_write" class="btn_m1">등록</a>
		</div>
	</div><!-- list-paging -->
</div>
<!-- //contents -->

<div class="layer_popup mfp-hide" id="pop_menu" style="width:450px;">
	<h3>고객문의 담당자 정보</h3>
	<div class="popup_con">
		<div class="table_view">
			<table>
				<colgroup>
					<col style="width:30%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>사번</th>
						<td><span id="admID">1234567</span></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><span id="admName">1234567</span></td>
					</tr>
					<tr>
						<th>부서</th>
						<td><span id="departmentName">1234567</span></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><span id="email">1234567</span></td>
					</tr>
					<tr>
						<th>사무실 번호</th>
						<td><span id="telnum">1234567</span></td>
					</tr>
					<tr>
						<th>핸드폰 번호</th>
						<td><span id="mobilenum">1234567</span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<a href="javascript:;" class="popup_close mfp-close">닫기</a>
</div>


<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>