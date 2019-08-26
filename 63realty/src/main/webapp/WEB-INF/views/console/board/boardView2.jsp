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
	
		<input type="hidden" name="mainBoardSeq" value="${vo.mainBoardSeq}">
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
						<th>제목</th>
						<td colspan="3">
							${vo.title}
						</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td colspan="3">
							${mtl:parseDateFormat('yyyy-MM-dd',vo.showDate)}
						</td>
					</tr>
					
					<tr>
						<th>썸네일</th>
						<td colspan="3">
						<c:if test="${not empty fileVO.fileOrgnm}">
							<img src="${viewPath}${fileVO.filePath}${fileVO.fileSavenm}" alt="${fileVO.fileOrgnm}" style="width: 100px"/>
							<span>								
								<a href="/comm/mainBoardFileDownload?mainBoardFileSeq=${fileVO.mainBoardFileSeq}" class="btn_s1">다운로드</a>								
							</span>
						</c:if>
						</td>
					</tr>
					<tr>
					<th>노출여부 </th>
					<td colspan="3">
						${vo.isUse eq 'Y'?"활성" : "비활성"}
					</td>
				</tr>		
					<tr>
						
						<td colspan="4" class="edit_area">							
							${vo.contents}
						</td>
					</tr>					
				</tbody>
			</table>
		</div>
	
	<div class="btn_right">
		<a href="${fn:replace(reqUri,'_view','_modify')}" class="btn_m1">수정</a>		
		<a href="javascript:;" class="btn_m1" onclick="deleteMainBoardText('${vo.mainBoardSeq}','${reqUri}');">삭제</a>
		<a href="javascript:;" class="btn_m1" onclick="goList('${reqUri}')">목록</a>
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
						<th>다음글</th>
						<td colspan="3">
							<c:choose>
								<c:when test="${empty preNext.nextTitle}">
									다음글이 없습니다.
								</c:when>
								<c:otherwise>
									<a href="javascript:;" onclick="goBoardNextPre('${reqUri}','${preNext.nextMainBoardSeq}');">${preNext.nextTitle}</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>이전글</th>
						<td colspan="3">
							<c:choose>
								<c:when test="${empty preNext.preTitle}">
									이전글이 없습니다.
								</c:when>
								<c:otherwise>
									<a href="javascript:;" onclick="goBoardNextPre('${reqUri}','${preNext.preMainBoardSeq}');">${preNext.preTitle}</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>			
				</tbody>
			</table>
		</div>
	
	
	
</div>
<!-- //contents -->
<form name="searchForm">
	<input type="hidden" name="searchType" value="${searchVO.searchType}" />
	<input type="hidden" name="searchText" value="${searchVO.searchText}" />
	<input type="hidden" name="searchFromDate" value="${searchVO.searchFromDate}" />
	<input type="hidden" name="searchToDate" value="${searchVO.searchToDate}" />
</form>
<script>
function goBoardNextPre(url,seq){
	var indexUrl = url.lastIndexOf("/");				
	url = url.substring(0,indexUrl);
	goBoardView(url+"/"+seq);
}
</script>

<%@ include file="/WEB-INF/views/console/inc/inc_gl_bottom.jsp"%>