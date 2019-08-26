<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>고객의 소리 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 고객지원 &gt; <strong>고객의 소리</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_cs.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>고객의 소리</h2></div>
		<p class="txt_style1"><strong class="color_org">입주사</strong> 및 <strong class="color_org">빌딩 이용 고객님</strong>의 의견에 귀 기울이는 공간입니다.</p>
		
		<!-- 상세 -->
		<div class="table_view">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:8%;" />
					<col style="width:12%;" />
					<col />
					<col style="width:8%;" />
					<col style="width:11%;" />
					<col style="width:9%;" />
					<col style="width:8%;" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td><span class="txt_label org">${vo.isReply eq 'Y' ? '답변완료' : '답변준비중'}</span></td>
						<td class="al">${vo.custTitle}</td>
						<th scope="row">등록일</th>
						<td>${mtl:parseDateFormat('yyyy-MM-dd',vo.regDate)}</td>
						<th scope="row">조회수</th>
						<td>${vo.hitCount}</td>
					</tr>					
					<tr>
						<td colspan="7" class="con_detail">
							${vo.contents}
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="6" class="al2"><a href="/comm/vocFileDownload?custVoiceSeq=${fileVO.custVoiceSeq}&custVoiceType=${fileVO.custVoiceType}" class="link">${fileVO.fileOrgnm}</a></td>						
					</tr>
				</tbody>
			</table>
		</div>
		<!-- //상세 -->

		<c:if test="${vo.isReply eq 'Y'}">
		
		<!-- 답변내용 -->
		<div class="reply_area">
			<div class="reply_top">
				<h3>고객의 소리 답변내용</h3>
				<p class="txt">처리부서 <span>${replyVO.departmentName}</span></p>
				<p class="txt">처리자명 <span>${replyVO.admName}</span></p>
				<p class="date">${mtl:parseDateFormat('yyyy-MM-dd',replyVO.regDate)}</p>
			</div>
			<div class="reply_con">
				${replyVO.replyContents}
			</div>
			<dl class="reply_file">
				<dt>첨부파일</dt>
				<dd>
					<c:if test="${not empty fileReplyVO.fileOrgnm}">
						<a href="/comm/vocFileDownload?custVoiceSeq=${fileReplyVO.custVoiceSeq}&custVoiceType=${fileReplyVO.custVoiceType}">${fileReplyVO.fileOrgnm}</a>
					</c:if>
				</dd>
			</dl>
		</div>
		<!-- //답변내용 -->
		</c:if>
	
		<div class="btn_right">
			<a href="/cs/voc_list" class="btn_m1">목록</a>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(5, 4, 0);
	});
</script>
</body>
</html>