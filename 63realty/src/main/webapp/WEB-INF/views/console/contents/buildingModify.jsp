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
		<li>빌딩개요</li>		
	</ul>
	
	<form name="writeForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bldTelnum">			
		<input type="hidden" name="bldInfoSeq" value="${vo.bldInfoSeq}">			
		<div class="search_box">
			<strong style="width:80px;">빌딩선택<span class="required_txt">필수입력 사항</span></strong>
			<select class="form_select" id="bldZone" name="bldZone" onchange="selecBbldDivision(this)">
				<option value="">지역선택</option>
				<c:forEach var="vo1" items="${combo1}" varStatus="status">
					<option value="${vo1.bldCodeSeq}" ${vo.bldZone eq vo1.bldCodeSeq?'selected':''}>${vo1.codeName}</option>
				</c:forEach>
			</select>
			<select class="form_select" id="bldDivision" name="bldDivision" onchange="selecBldInfoSeq('bldZone',this)">
				<option value="">빌딩구분</option>
				<c:forEach var="vo2" items="${combo2}" varStatus="status">
					<option value="${vo2.bldCodeSeq}" ${vo.bldDivision eq vo2.bldCodeSeq?'selected':''}>${vo2.codeName}</option>
				</c:forEach>
			</select>
		</div>
		
		
		<div class="table_view">
			<table>
				<colgroup>
					<col style="width:100px;">
					<col style="width:268px;">
					<col style="width:100px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>노출여부</th>
						<td colspan="3">
							<input type="checkbox" name="bldFlagMg" id="bldFlagMg" name="bldFlagMg" value="Y" ${vo.bldFlagMg eq 'Y'? 'checked':'' }><label for="bldFlagMg">빌딩현황 관리</label>
							<input type="checkbox" name="bldFlagCu" id="bldFlagCu" name="bldFlagCu" value="Y" ${vo.bldFlagCu eq 'Y'? 'checked':'' }><label for="bldFlagCu">고객의 소리</label>
						</td>
					</tr>
					<tr>
						<th>건물명<span class="required_txt">필수입력 사항</span></th>
						<td colspan="3">
							<input type="text" class="form_input" name="bldName" value="${vo.bldName}" style="width:96%;"/>
						</td>
					</tr>
					<tr>
						<th>주소<span class="required_txt">필수입력 사항</span></th>
						<td colspan="3">
							<input type="text" class="form_input" name="bldAddr" value="${vo.bldAddr}" style="width:96%;"/>
						</td>
					</tr>
					<tr>
						<th>담당자</th>
						<td><input type="text" class="form_input" name="bldManager" value="${vo.bldManager}"/></td>
						<th>연락처</th>
						<td>
							<input type="text" value="${vo.arrBldTelnum[0]}" maxlength="3" class="form_input" style="width:35px; ime-mode:disabled;" name="bldTelnum1" onkeydown="return onlyNumber(event)"/>
							-
							<input type="text" value="${vo.arrBldTelnum[1]}" maxlength="4" class="form_input" style="width:40px; ime-mode:disabled;" name="bldTelnum2" onkeydown="return onlyNumber(event)"/>
							-
							<input type="text" value="${vo.arrBldTelnum[2]}" maxlength="4" class="form_input" style="width:40px; ime-mode:disabled;" name="bldTelnum3" onkeydown="return onlyNumber(event)"/>
						</td>
					</tr>
					<tr>
						<th>빌딩규모</th>
						<td>
							<input type="text" class="form_input" name="bldScale" value="${vo.bldScale}"/>
						</td>
						<th>주차대수</th>
						<td>
							<input type="text"  class="form_input" name="bldParking" value="${vo.bldParking}"/> 대
						</td>
					</tr>
					<tr>
						<th>연면적</th>
						<td>
							<input type="text"  class="form_input" name="bldArea" value="${vo.bldArea}"/> ㎡
						</td>
						<th>전용률</th>
						<td>
							<input type="text"  class="form_input" name="bldRate" value="${vo.bldRate}"/> %
						</td>
					</tr>
					<tr>
						<th>준공일</th>
						<td>
							<input type="text"  class="form_input" id="bldCompletion" name="bldCompletion" value="${vo.bldCompletion}" readonly/>
						</td>
						<th>높이</th>
						<td>
							<input type="text"  class="form_input" name="bldCeiling" value="${vo.bldCeiling}"/> m
						</td>
					</tr>
					<!--<tr>
						<th>E/V</th>
						<td>
							<input type="text"  class="form_input" name="bldEv" value="${vo.bldEv}"/> 대
						</td>
						<th>기준층(전용/임대)</th>
						<td>
							<input type="text"  class="form_input" name="bldTypicalFloor" value="${vo.bldTypicalFloor}"/> ㎡
						</td>
					</tr>
					<tr>
						<th>주차조건</th>
						<td colspan="3">
							<input type="text" class="form_input" name="bldParkInfo" value="${vo.bldParkInfo}" style="width:96%;"/>
						</td>
					</tr>-->
					
					<tr>
						<th>빌딩사진</th>
						<td colspan="3">
							<input type="text" name="fileName" id="fileName" value="${fileVO.fileOrgnm}" readonly class="form_input" style="width:60%;" />
							<span class="btn_file" ${empty fileVO.fileOrgnm ? '':'style="display:none"' }>
								<button class="btn_s1">파일올리기</button>
								<input type="file" name="uploadBldFile" onchange="javascript:document.getElementById('fileName').value = this.value" class="attachFile_" data-file-type="img" />
							</span>
<!-- 							<button class="btn_s1" type="button" onclick="fileCancle(this);">취소</button> -->
						<c:if test="${not empty fileVO.fileOrgnm}">
							<span>								
								<a href="/comm/buildingFileDownload?bldInfoSeq=${fileVO.bldInfoSeq}" class="btn_s1">다운로드</a>
								<button class="btn_s2" type="button" onclick="deleteBuildingFile('${fileVO.filePath}${fileVO.fileSavenm}','${fileVO.bldInfoFileSeq}',this);">삭제</button>
							</span>
						</c:if>
						</td>
					</tr>
					<tr>
						<th>특장점</th>
						<td colspan="3" class="edit_area">
							<textarea name="bldContents" id="bldContents" rows="10" cols="100" style="width: 100%;">${vo.bldContents}</textarea>
						</td>
					</tr>
					<tr>
						<th>위치정보</th>
						<td colspan="3">
							X축 : <input type="text" class="form_input" name="bldLocaleX" value="${vo.bldLocaleX}"/>
							Y축 : <input type="text" class="form_input" name="bldLocaleY" value="${vo.bldLocaleY}"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction();">수정</a>
		<a href="javascript:;" class="btn_m1" onclick="deleteBuilding('${vo.bldInfoSeq}');">삭제</a>
		<a href="/console/contents/building" class="btn_m1">목록</a>
	</div>
</div>
<!-- //contents -->

<script>
var obj = [];
$(function(){
	//datepicker
	$("#bldCompletion").datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		changeYear: true
	});
	
  	nhn.husky.EZCreator.createInIFrame({
  	    oAppRef: obj,
  	    elPlaceHolder: "bldContents",
  	    sSkinURI: "/resources/se/SmartEditor2Skin.html",
  	    htParams : {
  	        // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
  	        bUseToolbar : true,            
  	        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
  	        bUseVerticalResizer : true,    
  	        // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
  	        bUseModeChanger : true,
  	    }
  	});
});

function submitAction(){
	var frm = document.writeForm;
	
	if(frm.bldZone.value == ""){
		alert("지역을 선택해 주세요.");
		frm.bldZone.focus();
		return;
	}
	if(frm.bldDivision.value == ""){
		alert("빌딩구분을 선택해 주세요.");
		frm.bldDivision.focus();
		return;
	}
	if(frm.bldName.value == ""){
		alert("건물명을 입력해 주세요.");
		frm.bldName.focus();
		return;
	}
	
	if(frm.bldAddr.value == ""){
		alert("주소를 입력해 주세요.");
		frm.bldAddr.focus();
		return;
	}
	var msg = checkFile();
	
	if(msg != ""){
		alert(msg);
		return false;
	}
	
	frm.bldTelnum.value=frm.bldTelnum1.value +frm.bldTelnum2.value +frm.bldTelnum3.value
	
	obj.getById["bldContents"].exec("UPDATE_CONTENTS_FIELD", []);
	
	frm.action="/console/contents/building_modifyAction";
	frm.submit();
}


</script>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>