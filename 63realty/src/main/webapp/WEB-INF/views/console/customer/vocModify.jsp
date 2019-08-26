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
		
	</ul>
	
	<form name="writeForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="custVoiceSeq" value="${vo.custVoiceSeq}">
		<input type="hidden" name="replyType">
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
						<th>성명</th>
						<td>
							${vo.custName}
						</td>
						<th>등록일</th>
						<td>
							${vo.regDate}
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							${mtl:makePhoneNumber(vo.custPhone,"N")}
						</td>
						<th>이메일</th>
						<td>
							${vo.custEmail}
						</td>
					</tr>
					<tr>
						<th>내용분류</th>
						<td>
							${vo.custCateName}
						</td>
						<th>분야</th>
						<td>
							${vo.custFieldname}
						</td>
					</tr>
					
					<tr>
						<th>빌딩구분</th>
						<td colspan="3">
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
							<select class="form_select" id="bldInfoSeq" name="bldInfoSeq">
								<option value="">빌딩명 선택</option>
								<c:forEach var="vo3" items="${combo3}" varStatus="status">
									<option value="${vo3.bldCodeSeq}" ${vo.bldInfoSeq eq vo3.bldCodeSeq?'selected':''}>${vo3.codeName}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>홈페이지 노출여부</th>
						<td>
							<label><input type="radio" name="isUse" class="form_chk" value="Y" ${vo.isUse eq 'Y'?"checked" : ""} />예</label>
							<label class="ml10"><input type="radio" name="isUse" class="form_chk" value="N" ${vo.isUse eq 'N'?"checked" : ""} />아니오</label>
							<button class="btn_s1" type="button" onclick="chgCustVoiceIsUse('${vo.custVoiceSeq}');">변경</button>
						</td>
						<th>한화톡톡</th>
						<td>
							${vo.isTolk}
						</td>							
					</tr>
					<tr>
						<th>제목</th>					
						<td>						
							${vo.custTitle}
						</td>
						<th>QR 여부</th>					
						<td>						
							${vo.isQR}
						</td>
					</tr>					
					<tr>
						<th>첨부파일</th>
						<td colspan="3">		
							<c:if test="${not empty fileVO.custVoiceSeq}">
								<a href="/comm/vocFileDownload?custVoiceSeq=${fileVO.custVoiceSeq}&custVoiceType=${fileVO.custVoiceType}" class="file-name">${fileVO.fileOrgnm}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>내용</th>					
						<td colspan="3" class="edit_area">						
							${vo.contents}
						</td>
					</tr>		
					<tr>
						<th>답변자</th>
						<td>
							${replyVO.admID}
						</td>
						<th>답신유형</th>
						<td>
							<label><input type="checkbox" name="ckeckReplyType" value="M" ${replyVO.replyType eq 'M' or replyVO.replyType eq 'A' ? 'checked' : ''}/> 메일</label>
							<label><input type="checkbox" name="ckeckReplyType" value="P" ${replyVO.replyType eq 'P' or replyVO.replyType eq 'A' ? 'checked' : ''}/>전화</label>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3">
							<input type="text" name="fileName" id="fileName" value="${fileReplyVO.fileOrgnm}" readonly class="form_input" style="width:60%;" />
							<span class="btn_file" ${empty fileReplyVO.fileOrgnm ? '':'style="display:none"' }>
								<button class="btn_s1">파일올리기</button>
								<input type="file" name="uploadFile" onchange="javascript:document.getElementById('fileName').value = this.value" class="attachFile_"/>
							</span>
<!-- 							<button class="btn_s1" type="button" onclick="fileCancle(this);">취소</button> -->
						<c:if test="${not empty fileReplyVO.fileOrgnm}">
							<span>								
								<a href="/comm/vocFileDownload?custVoiceSeq=${fileReplyVO.custVoiceSeq}&custVoiceType=${fileReplyVO.custVoiceType}" class="btn_s1">다운로드</a>
								<button class="btn_s2" type="button" onclick="deleteCustVoiceFile('${fileReplyVO.filePath}${fileReplyVO.fileSavenm}','${fileReplyVO.custVoiceSeq}','${fileReplyVO.custVoiceType}',this);">삭제</button>
							</span>
						</c:if>
						</td>
					</tr>	
					<tr>
						<th>답변</th>
						<td colspan="3">
							<textarea name="replyContents" id="replyContents" rows="10" cols="100" style="width: 90%;" >${replyVO.replyContents}</textarea>
						</td>						
					</tr>					
				</tbody>
			</table>
		</div>
	</form>
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction();">수정</a>		
		<a href="/console/customer/voc" class="btn_m1">목록</a>
		<c:if test="${vo.isTolk eq 'N' and vo.isReply eq 'Y'}">
			<a href="javascript:;" class="btn_m1" onclick="submitTalkTalk(document.writeForm);">한화톡톡</a>
		</c:if>
	</div>
</div>

<script>
function submitAction(){
	var frm = document.writeForm;
	var replyType="";
	if($("input:checkbox[name='ckeckReplyType']:checked").length == 2){
		replyType="A";
	}else if($("input:checkbox[name='ckeckReplyType']:checked").length == 1){
		replyType=$("input:checkbox[name='ckeckReplyType']:checked").val();
	}else if($("input:checkbox[name='ckeckReplyType']:checked").length == 0){
		alert("답신 유형을 체크해 주세요.");		
		return;
	}
	
	if(frm.replyContents.value == ""){
		alert("답변을 입력해 주세요.");
		frm.replyContents.focus();
		return;
	}
	
	frm.replyType.value = replyType;
	frm.action="/console/customer/voc_modifyAction";
	frm.submit();
}

function chgCustVoiceIsUse(seq){
	
	var isUse = $("input[type=radio][name=isUse]:checked").val();
	
	if(!confirm("변경 하시겠습니까?")){
		return;
	}
	
	$.ajax({
		url:'/ajax/modifyCustVoiceIsUse',
		dataType:'json',
		type:'POST',
		data : 
		{
			custVoiceSeq : seq,
			isUse : isUse
		},
		success:function(result){				
			alert(result.msg);
		},
		error:function(request,status,error){
			alert("에러");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function submitTalkTalk(frm){
	if(!confirm("톡톡 하시겠습니까?")){
		return;
	}
	frm.action="/console/customer/voc_TalkTalk";
	frm.submit();
}
</script>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>