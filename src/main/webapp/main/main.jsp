<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1.0">
	<title>Main Page</title>
  <%@ include file = "/include/bs4.jsp"%>
  <style>
  	.blink::after{
	    content:"";
	    height:45px;
	    width:3px;
	    background-color:#F5f5dc;
	    display:inline-block;
	    animation: cursor .8s ease-in-out infinite;
	}
	
	@keyframes cursor{
	    0%{
	        opacity:0.9;
	    }
	    100%{
	        opacity:0;
	    }
	}
	
    .smile {
	    background-color: transparent;
	    border: none;
	    color: #F5f5dc;
	    font-size: 1.5em;
	    position: absolute;
	    line-height: 8;
	    left: 50%;
	    transform: translateX(-50%);
	    animation: upDown 1s ease-in-out infinite;
	    cursor: pointer;
    }
    
    @keyframes upDown{
        0%{
            bottom: 1em;
            transform: scaleY(0.9);
        }
        50%{
            bottom: 1.5em;
            transform: scaleY(1);
        }
        100%{
            bottom: 1em;
            transform: scaleY(0.9);
        }
    }
  </style>
  <script>
  	$(function() {
	    $("#datepicker_1, #datepicker_2").datepicker({
	        dateFormat: 'yy-mm-dd'
	    });
	});
  </script>
</head>
<body>
<%@ include file = "/include/header.jsp"%>
<%@ include file = "/include/nav.jsp"%>
<div>
    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <h1>Serene Nest</h1>
                            <p>오직 Serene Nest에서만..<span class="blink">.</span></p>
                            <p><a href="#" class="smile"><i class="fa-regular fa-face-smile"></i></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="booking_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane active">
                                <div class="booking_form">
                                    <form name="searchForm" method="post" action="StayList.st">
                                        <div class="form-row">
                                            <div class="form_colum">
												<input class="select" type="text" name="address" placeholder="여행 지역"> 
                                            </div>
                                            <div class="form_colum">
                                                <input id="datepicker_1" name="datepicker" placeholder="Check in">
                                            </div>
                                            <div class="form_colum">
                                                <input id="datepicker_2" name="datepicker" placeholder="Check out">
                                            </div>
                                            <div class="form_colum">
                                                <input class="select" type="number" name="guest" min="1" placeholder="인원 수"> 
                                            </div>
                                            <div class="form_btn">
                                                <input type="submit" class="btn_1" value="search">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="top_place section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>Top Stay 4</h2>
                        <p>Serene Nest에서 가장 인기있는 숙소를 소개합니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
    			<c:forEach var="stayVo" items="${stayVos}" varStatus="st">
    			<c:set var="sPhotos" value="${fn:split(stayVo.sPhoto, '/')}"/>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place" style="height:600px;overflow:hidden">
                        <img src="${ctp}/images/stay/${sPhotos[0]}" class="img-fluid" alt="${stayVo.sName} thumbnail">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a class="place_btn">${stayVo.sort}</a>
                                <h3><a href="StayDetail.st?sIdx=${stayVo.sIdx}">${stayVo.sName}</a></h3>
                                <p>${stayVo.residence == 'Chung' ? '충청도' : stayVo.residence == 'Gang' ? '강원도' : stayVo.residence == 'Jeol' ? '전라도' : '경상도'}</p>
                                <div class="place_review">
                                    <c:forEach begin="1" end="${stayReviews[stayVo]}" var="star">
                                    	<i class="fas fa-star"></i>
                                	</c:forEach>
                                	<b>평점 : <fmt:formatNumber value="${stayReviews[reviewAvg]}" pattern="#,##0.0" /></b>
                                <span>( review)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-heart"></i>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        <a href="StayList.st" class="btn_1 text-center">Stay more</a>
        </div>
    </section>

    <section class="hotel_list section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>Best Travelog</h2>
                        <p>현재 가장 관심이 뜨거운 여행블로그를 추천합니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="blogVo" items="${blogVos}">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                    <c:set var="tPhotos" value="${fn:split(blogVo.tPhoto, '/')}"/>
                        <img src="${ctp}/images/blog/${tPhotos[0]}" class="img-fluid" alt="${blogVo.title} thumbnail" style="height:250px;overflow:hidden;">
                        <div class="hover_text">
                            <div class="hotel_social_icon">
                                <ul>
                                    <li><a href="https://pf.kakao.com/_iExmG"><i class="fa-solid fa-comment"></i></a></li>
                                    <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                </ul>
                            </div>
                            <div class="share_icon">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                            <h3><a href="BlogDetail.bl?tIdx=${blogVo.tIdx}">
                            	<c:if test="${fn:length(blogVo.title) > 20}">${fn:substring(blogVo.title,0,20)}...</c:if>
                            	<c:if test="${fn:length(blogVo.title) <= 20}">${blogVo.title}</c:if>
                            </a></h3>
                            <div class="place_review">
                                <i class="fa-solid fa-eye"></i><span> (조회수 : ${blogVo.viewCnt})</span>
                            </div>
                            <p>${blogVo.residence=="" ? "미상" : blogVo.residence}</p>
                            <h5>By <span>${blogVo.nickName}</span></h5>
                        </div>
                    </div>
                </div>
			    </c:forEach>
            </div>
		    <a href="BlogList.bl" class="btn_1 text-center">Travelog more</a>
        </div>
    </section>

    <section class="client_review section_padding">
        <div class="container">
            <div class="row ">
                <div class="col-xl-6">
                    <div class="section_tittle">
                        <h2>가장 도움이 되는 후기 댓글</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="client_review_slider owl-carousel">
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p>Waters make fish every without firmament saw had. Morning air subdue. Our Air very one whales grass is fish whales winged night yielding land creeping that seed </p>
                            <h5> - Allen Miller</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<p><br/></p>
<%@ include file = "../../include/footer.jsp"%>
</body>
</html>