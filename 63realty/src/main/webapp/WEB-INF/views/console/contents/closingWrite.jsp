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
		<li>재무상태표를 년도별로 관리할 수 있습니다.</li>		
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
							<select class="form_select" name="blYear"> 
								<c:forEach varStatus="status" begin="2017" end="2030">
									<option value="${status.current}" ${status.current eq today?'selected':''}>${status.current}</option>
								</c:forEach>
							</select>년
						</td>
					</tr>
					<tr>
						<th>재무상태표<span class="required_txt">필수입력 사항</span></th>
						<td colspan="3">
							<input type="text" class="form_input" name="blTitle" style="width:96%;" />							
						</td>
					</tr>
					<tr>
						<th>계정과목</th>
						<th>금액</th>
						<th>계정과목</th>
						<th>금액</th>
					</tr>
					<tr>
						<th colspan="2">자산</th>
						<th colspan="2">부채</th>
					</tr>
					<tr>
						<th>ⅰ유동자산</th>
						<td><input type="text" class="form_input" style="width:94%;" name="a1m0"></td>
						<th>ⅰ유동부채</th>
						<td><input type="text" class="form_input" style="width:94%;" name="l1m0"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a1c1"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a1m1"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1c1"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1m1"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a1c2"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a1m2"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1c2"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1m2"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a1c3"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a1m3"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1c3"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1m3"></td>
					</tr>					
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a1c4"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a1m4"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1c4"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1m4"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a1c5"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a1m5"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1c5"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l1m5"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a1c6"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a1m6"></td>
						<th>ⅱ비유동부채</th>
						<td><input type="text" class="form_input" style="width:94%;" name="l2m0"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a1c7"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a1m7"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l2c1"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l2m1"></td>
					</tr>
					<tr>
						<th>ⅱ비유동자산</th>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m0"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l2c2"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l2m2"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a2c1"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m1"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l2c3"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l2m3"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a2c2"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m2"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l2c4"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="l2m4"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a2c3"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m3"></td>
						<th>부채총계</th>
						<td><input type="text" class="form_input" style="width:94%;" name="liaTot"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a2c4"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m4"></td>
						<th colspan="2">자본</th>						
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a2c5"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m5"></td>
						<th>ⅰ자본금</th>
						<td><input type="text" class="form_input" style="width:94%;" name="c1m0"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a2c6"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m6"></td>
						<th>ⅱ기타자본구성요소</th>
						<td><input type="text" class="form_input" style="width:94%;" name="c1m1"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a2c7"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m7"></td>
						<th>ⅲ이익잉여금</th>
						<td><input type="text" class="form_input" style="width:94%;" name="c1m2"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a2c8"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m8"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="c1c1"></td>
						<td><input type="text" class="form_input" style="width:94%;"name="c1m3"></td>
					</tr>
					<tr>
						<td><input type="text" class="form_input" style="width:94%;" name="a2c9"></td>
						<td><input type="text" class="form_input" style="width:94%;" name="a2m9"></td>
						<th>자본총계</th>
						<td><input type="text" class="form_input" style="width:94%;" name="capTot"></td>
					</tr>
					<tr>
						<th>자산총계</th>
						<td><input type="text" class="form_input" style="width:94%;" name="assTot"></td>
						<th>부채및자본총계</th>
						<td><input type="text" class="form_input" style="width:94%;" name="capLiaTot"></td>
					</tr>
					<tr>
						<th>일시</th>
						<td colspan="3"><input type="text" class="form_input" style="width:94%;" name="commentDate"></td>						
					</tr>
					<tr>
						<th>하단 디스크립션</th>
						<td colspan="3" class="edit_area">
							<textarea name="blDesc" id="blDesc" rows="10" cols="100" style="width: 100%;"></textarea>
						</td>						
					</tr>
										
				</tbody>
			</table>
		</div>
	</form>
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction();">등록</a>		
		<a href="javascript:;" class="btn_m1" onclick="goList('${reqUri}')">목록</a>
	</div>
</div>
<!-- //contents -->

<script>

$(function(){

});

function submitAction(){
	var frm = document.writeForm;
	
	if(frm.blTitle.value == ""){
		alert("재무상태표 제목을 입력해 주세요.");
		frm.blTitle.focus();
		return;
	}
	
	checkDupYear(frm);
}

function checkDupYear(frm){
	
	$.ajax({
		url:'/ajax/checkDupYear',
		dataType:'json',
		type:'POST',
		data : 
		{
			blYear : frm.blYear.value
		},
		success:function(result){
			if(result.result=="Y"){				
				frm.action="${reqUri}Action";
				frm.submit();					
			}else{
				alert("이미 등록된 년도 입니다.");
				frm.blYear.focus();
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