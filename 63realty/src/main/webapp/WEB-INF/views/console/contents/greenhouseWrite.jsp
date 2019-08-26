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
		<li>에너지/온실가스 배출실적을 분기별로 입력할 수 있습니다.</li>		
	</ul>

	<form name="writeForm" method="post">
		<div class="table_view">
			<table>
				<colgroup>
					<col style="width:25%;">
					<col style="width:25%;">
					<col style="width:25%;">
					<col style="width:25%;">
				</colgroup>
				<tbody>					
					<tr>
						<th>년도 선택<span class="required_txt">필수입력 사항</span></th>
						<td colspan="3">
							<select class="form_select" name="grYear"> 
								<c:forEach varStatus="status" begin="2017" end="2030">
									<option value="${status.current}" ${status.current eq today?'selected':''}>${status.current}</option>
								</c:forEach>
							</select>년
						</td>
					</tr>					
				</tbody>
			</table>
		</div>
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
						<th colspan="4">2017</th>
					</tr>
					<tr>
						<th>1/4분기</th>
						<th>2/4분기</th>
						<th>3/4분기</th>
						<th>4/4분기</th>
					</tr>
				</thead>
				<tbody>
					<tr class="tr_item">
						<th rowspan="2">온실가스<br />배충량<br />(단위 : T-CO2)</th>
						<td><input type="text" class="form_input" name="tco" style="width:72%;" /> <a href="javascript:;" onclick="addTr(this,'tco');" class="btn_s1">+</a> <a href="javascript:;" onclick="removeTr(this);" class="btn_s1">-</a></td>
						<td><input type="text" class="form_input ar" name="tco"/></td>
						<td><input type="text" class="form_input ar" name="tco"/></td>
						<td><input type="text" class="form_input ar" name="tco"/></td>
						<td><input type="text" class="form_input ar" name="tco"/></td>
					</tr>
					<tr>
						<td class="ac"><strong>소계</strong><input type="hidden" class="form_input ar" name="tco" value="tot"/></td>						
						<td><input type="text" class="form_input ar" name="tco"/></td>
						<td><input type="text" class="form_input ar" name="tco"/></td>
						<td><input type="text" class="form_input ar" name="tco"/></td>
						<td><input type="text" class="form_input ar" name="tco"/></td>
					</tr>
				</tbody>
				<tbody>
					<tr class="tr_item">
						<th rowspan="2">에너지<br />사용량<br />(단위 : TOE)</th>
						<td><input type="text" class="form_input" name="toe" style="width:72%;" /> <a href="javascript:;" onclick="addTr(this,'toe');" class="btn_s1">+</a> <a href="javascript:;" onclick="removeTr(this);" class="btn_s1">-</a></td>
						<td><input type="text" class="form_input ar" name="toe"/></td>
						<td><input type="text" class="form_input ar" name="toe"/></td>
						<td><input type="text" class="form_input ar" name="toe"/></td>
						<td><input type="text" class="form_input ar" name="toe"/></td>
					</tr>
					<tr>
						<td class="ac"><strong>소계</strong><input type="hidden" class="form_input ar" name="toe"  value="tot"/></td>						
						<td><input type="text" class="form_input ar" name="toe"/></td>
						<td><input type="text" class="form_input ar" name="toe"/></td>
						<td><input type="text" class="form_input ar" name="toe"/></td>
						<td><input type="text" class="form_input ar" name="toe"/></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th colspan="2" class="ac">하단 디스크립션</th>
						<td colspan="4"><input type="text" class="form_input" name="grDesc"/></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
		
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction()">저장</a>
	</div>
</div>
<!-- //contents -->
<script>
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
 	checkDupYearGreen(frm);
}

function checkDupYearGreen(frm){
	
	$.ajax({
		url:'/ajax/checkDupYearGreen',
		dataType:'json',
		type:'POST',
		data : 
		{
			grYear : frm.grYear.value
		},
		success:function(result){
			if(result.result=="Y"){				
				frm.action="${reqUri}Action";
				frm.submit();					
			}else{
				alert("이미 등록된 년도 입니다.");
				frm.grYear.focus();
			}
		},
		error:function(request,status,error){
			alert("에러");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}

	});
}



</script>

<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>