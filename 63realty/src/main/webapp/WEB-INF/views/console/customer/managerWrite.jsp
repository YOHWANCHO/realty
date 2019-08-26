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
		<li>고객문의 권한을 관리할 수 있습니다.</li>		
	</ul>
	
	<form name="writeForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bldTelnum">
		<div class="search_box">
			<strong style="width:80px;">빌딩선택<span class="required_txt">필수입력 사항</span></strong>
			<select class="form_select" id="bldZone" name="bldZone" onchange="selecBbldDivision(this)">
				<option value="">지역선택</option>
				<c:forEach var="vo" items="${list}" varStatus="status">
					<option value="${vo.bldCodeSeq}">${vo.codeName}</option>
				</c:forEach>
			</select>
			<select class="form_select" id="bldDivision" name="bldDivision" onchange="selecBldInfoSeqManager('bldZone',this)">
				<option value="">빌딩구분</option>
			</select>
			
			<select class="form_select" id="bldInfoSeq" name="bldInfoSeq">
				<option value="">빌딩명 선택</option>				
			</select>						
		</div>
		
		<div class="table_view">
			<table>
				<colgroup>
					<col style="width:100px;">					
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>현장 담당자</th>
						<td>
							<span>
								<input type="text" value="" class="form_input" id="placeManager_name" readonly style="width:15%;"/>
								<input type="text" value="" class="form_input" id="placeManager" name="placeManager" readonly style="width:25%;"/>
								<input type="text" value="" class="form_input" id="placeManager_dpt" readonly style="width:35%;"/>								
								<button type="button" class="btn_s1" onclick="popupOpenAdmin('#pop_menu','placeManager','현장 담당자');">담당자 선택</button>
								<button type="button" class="btn_s2" onclick="deleteManager('placeManager');">삭제</button>
							</span>
						</td>
					</tr>					
					<tr>
						<th>CS 담당자<span class="required_txt">필수입력 사항</span></th>
						<td>
							<span>
								<input type="text" value="" class="form_input" id="csManager_name" readonly style="width:15%;"/>
								<input type="text" value="" class="form_input" id="csManager" name="csManager" readonly style="width:25%;"/>
								<input type="text" value="" class="form_input" id="csManager_dpt" readonly style="width:35%;"/>								
								<button type="button" class="btn_s1" onclick="popupOpenAdmin('#pop_menu','csManager','CS 담당자');">담당자 선택</button>
								<button type="button" class="btn_s2" onclick="deleteManager('csManager');">삭제</button>
							</span>
						</td>
					</tr>					
					<tr>
						<th>PM'er</th>
						<td>
							<span>
								<input type="text" value="" class="form_input" id="pmer_name" readonly style="width:15%;"/>
								<input type="text" value="" class="form_input" id="pmer" name="pmer"readonly style="width:25%;"/>
								<input type="text" value="" class="form_input" id="pmer_dpt" readonly style="width:35%;"/>								
								<button type="button" class="btn_s1" onclick="popupOpenAdmin('#pop_menu','pmer','PM\'er');">담당자 선택</button>
								<button type="button" class="btn_s2" onclick="deleteManager('pmer');">삭제</button>
							</span>
						</td>
					</tr>					
				</tbody>
			</table>
		</div>
	</form>
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction();">등록</a>		
		<a href="/console/customer/manager" class="btn_m1">목록</a>
	</div>
</div>

<!-- 담당자 레이어 팝업 -->
<div class="layer_popup mfp-hide" id="pop_menu">
	<h3>고객문의 담당자 관리</h3>
	<div class="popup_con">
		<div class="search_box">
			<strong><span id="selName"></span> 지정</strong>
			<select class="form_select" name="searchType" id="searchType">
				<option value="name">이름</option>
				<option value="num">사번</option>
				<option value="team">부서</option>
			</select>
			<input type="text" value="" class="form_input" id="searchText" name="searchText"/>
			<input type="hidden" value="" id="_Flag" />
			<button class="btn_s1" type="button" onclick="findAdminList(0);">검색</button>
		</div>
		<div id="ajaxSearchTable">
			<div class="table_list mt10">
				<table>
					<colgroup>
						<col style="width:30%;">
						<col style="width:30%;">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>사번</th>
							<th>이름</th>
							<th>부서</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3">고객문의 담당자를 검색해 주세요.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="page_wrap">
				<a href="javascript:;" class="btn_arrow btn_first"><img src="/resources/console/img/btn_first.gif" alt="" /></a>
				<a href="javascript:;" class="btn_arrow btn_prev"><img src="/resources/console/img/btn_prev.gif" alt="" /></a>
				<a href="javascript:;" class="current">0</a>			
				<a href="javascript:;" class="btn_arrow btn_next"><img src="/resources/console/img/btn_next.gif" alt="" /></a>
				<a href="javascript:;" class="btn_arrow btn_last"><img src="/resources/console/img/btn_last.gif" alt="" /></a>
			</div>
		</div>	
	</div>
	<a href="javascript:;" class="popup_close mfp-close" onclick="javascript:$('#_Flag').val('');">닫기</a>
</div>
<!-- //팝업 -->

<!-- //contents -->

<script>

function setManager(id,name,dpt){
	var flag = $("#_Flag").val();
	$("#"+flag+"_name").val(name);	//이름
	$("#"+flag).val(id);					//사번
	$("#"+flag+"_dpt").val(dpt);		//부서
	$('#_Flag').val('');
	$.magnificPopup.close();
}
function deleteManager(id){	
	$("#"+id+"_name").val('');	//이름
	$("#"+id).val('');					//사번
	$("#"+id+"_dpt").val('');		//부서	
}

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
	if(frm.bldInfoSeq.value == ""){
		alert("건물명을 입력해 주세요.");
		frm.bldInfoSeq.focus();
		return;
	}
	
	var placeManager = frm.placeManager.value;
	var csManager = frm.csManager.value;
	var pmer = frm.pmer.value;
	
	if(csManager == ""){
		alert("CS 담당자를 입력해 주세요.");		
		return;
	}	
	
	var sameflag = false;
	if(placeManager==csManager || csManager==pmer || pmer == placeManager){
		if(pmer == "" && placeManager == ""){
			sameflag = false;
		}else{
			sameflag = true;	
		}
	}
	
	if(sameflag){
		alert("중복된 담당자가 있습니다.");
		return;
	}
	
	frm.action="/console/customer/manager_writeAction";
	frm.submit();
}


</script>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>