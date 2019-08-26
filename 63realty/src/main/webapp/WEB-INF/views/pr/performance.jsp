<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>에너지/온실가스 배출실적 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 홍보센터 &gt; 환경안전보건경영 &gt; <strong>에너지/온실가스 배출실적</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>에너지/온실가스 배출실적</h2></div>
		<p class="txt_style1">지속가능한 발전과 사회적 책임을 완수하기 위해 세계수준의 환경안전 시스템을 구축하여 환경안전보호정책을 추진하고 있습니다.</p>
		<!-- 연도선택 -->
		<form name="searchForm">
			<div class="search_box" style="margin-bottom:18px;">
				<label for="yearChoose"><strong class="txt">연도선택</strong></label>
				<select id="yearChoose" class="form_select" name="grYear">
					<c:if test="${empty list}">
						<option value="">선택</option>
					</c:if>
					<c:forEach var="commbo" items="${commboYear}">
						<option value="${commbo.grYear}" ${commbo.grYear eq searchVO.grYear? 'selected' : ''}>${commbo.grYear}</option>
					</c:forEach>
				</select>
				<button class="btn_search">검색</button>
			</div>
		</form>
		<!-- //연도선택 -->

		<h3 class="pr_tit">${list[0].grYear}년도</h3>
		<div class="table_info performance_tbl">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:20%;" />
					<col style="width:16%;" />
					<col style="width:16%;" />
					<col style="width:16%;" />
					<col style="width:16%;" />
					<col style="width:16%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" rowspan="2">구분</th>
						<th scope="col" rowspan="2">사업장</th>
						<th scope="colgroup" colspan="4">${list[0].grYear}</th>
					</tr>
					<tr>
						<th scope="col">1/4분기</th>
						<th scope="col">2/4분기</th>
						<th scope="col">3/4분기</th>
						<th scope="col">4/4분기</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="tcoFlag" value="T"/>
				<c:set var="toeFlag" value="T"/>
				<c:forEach var="vo" items="${list}" varStatus="status">
					<c:choose>
						<c:when test="${vo.grFlag eq '100'}">
							<c:choose>
								<c:when test="${tcoFlag eq 'T'}">
									<tr>	
										<th scope="row" rowspan="${colTco}">온실가스<br />배충량<br />(단위 : T-CO2)</th>
										<td>${empty vo.colPlace?'-':vo.colPlace}</td>
										<td class="ar">${empty vo.firstQ?'-':vo.firstQ}</td>
										<td class="ar">${empty vo.secondQ?'-':vo.secondQ}</td>
										<td class="ar">${empty vo.thirdQ?'-':vo.thirdQ}</td>
										<td class="ar">${empty vo.fourthQ?'-':vo.fourthQ}</td>
									</tr>
									<c:set var="tcoFlag" value="F"/>
								</c:when>
								<c:when test="${vo.colPlace eq 'tot'}">
										<tr class="tr_total">
											<td>소계</td>						
											<td class="ar">${empty vo.firstQ?'-':vo.firstQ}</td>
											<td class="ar">${empty vo.secondQ?'-':vo.secondQ}</td>
											<td class="ar">${empty vo.thirdQ?'-':vo.thirdQ}</td>
											<td class="ar">${empty vo.fourthQ?'-':vo.fourthQ}</td>
										</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td>${empty vo.colPlace?'-':vo.colPlace}</td>
										<td class="ar">${empty vo.firstQ?'-':vo.firstQ}</td>
										<td class="ar">${empty vo.secondQ?'-':vo.secondQ}</td>
										<td class="ar">${empty vo.thirdQ?'-':vo.thirdQ}</td>
										<td class="ar">${empty vo.fourthQ?'-':vo.fourthQ}</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:when>
						
						<c:when test="${vo.grFlag eq '200'}">
								<c:choose>
									<c:when test="${toeFlag eq 'T'}">
										<tr>	
											<th scope="row" rowspan="${colToe}">에너지<br />사용량<br />(단위 : TOE)</th>
											<td>${empty vo.colPlace?'-':vo.colPlace}</td>
											<td class="ar">${empty vo.firstQ?'-':vo.firstQ}</td>
											<td class="ar">${empty vo.secondQ?'-':vo.secondQ}</td>
											<td class="ar">${empty vo.thirdQ?'-':vo.thirdQ}</td>
											<td class="ar">${empty vo.fourthQ?'-':vo.fourthQ}</td>
										</tr>
										<c:set var="toeFlag" value="F"/>
									</c:when>
									<c:when test="${vo.colPlace eq 'tot'}">
											<tr class="tr_total">
												<td>소계</td>						
												<td class="ar">${empty vo.firstQ?'-':vo.firstQ}</td>
												<td class="ar">${empty vo.secondQ?'-':vo.secondQ}</td>
												<td class="ar">${empty vo.thirdQ?'-':vo.thirdQ}</td>
												<td class="ar">${empty vo.fourthQ?'-':vo.fourthQ}</td>
											</tr>
										
									</c:when>
									<c:otherwise>
										<tr>
											<td>${empty vo.colPlace?'-':vo.colPlace}</td>
											<td class="ar">${empty vo.firstQ?'-':vo.firstQ}</td>
											<td class="ar">${empty vo.secondQ?'-':vo.secondQ}</td>
											<td class="ar">${empty vo.thirdQ?'-':vo.thirdQ}</td>
											<td class="ar">${empty vo.fourthQ?'-':vo.fourthQ}</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<p class="pr_txt">${list[0].grDesc}</p>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 5, 3);
	});
</script>
</body>
</html>