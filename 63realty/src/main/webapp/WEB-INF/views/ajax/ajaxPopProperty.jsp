<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<h3>관리사옥 검색 서비스 <strong>관리중인 사업실적에 대한 정보를 자세히 알려드립니다.</strong></h3>
	<div class="property_box">
		<!-- 지도 영역 -->
		<div class="map_area">
			<ul class="property_map">
					<li class="map_se"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'10');" class="${searchVO.bldZone eq '10' ? 'on' : ''}">서울</a></li>
					<li class="map_gg"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'11');" class="${searchVO.bldZone eq '11' ? 'on' : ''}">경기</a></li>
					<li class="map_ic"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'12');" class="${searchVO.bldZone eq '12' ? 'on' : ''}">인천</a></li>
					<li class="map_dj"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'13');" class="${searchVO.bldZone eq '13' ? 'on' : ''}">대전</a></li>
					<li class="map_cn"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'14');" class="${searchVO.bldZone eq '14' ? 'on' : ''}">충남</a></li>
					<li class="map_cb"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'15');" class="${searchVO.bldZone eq '15' ? 'on' : ''}">충북</a></li>
					<li class="map_bs"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'16');" class="${searchVO.bldZone eq '16' ? 'on' : ''}">부산</a></li>
					<li class="map_dg"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'17');" class="${searchVO.bldZone eq '17' ? 'on' : ''}">대구</a></li>
					<li class="map_us"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'18');" class="${searchVO.bldZone eq '18' ? 'on' : ''}">울산</a></li>
					<li class="map_gn"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'19');" class="${searchVO.bldZone eq '19' ? 'on' : ''}">경남</a></li>
					<li class="map_gb"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'20');" class="${searchVO.bldZone eq '20' ? 'on' : ''}">경북</a></li>
					<li class="map_jb"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'21');" class="${searchVO.bldZone eq '21' ? 'on' : ''}">전북</a></li>
					<li class="map_jn"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'22');" class="${searchVO.bldZone eq '22' ? 'on' : ''}">전남</a></li>
					<li class="map_gj"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'23');" class="${searchVO.bldZone eq '23' ? 'on' : ''}">광주</a></li>
					<li class="map_gw"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'24');" class="${searchVO.bldZone eq '24' ? 'on' : ''}">강원</a></li>
					<li class="map_jj"><a href="javascript:;" onclick="ajaxFindPopupOpen('',0,'25');" class="${searchVO.bldZone eq '25' ? 'on' : ''}">제주</a></li>
			</ul>
		</div>
		<!-- //지도 영역 -->
		<div class="list_area">
			<form name="ajaxSearchForm" method="GET" >				
				<div class="search_box">
					<select class="form_select" id="bldZone" name="bldZone">
						<option value="">전국</option>
						<c:forEach var="vo" items="${combo}" varStatus="status">
							<option value="${vo.bldCodeSeq}" ${searchVO.bldZone eq vo.bldCodeSeq?'selected':''}>${vo.codeName}</option>
						</c:forEach>
					</select>
					<input type="text" placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요." class="form_input" style="width:260px;" name="searchText" value="${searchVO.searchText}"/>
					<button type="button" class="btn_search" onclick="ajaxFindPopupOpen(document.ajaxSearchForm,0,'');">검색</button>
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
					<a href="javascript:ajaxFindPopupOpen( document.ajaxSearchForm, ${searchVO.firstPageIndex},'')" class="page_arrow first"><span class="hidden">첫 페이지로 이동</span></a>
					<a href="javascript:ajaxFindPopupOpen( document.ajaxSearchForm, ${searchVO.prevPageIndex},'')" class="page_arrow prev"><span class="hidden">이전 페이지로 이동</span></a>
					
					
					<c:forEach var="i" begin="${searchVO.startPageIndex}" end="${searchVO.endPageIndex}" step="1">
						<c:choose>
							<c:when test="${i eq searchVO.pageIndex }">
								<a href="javascript:ajaxFindPopupOpen( document.ajaxSearchForm, ${i},'')" class="current" title="현재페이지">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:ajaxFindPopupOpen(document.ajaxSearchForm, ${i},'')"> ${i} </a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<a href="javascript:ajaxFindPopupOpen( document.ajaxSearchForm, ${searchVO.nextPageIndex},'')" class="page_arrow next"><span class="hidden">다음 페이지로 이동</span></a>
					<a href="javascript:ajaxFindPopupOpen( document.ajaxSearchForm, ${searchVO.finalPageIndex},'')" class="page_arrow last"><span class="hidden">마지막 페이지로 이동</span></a>
				</div>
				<!-- //paging -->
			</div>
			<!-- //리스트 -->
		</div>
	</div>
	<a href="javascript:;" class="popup_close mfp-close">닫기</a>

