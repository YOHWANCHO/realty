<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>결산공고 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 홍보센터 &gt; <strong>결산공고</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>결산공고</h2></div>
		
		<!-- 연도선택 -->
		<form name="searchForm">
			<div class="search_box">				
				<label for="yearChoose"><strong class="txt">연도선택</strong></label>
				<select id="yearChoose" class="form_select" name="blYear" style="width:70px;">
					<c:if test="${empty vo}">
						<option value="">선택</option>
					</c:if>
					<c:forEach var="commbo" items="${commboYear}">
						<option value="${commbo.blYear}" ${commbo.blYear eq searchVO.blYear? 'selected' : ''}>${commbo.blYear}</option>
					</c:forEach>
				</select>
				<button class="btn_search">검색</button>
			</div>
		</form>
		<!-- //연도선택 -->

		<!-- 재무상태표 -->
		<div class="settlement_line">
			<div class="settlement_box">
				<h3>재무상태표</h3>
				<p class="txt1">${vo.blTitle}</p>
				<p class="unit_txt">(단위:원)</p>
				<div class="table_info settlement_tbl">
					<table>
						<caption>재무상태표</caption>
						<colgroup>
							<col style="width:29%;" />
							<col style="width:21%;" />
							<col style="width:29%;" />
							<col style="width:21%;" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">계정과목</th>
								<th scope="col">금액</th>
								<th scope="col">계정과목</th>
								<th scope="col">금액</th>
							</tr>
							<tr>
								<th scope="col" colspan="2" class="bl_none">자산</th>
								<th scope="col" colspan="2">부채</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td>자산총계</td>
								<td class="ar">${vo.assTot}</td>
								<td>부채 및 자본총계</td>
								<td class="ar">${vo.capLiaTot}</td>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td class="al">Ⅰ. 유동자산</td>
								<td class="ar">${vo.a1m0}</td>
								<td class="al">Ⅰ. 유동부채</td>
								<td class="ar">${vo.l1m0}</td>
							</tr>
							<tr>
								<td>${vo.a1c1}</td>
								<td class="ar">${vo.a1m1}</td>
								<td>${vo.l1c1}</td>
								<td class="ar">${vo.l1m1}</td>
							</tr>
							<tr>
								<td>${vo.a1c2}</td>
								<td class="ar">${vo.a1m2}</td>
								<td>${vo.l1c2}</td>
								<td class="ar">${vo.l1m2}</td>
							</tr>
							<tr>
								<td>${vo.a1c3}</td>
								<td class="ar">${vo.a1m3}</td>
								<td>${vo.l1c3}</td>
								<td class="ar">${vo.l1m3}</td>
							</tr>
							<tr>
								<td>${vo.a1c4}</td>
								<td class="ar">${vo.a1m4}</td>
								<td>${vo.l1c4}</td>
								<td class="ar">${vo.l1m4}</td>
							</tr>
							<tr>
								<td>${vo.a1c5}</td>
								<td class="ar">${vo.a1m5}</td>
								<td>${vo.l1c5}</td>
								<td class="ar">${vo.l1m5}</td>
							</tr>
							<tr>
								<td>${vo.a1c6}</td>
								<td class="ar">${vo.a1m6}</td>
								<td class="al">Ⅱ. 비유동부채</td>
								<td class="ar">${vo.l2m0}</td>
							</tr>
							<tr>
								<td>${vo.a1c7}</td>
								<td class="ar">${vo.a1m7}</td>
								<td>${vo.l2c1}</td>
								<td class="ar">${vo.l2m1}</td>
							</tr>
							<tr>
								<td class="al">Ⅱ. 비유동자산</td>
								<td class="ar">${vo.a2m0}</td>
								<td>${vo.l2c2}</td>
								<td class="ar">${vo.l2m2}</td>
							</tr>
							<tr>
								<td>${vo.a2c1}</td>
								<td class="ar">${vo.a2m1}</td>
								<td>${vo.l2c3}</td>
								<td class="ar">${vo.l2m3}</td>
							</tr>
							<tr>
								<td>${vo.a2c2}</td>
								<td class="ar">${vo.a2m2}</td>
								<td>${vo.l2c4}</td>
								<td class="ar">${vo.l2m4}</td>
							</tr>
							<tr>
								<td>${vo.a2c3}</td>
								<td class="ar">${vo.a2m3}</td>
								<td class="bg_total">부채총계</td>
								<td class="ar bg_total">${vo.liaTot}</td>
							</tr>
							<tr>
								<td>${vo.a2c4}</td>
								<td class="ar">${vo.a2m4}</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>${vo.a2c5}</td>
								<td class="ar">${vo.a2m5}</td>
								<td colspan="2" class="bg_title">자본</td>
							</tr>
							<tr>
								<td>${vo.a2c6}</td>
								<td class="ar">${vo.a2m6}</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>${vo.a2c7}</td>
								<td class="ar">${vo.a2m7}</td>
								<td class="al">Ⅰ. 자본금</td>
								<td class="ar">${vo.c1m0}</td>
							</tr>
							<tr>
								<td>${vo.a2c8}</td>
								<td class="ar">${vo.a2m8}</td>
								<td class="al">Ⅱ. 기타자본구성요소</td>
								<td class="ar">${vo.c1m1}</td>
							</tr>
							<tr>
								<td>${vo.a2c9}</td>
								<td class="ar">${vo.a2m9}</td>
								<td class="al">Ⅲ. 이익잉여금</td>
								<td class="ar">${vo.c1m2}</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td>${vo.c1c1}</td>
								<td class="ar">${vo.c1m3}</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td class="bg_total">자본총계</td>
								<td class="ar bg_total">${vo.capTot}</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="date">${vo.commentDate}</p>
				<h4>㈜한화63시티</h4>
				<p class="name">대표이사 <span>김광성</span></p>
				<p class="txt2">${vo.blDesc}</p>
			</div>
		</div>
		<!-- //재무상태표 -->
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 7, 0);
	});
</script>
</body>
</html>