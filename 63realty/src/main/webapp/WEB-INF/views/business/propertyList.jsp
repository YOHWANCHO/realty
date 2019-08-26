<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>관리자산 현황 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 사업영역 &gt; 자산관리 &gt; <strong>관리자산 현황</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_business.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>관리자산 현황</h2></div>
		<h3 class="tit_h3" style="margin-bottom:13px;">빌딩 검색 서비스</h3>
		<p class="txt_style1">관리중인 사업실적에 대한 정보를 자세히 알려드립니다.</p>
		<div class="property_box">
			<!-- 지도 영역 -->
			<div class="map_area">
				<ul class="property_map">
					<li class="map_se"><a href="/business/property_list?bldZone=10" class="${searchVO.bldZone eq '10' ? 'on' : ''}">서울</a></li>
					<li class="map_gg"><a href="/business/property_list?bldZone=11" class="${searchVO.bldZone eq '11' ? 'on' : ''}">경기</a></li>
					<li class="map_ic"><a href="/business/property_list?bldZone=12" class="${searchVO.bldZone eq '12' ? 'on' : ''}">인천</a></li>
					<li class="map_dj"><a href="/business/property_list?bldZone=13" class="${searchVO.bldZone eq '13' ? 'on' : ''}">대전</a></li>
					<li class="map_cn"><a href="/business/property_list?bldZone=14" class="${searchVO.bldZone eq '14' ? 'on' : ''}">충남</a></li>
					<li class="map_cb"><a href="/business/property_list?bldZone=15" class="${searchVO.bldZone eq '15' ? 'on' : ''}">충북</a></li>
					<li class="map_bs"><a href="/business/property_list?bldZone=16" class="${searchVO.bldZone eq '16' ? 'on' : ''}">부산</a></li>
					<li class="map_dg"><a href="/business/property_list?bldZone=17" class="${searchVO.bldZone eq '17' ? 'on' : ''}">대구</a></li>
					<li class="map_us"><a href="/business/property_list?bldZone=18" class="${searchVO.bldZone eq '18' ? 'on' : ''}">울산</a></li>
					<li class="map_gn"><a href="/business/property_list?bldZone=19" class="${searchVO.bldZone eq '19' ? 'on' : ''}">경남</a></li>
					<li class="map_gb"><a href="/business/property_list?bldZone=20" class="${searchVO.bldZone eq '20' ? 'on' : ''}">경북</a></li>
					<li class="map_jb"><a href="/business/property_list?bldZone=21" class="${searchVO.bldZone eq '21' ? 'on' : ''}">전북</a></li>
					<li class="map_jn"><a href="/business/property_list?bldZone=22" class="${searchVO.bldZone eq '22' ? 'on' : ''}">전남</a></li>
					<li class="map_gj"><a href="/business/property_list?bldZone=23" class="${searchVO.bldZone eq '23' ? 'on' : ''}">광주</a></li>
					<li class="map_gw"><a href="/business/property_list?bldZone=24" class="${searchVO.bldZone eq '24' ? 'on' : ''}">강원</a></li>
					<li class="map_jj"><a href="/business/property_list?bldZone=25" class="${searchVO.bldZone eq '25' ? 'on' : ''}">제주</a></li>
				</ul>
			</div>
			<!-- //지도 영역 -->
			<div class="list_area">
				<form name="searchForm" method="GET" >
					<input type="hidden" name="pageIndex" value="0">
					<div class="search_box">
						<select class="form_select" id="bldZone" name="bldZone">
								<option value="">전국</option>
								<c:forEach var="vo" items="${combo}" varStatus="status">
									<option value="${vo.bldCodeSeq}" ${searchVO.bldZone eq vo.bldCodeSeq?'selected':''}>${vo.codeName}</option>
								</c:forEach>
							</select>
						<input type="text" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요." class="form_input" style="width:260px;" name="searchText" value="${searchVO.searchText}"/>
						<button class="btn_search">검색</button>
					</div>
				</form>
				<p class="search_txt">* 총 <strong class="color_org">${searchVO.totalCount}</strong>개 실적 검색 완료</p>
				
				<!-- 리스트 -->
				<div class="property_list">
					<ul class="list">
						<c:if test="${empty list}">
							<li class="no_data">NO DATA</li>
						</c:if>
						<c:forEach var="vo" items="${list}" varStatus="status">
							<li>
								<a href="/business/property_view/${vo.bldInfoSeq}">
									<span class="img">
										<c:if test="${not empty vo.fileSavenm}">
											<img src="${viewPath}${vo.filePath}${vo.fileSavenm}" alt=""/>
										</c:if>
									</span> 
									<span class="txt">${vo.bldName}</span>
								</a>
							</li>
						</c:forEach>
					</ul>

					<!-- paging -->
					<div class="paging">
						<a href="javascript:onPaging( document.searchForm, ${searchVO.firstPageIndex})" class="page_arrow first"><span class="hidden">첫 페이지로 이동</span></a>
						<a href="javascript:onPaging( document.searchForm, ${searchVO.prevPageIndex})" class="page_arrow prev"><span class="hidden">이전 페이지로 이동</span></a>
						
						
						<c:forEach var="i" begin="${searchVO.startPageIndex}" end="${searchVO.endPageIndex}" step="1">
							<c:choose>
								<c:when test="${i eq searchVO.pageIndex }">
									<a href="javascript:onPaging( document.searchForm, ${i})" class="current" title="현재페이지">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:onPaging(document.searchForm, ${i})"> ${i} </a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<a href="javascript:onPaging( document.searchForm, ${searchVO.nextPageIndex})" class="page_arrow next"><span class="hidden">다음 페이지로 이동</span></a>
						<a href="javascript:onPaging( document.searchForm, ${searchVO.finalPageIndex})" class="page_arrow last"><span class="hidden">마지막 페이지로 이동</span></a>
					</div>
					<!-- //paging -->
				</div>
				<!-- //리스트 -->
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(2, 1, 2);
		mapClick();
	});

	//지도 클릭시 아이콘 활성화
	function mapClick(){
		var $mapArea = $(".contents .property_map");
		$mapArea.find("a").on("click", function(){
			if(!$(this).is(".on")){
				$mapArea.find("a").removeClass("on");
				$(this).addClass("on");
			}
		});
	}
</script>
</body>
</html>