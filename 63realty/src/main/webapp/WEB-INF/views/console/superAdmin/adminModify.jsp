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
					<th>사무실 번호</th>
					
					<td>
						<input type="text" value="${vo.arrTelnum[0]}" maxlength="3" class="form_input" style="width:35px; ime-mode:disabled;" name="telnum1" onkeydown="return onlyNumber(event)"/>
						-
						<input type="text" value="${vo.arrTelnum[1]}" maxlength="4" class="form_input" style="width:40px; ime-mode:disabled;" name="telnum2" onkeydown="return onlyNumber(event)"/>
						-
						<input type="text" value="${vo.arrTelnum[2]}" maxlength="4" class="form_input" style="width:40px; ime-mode:disabled;" name="telnum3" onkeydown="return onlyNumber(event)"/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" value="${vo.arrEmail[0]}" class="form_input" name="email1"/> @ <input type="text" value="${vo.arrEmail[1]}" class="form_input" style="width:140px;" name="email2"/>
					</td>
					<th>핸드폰 번호</th>
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
				<tr>
					<th>메뉴관리</th>
					<td colspan="3">
						<a href="javascript:;" onclick="popupOpen('#pop_menu');" class="btn_s1">메뉴권한설정</a>
						<div class="mt5" id="menuRoot">
							<c:forEach var="vo" items="${menuList}" varStatus="status">
								<c:if test="${vo.authChk eq 'Y' && vo.level ne '1'}">
									${vo.depthFullname}</br>
								</c:if>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<th>상태 <span class="required_txt">필수입력 사항</span></th>
					<td colspan="3">
						<label><input type="radio" name="isUse" class="form_chk" value="Y" ${vo.isUse eq "Y" ? "checked" : "" }/>활성</label>
						<label class="ml10"><input type="radio" name="isUse" class="form_chk" value="N" ${vo.isUse eq "N" ? "checked" : "" }/>비활성</label>
					</td>
				</tr>				
			</tbody>
		</table>
	</div>
	</form>
		
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction();">수정</a>
		<a href="javascript:;" class="btn_m1" onclick="deleteAdminMember('${vo.admID}')">삭제</a>
		<a href="/console/superAdmin/console" class="btn_m1">목록</a>
	</div>
</div>

<!-- 메뉴 레이어 팝업 -->
<div id="pop_menu" class="layer_popup mfp-hide">
	<h3>한화63시티 메뉴 권한</h3>
	<div class="popup_con">
		<div class="popup_tit">
			<h4>메뉴관리</h4>
			<span class="check_all"><label><input type="checkbox" class="form_chk chkAll" onclick="checkedAll()"/> 전체선택</label></span>
		</div>
		<div class="menu_check">
			<div class="check_box">
				<c:set value="-1" var="preRoot"/>
				<c:set value="1" var="groupNum"/>				
				<c:forEach items="${menuList}" var="menu" varStatus="status">
					<c:if test="${preRoot ne '-1' and menu.rootSeq ne preRoot}">
								</ul>
							</li>
						</ul>
						<c:if test="${groupNum == 3}">
							</div>
							<div class="check_box">
						</c:if>					
					<c:set value="${groupNum+1}" var="groupNum"/>
					</c:if>
					<c:choose>
						<c:when test="${menu.rootSeq ne preRoot }">
							<ul class="chk_list">
								<li><label><input type="checkbox" class="form_chk chkAll${menu.rootSeq} chkbox" onclick="checkedAllSub('${menu.rootSeq}')" ${menu.authChk eq "Y"?"checked":""} /> ${menu.menuName}</label>
									<ul>							
							<c:set value="${menu.rootSeq}" var="preRoot"/>
						</c:when>						
						<c:otherwise>			
								<li><label><input type="checkbox" class="form_chk chk${menu.rootSeq} chkbox chkData" data-root-seq="${menu.rootSeq}" data-menu-seq="${menu.menuSeq}" data-depth-fullname="${menu.depthFullname}" onclick="checkedSub('${menu.rootSeq}')" value="${menu.menuName}" ${menu.authChk eq "Y"?"checked":""}/> ${menu.menuName}</label></li>
		                  <c:if test="${status.last}">  				                    	
				                  </ul>
								</li>
							</ul>
		                    </c:if>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>

		<div class="btn_center">
			<a href="javascript:;" class="btn_m2" onclick="getAuth();">저장</a>
			<a href="javascript:;" class="btn_m1 mfp-close">취소</a>
		</div>
	</div>
	<a href="javascript:;" class="popup_close mfp-close">닫기</a>
</div>

<!-- //contents -->

<script>
$(function(){

});

function checkedAllSub(num){			//1뎁스 메뉴 체크시
	if($(".chkAll"+num).is(":checked")){
		$(".chk"+num).prop('checked', true);
	}else{
		$(".chk"+num).prop('checked', false);	
	}
	_checked();	//전체체크박스 체크
}

function checkedSub(num){			//2뎁스 메뉴 체크시
	var chkFlag=true;
	$.each($(".chk"+num),function(){
		if(!$(this).is(":checked")){
			chkFlag=false;
			return false;
		}
	});
	
	if(chkFlag){
		$(".chkAll"+num).prop('checked', true);
	}else{
		$(".chkAll"+num).prop('checked',false);
	}
	_checked();
}

function checkedAll(){ //전체선택 체크박스
	if($(".chkAll").is(":checked")){
		$(".chkbox").prop('checked', true);
	}else{
		$(".chkbox").prop('checked', false);	
	}
}

function _checked(){ //전체체크박스 체크
	var chkAllFlag=true;
	$.each($(".chkbox"),function(){
		if(!$(this).is(":checked")){
			chkAllFlag=false;
			return false;
		}
	});
	
	if(chkAllFlag){
		$(".chkAll").prop('checked', true);
	}else{
		$(".chkAll").prop('checked',false);
	}
}
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
	
	var telnum = frm.telnum1.value +frm.telnum2.value +frm.telnum3.value
	if(telnum != ""){
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
	}
	var email = frm.email1.value+"@"+frm.email2.value;
	if(email.replace("@","") != ""){
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
		
		if(!checkEmail(email)){
			alert("이메일 형식이 아닙니다.");
			return;
		}	
	}else{
		email="";
	}
	
	var mobilenum = frm.mobilenum1.value +frm.mobilenum2.value +frm.mobilenum3.value
	if(mobilenum != ""){
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
	}
	
	frm.email.value=email;
	frm.mobilenum.value=mobilenum 
	frm.telnum.value=telnum
	
	frm.action="/console/superAdmin/console_ModifyAction";
	frm.submit();
}

function getAuth(){
	var menuNum = new Array();
	var menuNames=""
	$.each($(".chkData"),function(){
		if($(this).is(":checked")){
			menuNames = menuNames + "<p>"+$(this).data("depthFullname")+"</p>";
			menuNum.push($(this).data("menuSeq"));
			menuNum.push($(this).data("rootSeq"));		
		}
	});
	//중복제거
	var menuSeqs = menuNum.reduce(function(a,b){if(a.indexOf(b)<0)a.push(b);return a;},[]);
		
	$("#menuRoot").empty();
	$("#menuRoot").html(menuNames);
	$("#menuSeqs").val(menuSeqs);
	$.magnificPopup.close();
}


</script>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>