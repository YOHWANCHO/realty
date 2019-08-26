<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<!-- leftmenu -->
		
		<c:set value="-1" var="preRoot"/>
		<c:set value="" var="rootUrl"/>
		<c:forEach items="${sessionScope.menuList}" var="menu" varStatus="status">
			<c:if test="${menu.level eq '1' }">
				<c:set value="${menu.menuUrl}" var="rootUrl"/>	
			</c:if>
			<c:if test="${fn:contains(reqUri,rootUrl)}">
				<c:choose>
					<c:when test="${menu.level eq '1'}">
						<div class="lnb"><h2>${menu.menuName}</h2><ul>							
					</c:when>						
					<c:otherwise>							
	                    <li class="s-2">
	                    	<c:choose>
<%-- 	                    		<c:when test="${menu.menuUrl eq '/console/contents/financial' or menu.menuUrl eq '/console/contents/greenhouse'}"> --%>
<%-- 	                    			<a href="javascript:alert('준비중 입니다.');">${menu.menuName}</a> --%>
<%-- 	                    		</c:when> --%>
	                    		<c:when test="${menu.menuUrl eq '/console/statistics/analytics'}">
	                    			<a href="https://analytics.google.com/analytics/web/?hl=ko&pli=1#embed/report-home/a112323130w167411125p167659010/" target="_blank">${menu.menuName}</a>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<a href="${menu.menuUrl}">${menu.menuName}</a>
	                    		</c:otherwise>
	                    	</c:choose>
<%-- 	                    	<a href="${menu.menuUrl}">${menu.menuName}</a> --%>
	                    </li>
					</c:otherwise>
				</c:choose>
			</c:if>
			<c:if test="${status.last}">  				                    	
					</ul>
				</div>
			</c:if>
		</c:forEach>
		