<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>오시는 길 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 회사소개 &gt; <strong>오시는 길</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_about.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>오시는 길</h2></div>
		<div class="tabmenu" id="tabmenu">
			<ul>
				<li class="on"><a href="#tab_con1">무료셔틀버스</a></li>
				<li><a href="#tab_con2">대중교통</a></li>
				<li><a href="#tab_con3">주차안내</a></li>
			</ul>
		</div>

		<!-- 무료셔틀버스 -->
		<div class="tab_con" id="tab_con1">
			<div class="ac"><img src="/resources/img/location_map.jpg" alt="무료셔틀버스 탑승 지도" /></div>
			<div class="table_info mt30">
				<table>
					<caption>무료셔틀버스 이용안내: 구분에 따라 역 이름과 타는 곳을 제공하는 표입니다.</caption>
					<colgroup>
						<col style="width:18%;" />
						<col style="width:15%;" />
						<col style="width:67%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">구분</th>
							<th scope="col">역 이름</th>
							<th scope="col">타는 곳</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">63빌딩</th>
							<td>63빌딩</td>
							<td class="al">동편로비 탑승</td>
						</tr>
						<tr>
							<th scope="row">1호선</th>
							<td>대방역</td>
							<td class="al">6번 출구여의도 방향 40m 지점</td>
						</tr>
						<tr>
							<th scope="row" rowspan="2">5호선</th>
							<td>여의나루역</td>
							<td class="al">4번 출구 MBC 방향 삼부아파트 6동 옆</td>
						</tr>
						<tr>
							<td class="has_bl">여의도역</td>
							<td class="al">5번 출구 MBC 방송국 방향 약 20m 지점 임시승차장</td>
						</tr>
						<tr>
							<th scope="row">9호선</th>
							<td>샛강역</td>
							<td class="al">1번 출구 여의도역 방향으로 약 10m 지점</td>
						</tr>
					</tbody>
				</table>
			</div>
			<ul class="txt_note v2">
				<li>평일, 토요일 : 11:30 ~ 17:30 / 21:00 ~ 23:00 여의도[5호선 여의도역 경유] 지역 순환</li>
				<li class="mt3">공휴일 : 09:00 ~ 23:00 여의도[5호선 여의도역 경유]지역 순환</li>
			</ul>
			<p class="color_brown mt3"><strong>* 셔틀버스 운행시간은 교통 사정으로 인하여 다소 지연될 수 있습니다.</strong></p>
		</div>
		<!-- //무료셔틀버스 -->

		<!-- 대중교통 -->
		<div class="tab_con" id="tab_con2">
			<h3 class="tit_black">지하철</h3>
			<div class="subway_box">
				<div class="img_area"><img src="/resources/img/subway_map.jpg" alt="지하철 1호선 대방역, 5호선 여의나루역, 5호선 여의도역, 9호선 샛강역 노선도" /></div>
				<ul class="txt_area">
					<li class="line_1">
						<h4>1호선 대방역</h4>
						<p>6번출구 여의도 방향 40M 지점 무료셔틀버스 이용<br />6번출구 앞 시내버스 62번 이용</p>
					</li>
					<li>
						<h4>5호선 여의나루역</h4>
						<p>4번출구 MBC방향 80M 지점 무료셔틀버스 이용<br />1번출구 앞 시내버스 5534번, 5633번, 261번, 8360번, 7611번 이용</p>
					</li>
					<li>
						<h4>5호선 여의도역</h4>
						<p>5번출구 성모병원 버스 승차장 앞 무료셔틀버스 이용<br />5번출구 앞 시내버스 62번 이용</p>
					</li>
					<li class="line_9">
						<h4>9호선 샛강역</h4>
						<p>샛강역 1번 출구 여의도역 방향으로 약 10M 지점 <br />버스 승차장 앞 무료셔틀버스 이용</p>
					</li>
				</ul>
			</div>

			<h3 class="tit_black">버스</h3>
			<div class="table_info">
				<table>
					<caption>버스 이용안내: 버스번호, 기점, 종점 및 주요경유지를 제공하는 표입니다.</caption>
					<colgroup>
						<col style="width:18%;" />
						<col style="width:20%;" />
						<col style="width:21%;" />
						<col style="width:20%;" />
						<col style="width:21%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">버스번호</th>
							<th scope="col" colspan="4">기점 &amp; 종점 및 주요경유지</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" rowspan="2" class="color_blue">간선버스<br />362번</th>
							<td class="bg_title">기점</td>
							<td>송파차고지</td>
							<td class="bg_title">종점</td>
							<td>여의도</td>
						</tr>
						<tr>
							<td colspan="4" class="td_bus">북정동외국인학교 – 북정역 – 문정1동사무소 – 잠실역롯데월드 – 잠실종합운동장 – 영동교 – 신사중학교 – 고속터미널 – 반포본동 – 여의동사무소 – 63빌딩 – 여의도역</td>
						</tr>
						<tr>
							<th scope="row" rowspan="2" class="color_blue">간선버스<br />261번</th>
							<td class="bg_title">기점</td>
							<td>장위동</td>
							<td class="bg_title">종점</td>
							<td>여의도</td>
						</tr>
						<tr>
							<td colspan="4" class="td_bus">석계역 – 월계 현대아파트 – 성복역 – 광운대학교 – 석관시장 – 한국예술종합학교 – 이문동 우체국 – 경희 중고 – 제기역 – 신설동역 – 동대문 – 롯데백화점 – 공덕시장 – 여의나루역 – 63빌딩 앞 – 은하아파트</td>
						</tr>
						<tr>
							<th scope="row" rowspan="2" class="color_green">지선버스<br />5633번</th>
							<td class="bg_title">기점</td>
							<td>노은사도</td>
							<td class="bg_title">종점</td>
							<td>순복음교회</td>
						</tr>
						<tr>
							<td colspan="4" class="td_bus">광명역 – 충현고교입구 – 석면초교 – 서울차량앞 – 장미예식장 – 시흥사거리 – 시흥동 법원단지 앞 – 구로디지털단지 – 대림시장 – 보라매역 – 앙카라 공원 – KBS별관 – 여의도 동사무소 – 63빌딩 – 여의도 중학교</td>
						</tr>
						<tr>
							<th scope="row" rowspan="2" class="color_green">지선버스<br />7611번</th>
							<td class="bg_title">기점</td>
							<td>홍은동</td>
							<td class="bg_title">종점</td>
							<td>여의도</td>
						</tr>
						<tr>
							<td colspan="4" class="td_bus">명지대삼거리 – 남가좌역 – 연남동 – 신촌전철역 – 이대역 – 굴레방다리 – 마포역 – 여의나루역 – MBC – 여의동사무소 – 63빌딩</td>
						</tr>
						<tr>
							<th scope="row" rowspan="2" class="color_green">지선버스<br />5534번</th>
							<td class="bg_title">기점</td>
							<td>하얀동</td>
							<td class="bg_title">종점</td>
							<td>여의도</td>
						</tr>
						<tr>
							<td colspan="4" class="al has_bl">광명우체국 – 독산역 – 구로디지탈단지역 – 강남중학교 – 공군회관 – 대방역 – 여의동사무소 – 63빌딩</td>
						</tr>
						<tr>
							<th scope="row" rowspan="2" class="color_yellow">순환버스<br />62번</th>
							<td class="bg_title">기점</td>
							<td>대방역</td>
							<td class="bg_title">종점</td>
							<td>대방역</td>
						</tr>
						<tr>
							<td colspan="4" class="td_bus">대방역 – 여의도역 – 여의나루역 – 63빌딩 – KBS별관 - 대방역</td>
						</tr>
						<tr>
							<th scope="row" rowspan="2" class="color_red">광역버스<br />9409번</th>
							<td class="bg_title">기점</td>
							<td>용인죽전</td>
							<td class="bg_title">종점</td>
							<td>대방역</td>
						</tr>
						<tr>
							<td colspan="4" class="td_bus">무지개마을 – 효자촌 – 한신아파트 – 강남역 – 63빌딩 – 국회의사당 - MBC</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- //대중교통 -->

		<!-- 주차안내 -->
		<div class="tab_con" id="tab_con3">
			<div class="parking_box">
				<h3>무료주차 안내</h3>
				<p>기본 1시간 무료주차를 드립니다.</p>
				<p>다른 시설 이용시 무료주차 혜택은 최장 4시간 까지 입니다.</p>
				<h3>이용시설 별 무료주차 적용시간</h3>
				<p>63빌딩 주차장 만차시에는 한간 둔치 주차장을 이용하실 수 있습니다.</p>
				<p>관람시설, 식당가 이용고객 승용차량 대상 최장 3시간 무료주차 혜택 적용</p>
				<p>63빌딩 → 한강둔치 무료셔틀이 운행되고 있습니다.</p>
				<h3>한강둔치 주차장 안내</h3>
				<p class="color_brown">63빌딩 내 주차장이 만차되었을 경우, 한강둔치주차장을 이용해 주시기 바랍니다.</p>
			</div>
		</div>
		<!-- //주차안내 -->
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(1, 6, 0);
        MYAPP.Tab.init("#tabmenu");
	});
</script>
</body>
</html>