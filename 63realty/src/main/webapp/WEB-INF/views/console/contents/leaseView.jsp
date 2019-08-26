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
		<li>PDF 파일만 업로드 할 수 있습니다.</li>
	</ul>
	
	<form name="writeForm" method="post" enctype="multipart/form-data">		
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
						<th>첨부파일</th>
						<td colspan="3">
							<input type="text" name="fileName" id="fileName" value="${vo.fileOrgnm}" readonly class="form_input" style="width:60%;" />
							<span class="btn_file" ${empty vo.fileOrgnm ? '':'style="display:none"' }>
								<button class="btn_s1">파일올리기</button>
								<input type="file" name="uploadFile" onchange="javascript:document.getElementById('fileName').value = this.value" class="attachFile_" data-file-type="pdf" />
<!-- 								<button class="btn_s1" type="button" onclick="fileCancle(this);">취소</button> -->
							</span>
						<c:if test="${not empty vo.fileOrgnm}">
							<span>								
								<a href="/comm/oneFileDownload?boardID=${vo.boardID}" class="btn_s1">다운로드</a>
								<button class="btn_s2" type="button" onclick="deleteOneFile('${vo.filePath}${vo.fileSavenm}','${vo.boardID}','${vo.fileFormName}',this);">삭제</button>
							</span>
						</c:if>
						</td>

					</tr>
					
					<tr>
						<td colspan="4" id="tdText">
						<c:choose>
							<c:when test="${not empty vo.fileOrgnm }">
								등록일 / ${empty vo.updateDate?vo.regDate:vo.updateDate }&nbsp;&nbsp;&nbsp;&nbsp;
								이름 / ${empty vo.updateName?vo.regName:vo.updateName }&nbsp;&nbsp;&nbsp;&nbsp;
								파일명 / ${vo.fileOrgnm}
							</c:when>
							<c:otherwise>
								업로드 된 첨부파일이 없습니다.	
							</c:otherwise>
						</c:choose>
						
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction();">등록</a>		
	</div>
</div>
<!-- //contents -->

<script>

function submitAction(){
	
	var frm = document.writeForm;
	
	var msg = checkFile();
	
	if(msg != ""){
		alert(msg);
		return false;
	}
	
	frm.action="/console/contents/lease_modifyAction";
	frm.submit();
}


</script>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>