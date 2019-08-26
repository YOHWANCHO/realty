<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_top.jsp"%>
<%@ include file="/WEB-INF/views/console/inc/inc_lnb.jsp"%>
<script type="text/javascript">
	$(function(){
		menuOn();
	});
	
// 	function searchList(){
// 		var f = $('form[name=searchForm]');
// 		f.attr("method","get");
// 		f.attr("action","/console/superAdmin/console");
// 		f.submit();
// 	}
	
</script>
<!-- contents -->
<div class="contents">
	<h2 class="title_h2"><span class="spanTitle"></span></h2>
	
	<form name="searchForm">
	<div class="search_box mt0">
		<strong>검색</strong>
		<input type="text" class="form_date" value="${searchVO.searchFromDate}" name="searchFromDate"/>
		~
		<input type="text" class="form_date" value="${searchVO.searchToDate}" name="searchToDate"/>
		<button class="btn_s1">검색</button>
		<button type="button" class="btn_s1" onclick="onExcelDown();">엑셀변환</button>
	</div>
	</form>

	<div class="info_box">
		<p>전체 방문자수 : <strong>${tot}</strong> 명</p>
		<span class="current_date">[${mtl:parseDateFormat('yyyy-MM-dd','today')}  ${mtl:parseDateFormat('HH:mm:ss','today')} 현재]</span>
	</div>

	<p class="txt_total"><strong>일반현황</strong> (${searchVO.searchFromDate} ~ ${searchVO.searchToDate})</p>
	<div class="table_list">
		<table>
			<colgroup>
				<col style="width:120px;">
				<col style="width:120px;">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>일자</th>
					<th>방문자수</th>
					<th>그래프</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td>합계</td>
					<td>${tot}</td>
					<td></td>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach var="vo" items="${list}" varStatus="status">
				<tr>
					<td>${vo.intDate}</td>
					<td>${vo.userCnt}</td>
					<td class="td_graph">
						<div class="graph_area"><span class="num" style="width:${vo.userCnt*100/tot}%;"></span></div>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<form name="exForm">
	<input type="hidden" name="searchFromDate" value="${searchVO.searchFromDate}">
	<input type="hidden" name="searchToDate" value="${searchVO.searchToDate}">	
</form>
<!-- //contents -->
<script>
$(function(){
	//datepicker
	$(".form_date").datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		changeYear: true
	});
});

function onExcelDown(){
	var fm = $('form[name=exForm]');
	fm.attr("method","get");
	fm.attr("action","/console/statistics/visit_excel");
	fm.submit();
}

</script>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>