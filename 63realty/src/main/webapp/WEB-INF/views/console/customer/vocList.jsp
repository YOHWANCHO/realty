<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_top.jsp"%>
<%@ include file="/WEB-INF/views/console/inc/inc_lnb.jsp"%>
<script type="text/javascript">
	$(function(){
		menuOn();
	});
	
	function searchList(){
		var f = $('form[name=searchForm]');		
		
		f.submit();
	}
</script>
<!-- contents -->
<div class="contents">
	<h2 class="title_h2"><span class="spanTitle"></span></h2>
	<ul class="info_txt">
		<li>고객의 소리를 관리할 수 있습니다.</li>
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
			
			<div class="mt5">
				<strong style="width:80px;">등록일</strong>				
				<input type="text" class="form_input" id="searchFromDate" name="searchFromDate" readonly style="width:100px;" value="${searchVO.searchFromDate}"/>~
				<input type="text" class="form_input" id="searchToDate" name="searchToDate" readonly style="width:100px;" value="${searchVO.searchToDate}"/>
			</div>
			
			<div class="mt5">
				<strong style="width:80px;">내용분류</strong>
				<label><input type="checkbox" name="arrCustCate" value="310" ${fn:contains(fn:join(searchVO.arrCustCate,','),'310')? 'checked':''}/> 칭찬</label>
				<label><input type="checkbox" name="arrCustCate" value="311" ${fn:contains(fn:join(searchVO.arrCustCate,','),'311')? 'checked':''}/> 요청</label>
				<label><input type="checkbox" name="arrCustCate" value="312" ${fn:contains(fn:join(searchVO.arrCustCate,','),'312')? 'checked':''}/> 문의</label>
				<label><input type="checkbox" name="arrCustCate" value="313" ${fn:contains(fn:join(searchVO.arrCustCate,','),'313')? 'checked':''}/> 불만</label>
				<label><input type="checkbox" name="arrCustCate" value="319" ${fn:contains(fn:join(searchVO.arrCustCate,','),'319')? 'checked':''}/> 기타</label>
			</div>
			<div class="mt5">
				<strong style="width:80px;">분야</strong>
				<label><input type="checkbox" name="arrCustField" value="210" ${fn:contains(fn:join(searchVO.arrCustField,','),'210')? 'checked':''}/> 인적서비스</label> 
				<label><input type="checkbox" name="arrCustField" value="211" ${fn:contains(fn:join(searchVO.arrCustField,','),'211')? 'checked':''}/> 공용공간 환경</label>
				<label><input type="checkbox" name="arrCustField" value="212" ${fn:contains(fn:join(searchVO.arrCustField,','),'212')? 'checked':''}/> 시설관리</label>
				<label><input type="checkbox" name="arrCustField" value="213" ${fn:contains(fn:join(searchVO.arrCustField,','),'213')? 'checked':''}/> 기타</label>
			</div>
			<div class="mt5">
				<strong style="width:80px;">키워드</strong>
				<select class="form_select" >
					<option value="s_title" ${searchVO.searchType eq "s_title" ? "selected" : ""}>제목</option>
					<option value="s_name" ${searchVO.searchType eq "s_name" ? "selected" : ""}>작성자</option>
					<option value="s_contents" ${searchVO.searchType eq "s_contents" ? "selected" : ""}>내용</option>				
				</select>
				<input type="text" value="" class="form_input" name="searchText" value="${searchVO.searchText}"/>
				<button type="button" class="btn_s1" onclick="searchList();">검색</button>
			</div>
			
			<div class="mt5">
				<strong style="width:80px;">노출여부</strong>				
				<label><input type="radio" name="isUse" class="form_chk" value="" ${searchVO.isUse eq ''?"checked" : ""} />모두</label>
				<label class="ml10"><input type="radio" name="isUse" class="form_chk" value="Y" ${searchVO.isUse eq 'Y'?"checked" : ""} />예</label>
				<label class="ml10"><input type="radio" name="isUse" class="form_chk" value="N" ${searchVO.isUse eq 'N'?"checked" : ""} />아니오</label>
			</div>			
		</div>
	</form>
	<p class="txt_total">총 <strong>${searchVO.totalCount}</strong>개의 글이 검색되었습니다.</p>
	<div class="table_list">
		<table>
			<colgroup>
				<col style="width:5%;">
				<col style="width:10%;">
				<col style="width:15%;">				
				<col>
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:10%;">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>내용분류</th>
					<th>빌딩구분</th>
					<th>제목</th>
					<th>문의자</th>
					<th>접수일자</th>
					<th>답변여부</th>
					<th>노출</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="8"><span>찾는 검색어 관련 내용이 없습니다.</span></td>
					</tr>
				</c:if>
				<c:forEach var="vo" items="${list}" varStatus="status">
					<c:choose>
						<c:when test="${vo.custCate eq '310'}">
							<c:set value="칭찬" var="custCateName"/>
						</c:when>
						<c:when test="${vo.custCate eq '311'}">
							<c:set value="요청" var="custCateName"/>
						</c:when>
						<c:when test="${vo.custCate eq '312'}">
							<c:set value="문의" var="custCateName"/>
						</c:when>
						<c:when test="${vo.custCate eq '313'}">
							<c:set value="불만" var="custCateName"/>
						</c:when>
						<c:when test="${vo.custCate eq '319'}">
							<c:set value="기타" var="custCateName"/>
						</c:when>
						<c:otherwise>
							<c:set value="" var="custCateName"/>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${vo.isReply eq 'Y'}">
							<c:set var="url" value="/console/customer/voc_modify/${vo.custVoiceSeq}"/>	
						</c:when>
						<c:otherwise>
							<c:set var="url" value="/console/customer/voc_reply/${vo.custVoiceSeq}"/>	
						</c:otherwise>
					</c:choose>
					
					<tr>
						<td>${searchVO.totalCount - ( status.index+((searchVO.pageIndex-1)*searchVO.pageCount))}</td>						
						<td>${custCateName}</td>
						<td>${vo.bldName}</td>
						<td><a href="${url}">${vo.custTitle}</a></td>						
						<td>${vo.custName}</td>
						<td>${mtl:parseDateFormat('yyyy-MM-dd HH:mm',vo.regDate)}</td>
						<td>${vo.isReply}</td>
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
					<c:when test="${i eq searchVO.pageIndex}">
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