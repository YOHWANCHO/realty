<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_top.jsp"%>
<%@ include file="/WEB-INF/views/console/inc/inc_lnb.jsp"%>
<script type="text/javascript">
	$(function(){
		menuOn();
	});
</script>
<!-- contents -->
<div class="contents">
	<h2 class="title_h2"><span class="spanTitle"></span></h2>

	<ul class="info_txt">
		<li>정확히 입력하신 후 [저장] 버튼을 누르시면 수정된 내용이 등록됩니다.</li>
		<li><span class="required_txt">필수입력 사항</span> 표시는 필수 항목입니다.</li>
	</ul>
	
	<form name="writeForm" method="POST">
	<input type="hidden" name="telnum">
	<input type="hidden" name="email">
	<input type="hidden" name="mobilenum">
	<input type="hidden" name="isUse" value="Y">
	<input type="hidden" name="admID" value="${vo.admID}">
	<input type="hidden" id="menuSeqs" name="menuSeqs">
	<div class="table_view">
		<table>
			<colgroup>
				<col style="width:100px;">
				<col style="width:320px;">
				<col style="width:100px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th>아이디</th>
					<td colspan="3">
						${vo.admID}						
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" value="" class="form_input" id="admPW" name="admPW"/></td>
					<th>비밀번호 확인</th>
					<td><input type="password" value="" class="form_input" id="admPW2" name="admPW2"/></td>
				</tr>
				<tr>
					<th>이름 <span class="required_txt">필수입력 사항</span></th>
					<td><input type="text" value="${vo.admName}" class="form_input" name="admName"/></td>
					<th>사무실 번호 <span class="required_txt">필수입력 사항</span></th>
					
					<td>
						<input type="text" value="${vo.arrTelnum[0]}" maxlength="3" class="form_input" style="width:35px; ime-mode:disabled;" name="telnum1" onkeydown="return onlyNumber(event)"/>
						-
						<input type="text" value="${vo.arrTelnum[1]}" maxlength="4" class="form_input" style="width:40px; ime-mode:disabled;" name="telnum2" onkeydown="return onlyNumber(event)"/>
						-
						<input type="text" value="${vo.arrTelnum[2]}" maxlength="4" class="form_input" style="width:40px; ime-mode:disabled;" name="telnum3" onkeydown="return onlyNumber(event)"/>
					</td>
				</tr>
				<tr>
					<th>이메일 <span class="required_txt">필수입력 사항</span></th>
					<td>
						<input type="text" value="${vo.arrEmail[0]}" class="form_input" name="email1"/> @ <input type="text" value="${vo.arrEmail[1]}" class="form_input" style="width:140px;" name="email2"/>
					</td>
					<th>핸드폰 번호 <span class="required_txt">필수입력 사항</span></th>
					<td>
						<input type="text" value="${vo.arrMobilenum[0]}" maxlength="3" class="form_input" style="width:35px; ime-mode:disabled;" name="mobilenum1" onkeydown="return onlyNumber(event)"/>
						-
						<input type="text" value="${vo.arrMobilenum[1]}" maxlength="4" class="form_input" style="width:40px; ime-mode:disabled;" name="mobilenum2" onkeydown="return onlyNumber(event)"/>
						-
						<input type="text" value="${vo.arrMobilenum[2]}" maxlength="4" class="form_input" style="width:40px; ime-mode:disabled;" name="mobilenum3" onkeydown="return onlyNumber(event)"/>
					</td>
				</tr>
				<tr>
					<th>부서</th>
					<td colspan="3"><input type="text" class="form_input" name="departmentName" value="${vo.departmentName}"/></td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
		
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction();">수정</a>
	</div>
</div>
<!-- //contents -->

<script>
function submitAction(){
	var frm = document.writeForm;
	
	if(frm.admPW.value != ""){
		if(!chkPw(frm.admPW.value)){
			alert("비밀번호는 영문+숫자+특수문자를 포함한 조합문자만 가능합니다.");
			frm.admPW.focus();
			return;
		}	
	}
	
	if(frm.admPW.value != frm.admPW2.value){
		alert("비밀번호를 확인해 주세요.");
		frm.admPW2.focus();
		return;
	}
	
	if(frm.admName.value == ""){
		alert("이름을 확인해 주세요.");
		frm.admName.focus();
		return;
	}
	
	if(frm.telnum1.value == ""){
		alert("사무실 번호를 확인해 주세요.");
		frm.telnum1.focus();
		return;
	}
	if(frm.telnum2.value == ""){
		alert("사무실 번호를 확인해 주세요.");
		frm.telnum2.focus();
		return;
	}
	if(frm.telnum3.value == ""){
		alert("사무실 번호를 확인해 주세요.");
		frm.telnum3.focus();
		return;
	}
	
	if(frm.email1.value == ""){
		alert("이메일을 확인해 주세요.");
		frm.email1.focus();
		return;
	}
	
	if(frm.email2.value == ""){
		alert("이메일을 확인해 주세요.");
		frm.email2.focus();
		return;
	}
	
	var email = frm.email1.value+"@"+frm.email2.value;
	if(!checkEmail(email)){
		alert("이메일 형식이 아닙니다.");
		return;
	}
	
	if(frm.mobilenum1.value == ""){
		alert("핸드폰 번호를 확인해 주세요.");
		frm.mobilenum1.focus();
		return;
	}
	if(frm.mobilenum2.value == ""){
		alert("핸드폰 번호를 확인해 주세요.");
		frm.mobilenum2.focus();
		return;
	}
	if(frm.mobilenum3.value == ""){
		alert("핸드폰 번호를 확인해 주세요.");
		frm.mobilenum3.focus();
		return;
	}
	
	frm.email.value=email;
	frm.mobilenum.value=frm.mobilenum1.value +frm.mobilenum2.value +frm.mobilenum3.value 
	frm.telnum.value=frm.telnum1.value +frm.telnum2.value +frm.telnum3.value
	
	frm.action="/console/myinfo/info_modifyAction";
	frm.submit();
}
</script>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>