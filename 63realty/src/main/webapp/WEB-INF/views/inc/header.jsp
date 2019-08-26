<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${not empty msg}">
<script>
	$(function(){		
		if($("#msgFlag").val()!="Y"){
			alert( "${msg}");			
			$("#msgFlag").val("Y");
		}
	});
</script>
</c:if>
<input type="hidden" id="msgFlag">
<!-- wrap -->
<div id="wrap">
	<!-- skip navi -->
	<dl id="skiptoContent">
		<dt><strong class="hidden">바로가기 메뉴</strong></dt>
		<dd><a href="#contents" class="accessibility">본문 바로가기</a></dd>
		<dd><a href="#gnb" class="accessibility">주 메뉴 바로가기</a></dd>
	</dl>
	<!-- //skip navi -->

	<!-- header -->
	<header id="header">
		<div class="header_in">
			<h1><a href="/index"><img src="/resources/img/logo.gif" alt="한화63시티" /></a></h1>
			<ul class="util">
				<li><a href="/cs/contact">CONTACT US</a></li>
				<li><a href="/eng/index">ENGLISH</a></li>
			</ul>
			
			<!-- 전체메뉴보기 -->
			<div class="allmenu">
				<a href="javascript:;" class="allmenu_open"><img src="/resources/img/btn_allmenu.gif" alt="전체메뉴보기" /></a>
				<div class="allmenu_list">
					<a href="javascript:;" class="allmenu_close">CLOSE</a>
				</div>
			</div>
			<!-- //전체메뉴보기 -->

			<!-- gnb -->
			<nav id="gnb">
				<ul>
					<li class="m-1"><a href="/about/overview">회사소개</a>
						<ul class="depth2">
							<!-- <li class="s-1"><a href="/about/greetings">인사말</a></li> -->
							<li class="s-2"><a href="/about/overview">회사개요</a></li>
							<li class="s-3"><a href="/about/vision">비전</a></li>
							<li class="s-4"><a href="/about/history">연혁</a></li>
							<li class="s-5"><a href="/about/achievement">실적 및 제휴</a></li>
							<li class="s-6"><a href="/about/location">오시는 길</a></li>
						</ul>
					</li>
					<li class="m-2"><a href="/business/property_intro">사업영역</a>
						<ul class="depth2">
							<li class="s-1"><a href="/business/property_intro">자산관리</a></li>
							<li class="s-2"><a href="/business/leasing_intro">임대차 컨설팅</a></li>
							<li class="s-3"><a href="/business/investment_intro">투자자문</a></li>
							<li class="s-4"><a href="/business/facility_intro">시설관리</a></li>
							<li class="s-5"><a href="/business/engineering">엔지니어링</a></li>
						</ul>
					</li>
					<li class="m-3"><a href="/pr/socialNews_list">홍보센터</a>
						<ul class="depth2">
							<li class="s-1"><a href="/pr/socialNews_list">뉴스</a></li>
							<%--<li class="s-2"><a href="/pr/e_brochure">브로슈어</a></li>--%>
							<li class="s-3"><a href="/pr/ethics">윤리경영</a></li>
							<li class="s-4"><a href="/pr/social">사회공헌</a></li>
							<li class="s-5"><a href="/pr/environment">환경안전보건경영</a></li>
							<li class="s-6"><a href="/pr/office_list">부동산 자료실</a></li>
							<li class="s-7"><a href="/pr/settlement">결산공고</a></li>
						</ul>
					</li>
					<li class="m-4"><a href="/recruit/info">채용안내</a>
						<ul class="depth2">
							<li class="s-1"><a href="/recruit/info">채용정보</a></li>
							<li class="s-2"><a href="/recruit/right_people">인재육성</a></li>
							<li class="s-3"><a href="/recruit/hr">인사제도</a></li>
							<li class="s-4"><a href="/recruit/welfare">복지제도</a></li>
							<li class="s-5"><a href="/recruit/job">직무소개</a></li>
						</ul>
					</li>
					<li class="m-5"><a href="/cs/notice_list">고객지원</a>
						<ul class="depth2">
							<li class="s-1"><a href="/cs/notice_list">공지사항</a></li>
							<li class="s-2"><a href="/cs/faq01">자주하는 질문</a></li>
							<li class="s-3"><a href="/cs/contact">담당자 정보</a></li>
							<li class="s-4"><a href="/cs/voc_list">고객의 소리</a></li>
							<li class="s-5"><a href="/cs/cyber_write">사이버신문고</a></li>
						</ul>
					</li>
					<li class="m-6"><a href="javascript:;" onclick="ajaxPopupOpen();">관리자산</a></li>
				</ul>
			</nav>
			<!-- //gnb -->
		</div>
	</header>
	<!-- //header -->
	<!-- 빌딩정보 -->
<div id="_ajax_property_popup" class="property_popup mfp-hide"></div>

	<!-- container -->
	<div id="container">
		<div class="sub_top">
			<div class="sub_top_in"><span class="txt"></span> <span class="img"></span></div>
		</div>