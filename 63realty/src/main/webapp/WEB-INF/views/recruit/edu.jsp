<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>교육제도 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 채용안내 &gt; 인재육성 &gt; <strong>교육제도</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_recruit.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>교육제도</h2></div>
		<h3 class="recruit_title mt0">인재육성</h3>
		<p class="recruit_txt1 mt0">한화63시티는 한화그룹의 핵심가치(도전, 헌신, 정도) 이해를 바탕으로 창의적이고 Global 경쟁력을 갖춘 인재를 육성합니다.</p>
		<div class="edu_img">
			<div class="hidden">
				<ul>
					<li>01 계층교육 
						<ul>
							<li>신입사원 HPMP(Hanwha Pre Manager Program)</li>
							<li>신임팀장/임원과정</li>
							<li>경력지원 입문과정</li>
							<li>핵심가치 교육</li>
						</ul>
					</li>
					<li>02 리더쉽교육
						<ul>
							<li>리더쉽과정</li>
							<li>신입팀장코칭과정</li>
							<li>경영역량과정</li>
							<li>문제해결교육과정</li>
							<li>리더후보과정</li>
						</ul>
					</li>
					<li>03 Global 교육 
						<ul>
							<li>Global Telent Program</li>
							<li>해외유학연수제도</li>
							<li>어학교육</li>
						</ul>
					</li>
					<li>04 직무교육
						<ul>
							<li>온라인교육</li>
							<li>전문직무교육</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(4, 2, 2);
	});
</script>
</body>
</html>