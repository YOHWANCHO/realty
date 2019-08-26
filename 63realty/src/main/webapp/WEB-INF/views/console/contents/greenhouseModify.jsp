<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_top.jsp"%>
<%@ include file="/WEB-INF/views/console/inc/inc_lnb.jsp"%>
<script type="text/javascript" src="/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		menuOn();
	});	
</script>
<!-- contents -->
<div class="contents">
	<h2 class="title_h2"><span class="spanTitle"></span></h2>

	<ul class="info_txt">
		<li>에너지/온실가스배출실적을 년도별로 관리할 수 있습니다.</li>		
	</ul>
	
	<form name="writeForm" method="post">
		<input type="hidden" name="grYear" value="${list[0].grYear}" />		
		<div class="table_view v2">			
			<table>
				<colgroup>
					<col style="width:14%;">
					<col>
					<col style="width:15%;">
					<col style="width:15%;">
					<col style="width:15%;">
					<col style="width:15%;">
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">구분</th>
						<th rowspan="2">사업장</th>
						<th colspan="4">${list[0].grYear}</th>
					</tr>
					<tr>
						<th>1/4분기</th>
						<th>2/4분기</th>
						<th>3/4분기</th>
						<th>4/4분기</th>
					</tr>
				</thead>
				
				<c:set var="tcoFlag" value="T"/>
				<c:set var="toeFlag" value="T"/>
				<c:forEach var="vo" items="${list}" varStatus="status">
					<c:choose>
						<c:when test="${vo.grFlag eq '100'}">
							<c:choose>
								<c:when test="${tcoFlag eq 'T'}">
									<tbody>
									<tr class="tr_item">	
										<th rowspan="${colTco}">온실가스<br />배충량<br />(단위 : T-CO2)</th>
										<td><input type="text" class="form_input" name="tco" style="width:72%;" value="${vo.colPlace}"/> <a href="javascript:;" onclick="addTr(this,'tco');" class="btn_s1">+</a> <a href="javascript:;" onclick="removeTr(this);" class="btn_s1">-</a></td>
										<td><input type="text" class="form_input ar" name="tco" value="${vo.firstQ}"/></td>
										<td><input type="text" class="form_input ar" name="tco" value="${vo.secondQ}"/></td>
										<td><input type="text" class="form_input ar" name="tco" value="${vo.thirdQ}"/></td>
										<td><input type="text" class="form_input ar" name="tco" value="${vo.fourthQ}"/></td>
									</tr>
									<c:set var="tcoFlag" value="F"/>
								</c:when>
								<c:when test="${vo.colPlace eq 'tot'}">
										<tr>
											<td class="ac"><strong>소계</strong><input type="hidden" class="form_input ar" name="tco" value="tot"/></td>						
											<td><input type="text" class="form_input ar" name="tco" value="${vo.firstQ}"/></td>
											<td><input type="text" class="form_input ar" name="tco" value="${vo.secondQ}"/></td>
											<td><input type="text" class="form_input ar" name="tco" value="${vo.thirdQ}"/></td>
											<td><input type="text" class="form_input ar" name="tco" value="${vo.fourthQ}"/></td>
										</tr>
									</tbody>
								</c:when>
								<c:otherwise>
									<tr class="tr_item">
										<td><input type="text" class="form_input" name="tco" value="${vo.colPlace}"/></td>
										<td><input type="text" class="form_input ar" name="tco" value="${vo.firstQ}"/></td>
										<td><input type="text" class="form_input ar" name="tco" value="${vo.secondQ}"/></td>
										<td><input type="text" class="form_input ar" name="tco" value="${vo.thirdQ}"/></td>
										<td><input type="text" class="form_input ar" name="tco" value="${vo.fourthQ}"/></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:when>
						
						<c:when test="${vo.grFlag eq '200'}">
							<c:choose>
								<c:when test="${toeFlag eq 'T'}">
									<tbody>
									<tr class="tr_item">	
										<th rowspan="${colToe}">에너지<br />사용량<br />(단위 : TOE)</th>
										<td><input type="text" class="form_input" name="toe" style="width:72%;" value="${vo.colPlace}"/> <a href="javascript:;" onclick="addTr(this,'toe');" class="btn_s1">+</a> <a href="javascript:;" onclick="removeTr(this);" class="btn_s1">-</a></td>
										<td><input type="text" class="form_input ar" name="toe" value="${vo.firstQ}"/></td>
										<td><input type="text" class="form_input ar" name="toe" value="${vo.secondQ}"/></td>
										<td><input type="text" class="form_input ar" name="toe" value="${vo.thirdQ}"/></td>
										<td><input type="text" class="form_input ar" name="toe" value="${vo.fourthQ}"/></td>
									</tr>
									<c:set var="toeFlag" value="F"/>
								</c:when>
								<c:when test="${vo.colPlace eq 'tot'}">
										<tr>
											<td class="ac"><strong>소계</strong><input type="hidden" class="form_input ar" name="toe" value="tot"/></td>						
											<td><input type="text" class="form_input ar" name="toe" value="${vo.firstQ}"/></td>
											<td><input type="text" class="form_input ar" name="toe" value="${vo.secondQ}"/></td>
											<td><input type="text" class="form_input ar" name="toe" value="${vo.thirdQ}"/></td>
											<td><input type="text" class="form_input ar" name="toe" value="${vo.fourthQ}"/></td>
										</tr>
									</tbody>
								</c:when>
								<c:otherwise>
									<tr class="tr_item">
										<td><input type="text" class="form_input" name="toe" value="${vo.colPlace}"/></td>
										<td><input type="text" class="form_input ar" name="toe" value="${vo.firstQ}"/></td>
										<td><input type="text" class="form_input ar" name="toe" value="${vo.secondQ}"/></td>
										<td><input type="text" class="form_input ar" name="toe" value="${vo.thirdQ}"/></td>
										<td><input type="text" class="form_input ar" name="toe" value="${vo.fourthQ}"/></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
				</c:forEach>
				<tbody>
					<tr>
						<th colspan="2" class="ac">하단 디스크립션</th>
						<td colspan="4"><input type="text" class="form_input" name="grDesc" value="${list[0].grDesc}"/></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction();">수정</a>
		<a href="javascript:;" class="btn_m1" onclick="deleteGreehHouseYear('${list[0].grYear}');">삭제</a>
		<a href="javascript:;" class="btn_m1" onclick="goList('${reqUri}')">목록</a>
	</div>
</div>
<!-- //contents -->

<script>
$(function(){
	
});

//add tr
function addTr(obj,name){
	var $th = $(obj).parent().prev("th");
	var rowNum = $th.prop("rowspan");
	$th.prop("rowspan", ++rowNum);

	$(obj).parents("tbody").children(".tr_item").last().after('<tr class="tr_item"><td><input type="text" class="form_input" name="'+name+'"/></td><td><input type="text" class="form_input ar" name="'+name+'"/></td><td><input type="text" class="form_input ar" name="'+name+'"/></td><td><input type="text" class="form_input ar" name="'+name+'"/></td><td><input type="text" class="form_input ar" name="'+name+'"/></td></tr>');
}

//remove tr
function removeTr(obj){
	var $th = $(obj).parent().prev("th");
	var rowNum = $th.prop("rowspan");

	var $item = $(obj).parents("tbody").children(".tr_item");
	if($item.length > 1){
		$th.prop("rowspan", --rowNum);
		$item.last().remove();
	}
}

function submitAction(){
	var frm = document.writeForm;

	var url = "${reqUri}";
	var indexUrl = url.lastIndexOf("/");
	url = url.substring(0,indexUrl);
	
	frm.action=url+"Action";
	frm.submit();
}
</script>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>