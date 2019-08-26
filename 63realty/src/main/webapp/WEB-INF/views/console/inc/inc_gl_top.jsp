<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="mtl" uri="tlds/midasTagLib" %>
<!DOCTYPE html>
<html>
<head>
    <title>한화63시티 관리자</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<link rel="stylesheet" type="text/css" href="/resources/js/datepicker/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="/resources/console/css/common.css" />
    <script type="text/javascript" src="/resources/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/resources/js/datepicker/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.magnific-popup.js"></script>
	<script type="text/javascript" src="/resources/js/consoleServer.js"></script>
</head>
<body>
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
<input type="text" id="msgFlag" style="display: none;">
<!-- wrap -->
<div id="wrap">
	<!-- header -->
	<div id="header">
		<div class="header_in">
			<h1 class="logo"><a href="/console/main"><img src="/resources/console/img/logo.png" alt="" /></a></h1>
			<div class="header_link">
				<a href="/index">Homepage</a> <span>|</span>
				<a href="/console/logout">Logout</a>
			</div>
			<p class="header_txt"><span><sec:authentication property="principal.admName" />, 한화63시티 관리자 메뉴에 로그인하셨습니다.</span></p>
		</div>
		<div id="gnb">
			<ul class="depth01">
				<c:set value="-1" var="preRoot"/>
				<c:set value="Y" var="firstSub"/>
				<c:forEach items="${sessionScope.menuList}" var="menu" varStatus="status">
					<c:if test="${preRoot ne '-1' and menu.rootSeq ne preRoot}">
						</ul>
						<c:set value="Y" var="firstSub"/>
					</c:if>
					<c:choose>
						<c:when test="${menu.rootSeq ne preRoot }">
							<li><a href="javascript:;">${menu.menuName}</a>
							<c:set value="${menu.rootSeq}" var="preRoot"/>
						</c:when>						
						<c:otherwise>
							<c:if test="${firstSub eq 'Y'}">
								<ul class="depth02">
								<c:set value="N" var="firstSub"/>
							</c:if>
			                    <li>
			                    	<c:choose>
<%-- 			                    		<c:when test="${menu.menuUrl eq '/console/contents/financial' or menu.menuUrl eq '/console/contents/greenhouse'}"> --%>
<%-- 			                    			<a href="javascript:alert('준비중 입니다.');">${menu.menuName}</a> --%>
<%-- 			                    		</c:when> --%>
			                    		<c:when test="${menu.menuUrl eq '/console/statistics/analytics'}">
			                    			<a href="https://analytics.google.com/analytics/web/?hl=ko&pli=1#embed/report-home/a112323130w167411125p167659010/" target="_blank">${menu.menuName}</a>
			                    		</c:when>
			                    		<c:otherwise>
			                    			<a href="${menu.menuUrl}">${menu.menuName}</a>
			                    		</c:otherwise>
			                    	</c:choose>
<%-- 			                    	<a href="${menu.menuUrl}">${menu.menuName}</a> --%>
			                    </li>
		                  <c:if test="${status.last}">  				                    	
				                    </ul>
			                    </li>
		                    </c:if>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- //header -->

	<!-- container -->
	<div id="container">