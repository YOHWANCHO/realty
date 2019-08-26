<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>사회공헌 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 홍보센터 &gt; <strong>사회공헌</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>사회공헌</h2></div>
		<div class="social_img">
			<div class="hidden">
				<h3>Social Contribution 사회공헌 스토리</h3>
				<p>2004년부터 본격적인 사회공헌활동을 시작한 한화63시티는 그 동안 당사의 비즈니스 특색을 살린 안전한 집 가꾸기, 친환경 목공수업 등 이색적인 사회공헌활동을 진행 하였으며 ‘함께 멀리’ 라는 한화정신을 바탕으로 함께 성장하는 사회적 기업 역할에 앞장 서 왔다.</p>
			</div>
		</div>
		<div class="social_intro">
			<h3>역대 활동</h3>
			<div class="line">
				<h4>나눔 바자회 캠페인</h4>
				<p>한화63시티는 회사 내 바자회를 주최하여 모금된 수익금을 사회에 환원하여 사회헌신을 실천하였다.</p>
			</div>
			<div class="line">
				<h4>글로벌 인재 육성</h4>
				<p>외국학생을 초청해 대한민국의 랜드마크 63빌딩 견학 후원 및 지원하여 글로벌 리더 육성 프로그램을 진행하였다.</p>
			</div>
			<div class="line">
				<h4>함께하는 63시티</h4>
				<p>한화63시티 본사를 포함한 지역별 사옥은 매주 사회공헌 활동을 통해 지역사회 발전에 큰 일조를 하고 있다.</p>
			</div>

			<h3>특화프로그램</h3>
			<div class="line">
				<h4>안전한 집 가꾸기</h4>
				<p>한화63시티가 위치한 영등포구, 마포구내 독거노인 및 소년소녀가장 가정에 정기적으로 임직원 봉사자들이 방문하여<br /> 가정 내 주거환경 개선(전기, 벽지, 장판)을 실시하고 위험시설에 대한 교체 및 보수 작업을 실시하고 있다.</p>
				<div class="img"><img src="/resources/img/social_img02.jpg" alt="" /></div>
			</div>
			<div class="line">
				<h4>친환경 목공수업</h4>
				<p>한화63시티는 영등포구에 위치한 초등학교 학생들을 대상으로 재활용품을 이용한 목공수업 및 에너지 전등 만들기를<br /> 통해 인재육성에 앞장서고 있다.</p>
				<div class="img"><img src="/resources/img/social_img03.jpg" alt="" /></div>
			</div>
			<div class="line">
				<h4>친환경 벽화</h4>
				<p>한화63시티는 지역사회의 발전을 위해 지역별 노후된 시설 및 기관을 찾아가 친환경 페인트를 사용한 벽화작업을 통해<br /> 친환경 만들기에 앞장서고 있다.</p>
				<div class="img"><img src="/resources/img/social_img04.jpg" alt="" /></div>
			</div>
			<h4>한강정화활동</h4>
			<p>한화63시티는 한강을 푸르게, 자연을 아름답게 라는 슬로건 하에 매년 한강 정화활동을 실시하여 깨끗한 환경 만들기에 앞장서고 있다.</p>
			<div class="img mb0"><img src="/resources/img/social_img05.jpg" alt="" /></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 4, 0);
	});
</script>
</body>
</html>