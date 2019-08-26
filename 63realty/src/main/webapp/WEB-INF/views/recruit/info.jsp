<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>채용정보 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 채용안내 &gt; <strong>채용정보</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_recruit.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>채용정보</h2></div>
		<h3 class="recruit_title mt0">채용부문</h3>
		<p class="recruit_txt1">일반직 신입사원/인턴사원/경력사원 채용</p>
		<p class="recruit_txt2">한화그룹 채용사이트 (<a href="http://www.hanwhain.co.kr" target="_blank">http://www.hanwhain.co.kr</a>) 통해 공고 및 모집</p>
		<p class="recruit_txt1">기술직 및 기타 직무 수시채용</p>
		<p class="recruit_txt2">구인공고 사이트(사람인, 인크루트 등) 통해 별도 공고</p>

		<h3 class="recruit_title">채용절차</h3>
		<div class="mt10"><img src="/resources/img/recruit_step.gif" alt="Step 01. 지원자 접수, Step 02. 서류 전형, Step 03. 면접 전형, Step 04. 입사" /></div>
		<p class="recruit_txt3 mt0">※ 전형 별 합격자에 한해 별도 통보</p>

		<h3 class="recruit_title">지원방법</h3>
		<p class="recruit_txt1">일반직 신입사원/인턴사원/경력사원</p>
		<p class="recruit_txt2">한화그룹 채용사이트 통해 접수</p>
		<p class="recruit_txt1">기술직 및 기타 직무</p>
		<p class="recruit_txt2">입사지원서 e-mail 접수(채용 공고 시 안내)</p>
		<p class="recruit_txt3">※ 제출서류(경력증명서, 성적증명서, 자격증 사본 등)는 면접전형 시 제출</p>
	
		<div class="recruit_return">
			<h4>채용 제출 서류 반환 안내</h4>
			<p>오프라인으로 제출한 서류는 최종합격자 발표 후 90일까지 보관</p>
			<ul>
				<li>※ 개인정보보호를 위해 90일 이후에는 폐기합니다.</li>
				<li>※ 대상 서류 : 지원서, 자기소개서, 자격증 사본, 증명서 등<br />반환 대상 : 채용서류 제출자 중 불합격자 및 최종합격 후 미입사한 구직자</li>
				<li>※ 최종합격 후 입사자는 반환 제외<br />반환 절차 : 최종합격 발표 후 90일 이내 채용담당자에게 반환 신청</li>
				<li>※ 반환 신청 접수 후 등기우편으로 전달</li>
			</ul>
		</div>

		<h3 class="recruit_title">기타사항</h3>
		<p class="recruit_txt2">지원서 작성 내용이 사실과 다른 경우 입사가 취소될 수 있습니다.</p>
		<p class="recruit_txt2">장애인, 보훈대상자, 국가유공자 등은 관련법에 의거 우대합니다.</p>

		<h3 class="recruit_title">문의처</h3>
		<p class="recruit_txt2">대졸 신입/인턴 채용 : <strong class="color_org">02.789.6307</strong></p>
		<p class="recruit_txt2">경력직/기술직 채용 : <strong class="color_org">02.789.5539</strong></p>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(4, 1, 0);
	});
</script>
</body>
</html>