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
		<div class="tabmenu" id="tabmenu">
			<ul>
				<li class="on"><a href="#tab_con1">빌딩개요</a></li>
				<li><a href="#tab_con2">위치정보</a></li>
			</ul>
		</div>

		<!-- 빌딩개요 -->
		<div class="tab_con" id="tab_con1">
			<div class="property_view">
				<div class="img_area">
					<c:if test="${not empty fileVO.fileSavenm}">
						<img src="${viewPath}${fileVO.filePath}${fileVO.fileSavenm}" alt="${fileVO.fileOrgnm}" />
					</c:if>
				</div>
				<div class="txt_area">
					<div class="property_tbl">
						<table>
							<caption></caption>
							<colgroup>
								<col style="width:58px;" />
								<col style="width:100px;" />
								<col style="width:105px;" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">건물명</th>
									<td colspan="3">${vo.bldName}</td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td colspan="3">${vo.bldAddr}</td>
								</tr>
								<tr>
									<th scope="row">담당자</th>
									<td colspan="3">${vo.bldManager} / ${vo.arrBldTelnum[0]}-${vo.arrBldTelnum[1]}-${vo.arrBldTelnum[2]} </td>
								</tr>
								<tr>
									<th scope="row">빌딩규모</th>
									<td>${vo.bldScale}</td>
									<th scope="row">주차대수</th>
									<td>${vo.bldParking}대</td>
								</tr>
								<tr>
									<th scope="row">연면적</th>
									<td>${vo.bldArea}㎡</td>
									<th scope="row">전용률</th>
									<td>${vo.bldRate}%</td>
								</tr>
								<tr>
									<th scope="row">준공일</th>
									<td>${vo.bldCompletion}</td>
									<th scope="row">높이</th>
									<td>${vo.bldCeiling}m</td>
								</tr>
								<!-- 
								<tr>
									<th scope="row">E/V</th>
									<td>${vo.bldEv}대</td>
									<th scope="row">기준층(전용/임대)</th>
									<td>${vo.bldTypicalFloor}㎡</td>
								</tr>
								<tr>
									<th scope="row">주차조건</th>
									<td colspan="3">${vo.bldParkInfo}</td>
								</tr>
								 -->
								<tr>
									<th scope="row">특장점</th>
									<td colspan="3" class="td_height">${vo.bldContents}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- //빌딩개요 -->

		<!-- 위치정보 -->
		<div class="tab_con map_con" id="tab_con2">
			<div id="location_map" class="location_map"></div>
		</div>
		<!-- //위치정보 -->

		<div class="btn_right">
			<a href="/business/property_list" class="btn_m1">목록</a>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9aaa2afcefebe6380b2c243783d214ee"></script>
<script src="/resources/js/location_api.js"></script>
<script>
	$(function(){
		MYAPP.Menu.init(2, 1, 2);
        MYAPP.Tab.init("#tabmenu");
        
		//지도
		var mapData = {
			mapContainer : 'location_map', 
			latLng : {x:${empty vo.bldLocaleX ? '0' : vo.bldLocaleX}, y:${empty vo.bldLocaleY ? '0' : vo.bldLocaleY}}
		};
		locationAPI.add( mapData.mapContainer, mapData.latLng);
		$(".map_con").removeClass("map_con");
	});
</script>
</body>
</html>