<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

	<c:forEach var="vo" items="${vos}" varStatus="st">
        <c:set var="sPhotos" value="${fn:split(vo.sPhoto, '/')}"/>
        <div class="col-lg-4 col-md-6 portfolio-item filter-${vo.residence} wow fadeInUp">
            <div class="portfolio-wrap">
                <figure>
                    <img src="${ctp}/images/stay/${sPhotos[0]}" class="img-fluid" alt="${vo.sName}">
                    <c:forEach var="sPhoto" items="${sPhotos}" varStatus="st">
                        <a href="${ctp}/images/stay/${sPhoto}" data-gallery="${sPhotos}" class="link-preview portfolio-lightbox" title="사진 보기"><i class="fa-solid fa-plus"></i></a>
                    </c:forEach>
                    <a onclick="wishToggle(${vo.sIdx})" class="link-wish" title="위시리스트 저장"><i class="fa-solid fa-heart"></i></a>
                    <a href="StayDetail.st?sIdx=${vo.sIdx}" class="link-details" title="상세정보 보기"><i class="fa-solid fa-link"></i></a>
                </figure>
				<div class="portfolio-info">
                	<h4><a href="StayDetail.st?sIdx=${vo.sIdx}">${vo.sName}</a></h4>
	                <p>
		                <c:if test="${vo.facility.wifi == 'OK'}"><i class="fa fa-fw fa-wifi"></i></c:if>
				        <c:if test="${vo.facility.ac == 'OK'}"><i class="material-icons">ac_unit</i></c:if>
				        <c:if test="${vo.facility.parking == 'OK'}"><i class="material-icons">local_parking</i></c:if>
						<c:if test="${vo.facility.pet == 'OK'}"><i class='fas fa-fw fa-dog'></i></c:if>
				        <c:if test="${vo.facility.kitchen == 'OK'}"><i class="fa fa-fw fa-cutlery"></i></c:if>
				        <c:if test="${vo.facility.washing == 'OK'}"><i class="material-icons">local_laundry_service</i></c:if>
			        </p>
				</div>
    		</div>
    	</div>
    	<c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
		<c:if test="${curScrStartNo < 1}"><h4 class="text-center text-danger"><b>더이상 표시할 게시물이 없습니다.</b></h4></c:if>
	</c:forEach>