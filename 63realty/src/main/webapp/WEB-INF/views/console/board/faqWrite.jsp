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
		<input type="hidden" name="boardID" value="${boardID}">
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
						<th>제목<span class="required_txt">필수입력 사항</span></th>
						<td colspan="3">
							<input type="text" class="form_input" name="title" style="width:96%;"/>
						</td>
					</tr>
					<tr>
						<th>카테고리<span class="required_txt">필수입력 사항</span></th>
						<td colspan="3">	
							<select class="form_select" name="codeSeq">			
								<option value="">전체</option>
								<c:forEach var="comm" items="${commList}" varStatus="status">
									<option value="${comm.codeSeq}">${comm.codeName}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
					<th>노출여부 </th>
					<td colspan="3">
						<label><input type="radio" name="isUse" class="form_chk" value="Y" checked/>활성</label>
						<label class="ml10"><input type="radio" name="isUse" class="form_chk" value="N"/>비활성</label>
					</td>
				</tr>		
					<tr>
						
						<td colspan="4" class="edit_area">
							<textarea name="contents" id="contents" rows="10" cols="100" style="width: 100%;" ></textarea>
						</td>
					</tr>					
				</tbody>
			</table>
		</div>
	</form>
	<div class="btn_right">
		<a href="javascript:;" class="btn_m1" onclick="submitAction();">등록</a>		
		<a href="/console/board/faq" class="btn_m1">목록</a>
	</div>
</div>
<!-- //contents -->

<script>
var obj = [];
$(function(){
	
  	nhn.husky.EZCreator.createInIFrame({
  	    oAppRef: obj,
  	    elPlaceHolder: "contents",
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
	
	if(frm.title.value == ""){
		alert("제목을 입력해 주세요.");
		frm.title.focus();
		return;
	}
	
	if(frm.codeSeq.value == "0"){
		alert("카테고리를 입력해 주세요.");
		frm.codeSeq.focus();
		return;
	}
	
	obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
	
	frm.action="/console/board/faq_writeAction";
	frm.submit();
}


</script>
<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>