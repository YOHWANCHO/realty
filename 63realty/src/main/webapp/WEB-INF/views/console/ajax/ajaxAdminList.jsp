<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<div class="table_list mt10">
			<table>
				<colgroup>
					<col style="width:30%;">
					<col style="width:30%;">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>사번</th>
						<th>이름</th>
						<th>부서</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty adminList }">
					<tr>
						<td colspan="3">조회된 내용이 없습니다.</td>						
					</tr>
					</c:if>
					<c:forEach items="${adminList }" var="vo" varStatus="status">
					<tr onclick="setManager('${vo.admID}','${vo.admName}','${vo.departmentName}');">
						<td>${vo.admID}</td>
						<td>${vo.admName}</td>
						<td>${vo.departmentName}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="page_wrap">
			<a class="btn_arrow btn_first" href="javascript:findAdminList(${searchVO.firstPageIndex})">
				<img src="/resources/console/img/btn_first.gif" alt="" />
			</a>
			<a class="btn_arrow btn_prev" href="javascript:findAdminList(${searchVO.prevPageIndex})">
				<img src="/resources/console/img/btn_prev.gif" alt="" />
			</a>
			<c:forEach var="i" begin="${searchVO.startPageIndex}" end="${searchVO.endPageIndex}" step="1">
				<c:choose>
					<c:when test="${i eq searchVO.pageIndex }">
						<a href="javascript:findAdminList(${i})" class="current">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:findAdminList(${i})"> ${i} </a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a class="btn_arrow btn_next" href="javascript:findAdminList(${searchVO.nextPageIndex})">
				<img src="/resources/console/img/btn_next.gif" alt="" />
			</a>
			<a class="btn_arrow btn_last" href="javascript:findAdminList(${searchVO.finalPageIndex})">
				<img src="/resources/console/img/btn_last.gif" alt="" />
			</a>
		</div>
