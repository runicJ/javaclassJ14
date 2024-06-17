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
	    height:35px;
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
            bottom: 0.7em;
            transform: scaleY(0.9);
        }
        50%{
            bottom: 1.2em;
            transform: scaleY(1);
        }
        100%{
            bottom: 0.7em;
            transform: scaleY(0.9);
        }
    }
    
    .modal-dialog {
        max-width: 70%;
        margin: 1.75rem auto;
    }

    .modal-body {
        padding: 0;
    }
    
	/* 위로 스르륵 버튼*/
	.back-to-top {
	  position: fixed;
	  visibility: hidden;
	  opacity: 0;
	  right: 15px;
	  bottom: 15px;
	  z-index: 996;
	  background: #3498db;
	  width: 40px;
	  height: 40px;
	  border-radius: 4px;
	  transition: all 0.4s;
	}
	
	.back-to-top i {
	  font-size: 28px;
	  color: #fff;
	  line-height: 0;
	}
	
	.back-to-top:hover {
	  background: #57aae1;
	  color: #fff;
	}
	
	.back-to-top.active {
	  visibility: visible;
	  opacity: 1;
	}
  </style>
  <script>
  	$(function() {
	    $("#datepicker_1, #datepicker_2").datepicker({
	        dateFormat: 'yy-mm-dd'
	    });
	});
  	
	function wishToggle(sIdx) {
	    $.ajax({
	        url: "StayWishToggle.st",
	        type: "post",
	        data: { sIdx: sIdx },
	        success: function(res) {
	        	let icon = document.getElementById("wish-icon-" + sIdx);
	            console.log('Response:', res.trim());
	            console.log('Icon element:', icon);
	            console.log('Icon before:', icon.className);
	            if (res.trim() == "true") {
	                icon.classList.remove('fa-solid', 'fa-heart');
	                icon.classList.add('fa-regular', 'fa-heart');
	            } else {
	                icon.classList.remove('fa-regular', 'fa-heart');
	                icon.classList.add('fa-solid', 'fa-heart');
	                icon.style.color = 'red';
	            }
	            console.log('Icon after:', icon.className);
	        },
	        error: function() {
	            alert("전송 오류!");
	        }
	    });
	}
	
	$(document).ready(function () {
		$(".smile").hover(function () {
			$("#videoModal").modal('show');
		});
	});
	

	function clip(){

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
	
  	function fCheck() {
  		let address = searchForm.address.value.trim();
  		let checkIn = searchForm.checkIn.value;
  		let checkOut = searchForm.checkOut.value;
  		let guestMax = searchForm.guestMax.value.trim();
  		
  		if(address == "" || (checkIn == "" && checkOut == "")) {
  			alert("여행 지역 또는 예약 날짜를 입력하세요!");
  			return;
  		}
  		
  		$.ajax({
            url  : "StayList.st",
            type : "post",
            data : {
            	address : address,
            	checkIn : checkIn,
            	checkOut : checkOut,
            	guestMax : guestMax
            },
            success: function(res) {
  				if(res != "0") {
  					alert("검색 조건에 맞는 숙소를 조회합니다.");
  					location.reload();
  				}
  				else {
  					alert("검색한 조건에 맞는 숙소가 없습니다.");
  				}
            },
            error: function() {
                alert("전송 오류!");
            }
  		});
  	}
  	
   	let lastScroll = 0;  // 마지막 위치
  	let curPage = 1;
  	
  	$(document).scroll(function(){
  		let currentScroll = $(this).scrollTop();  // 스크롤바 위쪽 시작 위치, 처음은 0이다. // currentScroll이라는 이름에 저장  // 현재 높이 0
  		let documentHeight = $(document).height();  // 화면에 표시되는 전체 문서의 높이 // 본문의 크기
  		let nowHeight = $(this).scrollTop() + $(window).height();  // 현재 화면상단 + 현재 화면높이 // 현재 높이 + 현재 화면의 높이
  		
  		// 스크롤이 아래로 내려갔을떄 이벤트 처리..
  		if(currentScroll > lastScroll) {  // 화면 끝까지 갔는지 체크
  			if(documentHeight < (nowHeight + (documentHeight*0.1))) {
  				// 다음페이지 가져오기...
  				console.log("다음페이지 가져오기");
  				curPage++;
  				getList(curPage);
  			}
  		}
  		lastScroll = currentScroll;  // 이렇게 하고 다시 계산
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
                            <h3 style="font-style:oblique;font-weight:bold;opacity:0.8;">If you want to be gifted a..</h3>
                            <h1 class="wrap" style="font-style:oblique;text-shadow: 2px 2px 1px #ddd;">Serene Nest</h1>
                                <p>오직 Serene Nest에서만..<span class="blink"> 
							        <c:choose>
							            <c:when test="${sMid == null || sMid == '' || sMid == 'admin'}">
							                '당신' 
							            </c:when>
							            <c:otherwise>
							                <span style="color:orange;">'${sNickName}'</span> 님
							            </c:otherwise>
							        </c:choose>을 위한, 
							    </span></p>
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
                                                <input id="datepicker_1" name="checkIn" placeholder="Check in">
                                            </div>
                                            <div class="form_colum">
                                                <input id="datepicker_2" name="checkOut" placeholder="Check out">
                                            </div>
                                            <div class="form_colum">
                                                <input class="select" type="number" name="guestMax" min="1" placeholder="인원 수"> 
                                            </div>
                                            <div class="form_btn">
                                                <input type="button" class="btn_1" onclick="fCheck()" value="search">
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
                    <div class="single_place" style="position:relative;height:450px;overflow:hidden">
                        <img src="${ctp}/images/stay/${sPhotos[0]}" class="img-fluid" alt="${stayVo.sName} thumbnail" style="height:100%; width:100%; object-fit: cover;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a class="place_btn">${stayVo.sort}</a>
                                <h3 style="font-weight:bold;"><a href="StayDetail.st?sIdx=${stayVo.sIdx}">${stayVo.sName}</a></h3>
                                <p>${stayVo.residence == 'Chung' ? '충청도' : stayVo.residence == 'Gang' ? '강원도' : stayVo.residence == 'Jeol' ? '전라도' : '경상도'}</p>
                                <div class="place_review">
                                    <c:forEach begin="1" end="${stayReviews[stayVo]}" var="star">
                                    	<i class="fas fa-star"></i>
                                	</c:forEach>
                                	<div class="place_review" style="color:#ffe500;">
	                                    <i class="fas fa-star"></i>
	                                    <i class="fas fa-star"></i>
	                                    <i class="fas fa-star"></i>
	                                    <i class="fas fa-star"></i>
	                                    <i class="fas fa-star"></i>
                                	<b>평점 : <fmt:formatNumber value="${stayReviews[reviewAvg]}" pattern="#,##0.0" /></b>
                                    </div>
                                <span>( review)</span>
                                </div>
                            </div>
							<div class="details_icon" style="position: absolute;  bottom: 30px;right: 20px;">
							    <c:choose>
							        <c:when test="${sMid != null && sMid != ''}">
							            <a type="button" onclick="wishToggle(${stayVo.sIdx})" class="link-wish" title="위시리스트 저장">
							                <c:if test="${stayVo.isWished == 1}">
							                    <i id="wish-icon-${stayVo.sIdx}" class="fa-solid fa-heart" style="color:red;"></i>
							                </c:if>
							                <c:if test="${stayVo.isWished == 0}">
							                    <i id="wish-icon-${stayVo.sIdx}" class="fa-regular fa-heart" style="color:white;"></i>
							                </c:if>
							            </a>
							        </c:when>
							        <c:otherwise>
							            <button class="btn btn-dark">
							                <b><i class="fa-solid fa-heart" style="background-color:#23272b"></i></i> Wish </b>${stayVo.wishCnt}
							            </button>
							        </c:otherwise>
							    </c:choose>
							</div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        <p class="text-center"><a href="StayList.st" class="btn_1">Stay more..</a><p>
        </div>
    </section>
    <hr>
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
                                    <li><a href="https://pf.kakao.com/_iExmtG"><i class="fa-solid fa-comment"></i></a></li>
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
		    <p class="text-center mt-3"><a href="BlogList.bl" class="btn_1 text-center">Travelog more..</a></p>
        </div>
    </section>
    <section class="client_review section_padding">
        <div class="container">
            <div class="row ">
                <div class="col-xl-6">
                    <div class="section_tittle">
                        <h2>Inspiring Travel Quotes</h2>
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
                            <p> 단지 도착만을 하기 위한 여행이라면 그 여행은 불쌍한 여행이다 </p>
                            <h5> - 아서 콜틴</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p> 여행에서 지식을 얻어 돌아오고 싶다면 떠날 때 지식을 몸에 지니고 가야 한다 </p>
                            <h5> - 사무엘 존슨</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p> 행복하게 여행하려면 가볍게 여행해야 한다. </p>
                            <h5> - 앙쿠안 드 셍텍쥐베리</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p> 세계는 한 권의 책이다. 여행하지 않는 사람은 단지 그 책의 한 페이지만을 읽는 것이다 </p>
                            <h5> - 성 아우구스티누스</h5>
                        </div>
                        <div class="single_review_slider">
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                            </div>
                            <p> 여행은 그대에게 적어도 세가지의 유익함을 가져다 줄것이다. 하나는 타향에 대한 지식이고 다른 하나는 고향에 대한 애착이며 마지막 하나는 그대 자신에 대한 발견이다. </p>
                            <h5> - 브하그완</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<p><br><p>
<!-- Video Modal -->
<div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="videoModalLabel">정부기관 영상 소개</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe width="100%" height="100%" src="https://www.youtube.com/embed/EK3XVaq3IO0?autoplay=1&mute=1&controls=0&rel=0&loop=1&playlist=EK3XVaq3IO0,r4XnNNgNBqw,GY3_Y-fR0Ew" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="fa-solid fa-arrow-up"></i></a>
<%@ include file = "../../include/footer.jsp"%>
</body>
</html>