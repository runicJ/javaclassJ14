<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewpoint" content="width=divice-width, initial-scale=1.0">
	<title>Insert</title>
  <%@ include file = "../../include/bs4.jsp"%>
  <style>
  	/*--------------------------------------------------------------
	# Back to top button
	--------------------------------------------------------------*/
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
	/*--------------------------------------------------------------
	# Portfolio
	--------------------------------------------------------------*/
	.portfolio {
	  padding: 60px 0;
	}
	
	.portfolio #portfolio-flters {
	  padding: 0;
	  margin: 0 0 35px 0;
	  list-style: none;
	  text-align: center;
	}
	
	.portfolio #portfolio-flters li {
	  cursor: pointer;
	  margin: 0 15px 15px 0;
	  display: inline-block;
	  padding: 10px 20px;
	  font-size: 12px;
	  line-height: 20px;
	  color: #444444;
	  border-radius: 4px;
	  text-transform: uppercase;
	  background: #fff;
	  margin-bottom: 5px;
	  transition: all 0.3s ease-in-out;
	}
	
	.portfolio #portfolio-flters li:hover,
	.portfolio #portfolio-flters li.filter-active {
	  background: #3498db;
	  color: #fff;
	}
	
	.portfolio #portfolio-flters li:last-child {
	  margin-right: 0;
	}
	
	.portfolio .portfolio-wrap {
	  box-shadow: 0px 2px 12px rgba(0, 0, 0, 0.08);
	  transition: 0.3s;
	}
	
	.portfolio .portfolio-wrap:hover {
	  box-shadow: 0px 4px 14px rgba(0, 0, 0, 0.16);
	}
	
	.portfolio .portfolio-item {
	  position: relative;
	  height: 360px;
	  overflow: hidden;
	}
	
	.portfolio .portfolio-item figure {
	  background: #000;
	  overflow: hidden;
	  height: 240px;
	  position: relative;
	  border-radius: 4px 4px 0 0;
	  margin: 0;
	}
	
	.portfolio .portfolio-item figure:hover img {
	  opacity: 0.4;
	  transition: 0.4s;
	}
	
	.portfolio .portfolio-item figure .link-preview,
	.portfolio .portfolio-item figure .link-details,
	.portfolio .portfolio-item figure .link-wish {
	  position: absolute;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  opacity: 0;
	  line-height: 0;
	  text-align: center;
	  width: 36px;
	  height: 36px;
	  background: #fff;
	  border-radius: 50%;
	  transition: all 0.2s linear;
	  overflow: hidden;
	  font-size: 20px;
	}
	
	.portfolio .portfolio-item figure .link-preview i,
	.portfolio .portfolio-item figure .link-details i,
	.portfolio .portfolio-item figure .link-wish i {
	  color: #384046;
	  line-height: 0;
	}
	
	.portfolio .portfolio-item figure .link-preview:hover,
	.portfolio .portfolio-item figure .link-details:hover,
	.portfolio .portfolio-item figure .link-wish:hover {
	  background: #3498db;
	}
	
	.portfolio .portfolio-item figure .link-preview:hover i,
	.portfolio .portfolio-item figure .link-details:hover i,
	.portfolio .portfolio-item figure .link-wish:hover i {
	  color: #fff;
	}
	
	.portfolio .portfolio-item figure .link-preview {
	  left: calc(50% - 60px);
	  top: calc(50% - 18px);
	}

	.portfolio .portfolio-item figure .link-wish {
	  left: calc(50% - 17px);
	  top: calc(50% - 18px);
	}
	
	.portfolio .portfolio-item figure .link-details {
	  right: calc(50% - 60px);
	  top: calc(50% - 18px);
	}
	
	
	.portfolio .portfolio-item figure:hover .link-preview {
	  opacity: 1;
	  left: calc(50% - 70px);
	}

	.portfolio .portfolio-item figure:hover .link-wish {
	  opacity: 1;
	  left: calc(50% - 17px);
	}
	
	.portfolio .portfolio-item figure:hover .link-details {
	  opacity: 1;
	  right: calc(50% - 70px);
	}
	
	.portfolio .portfolio-item .portfolio-info {
	  background: #fff;
	  text-align: center;
	  padding: 30px;
	  height: 90px;
	  border-radius: 0 0 3px 3px;
	}
	
	.portfolio .portfolio-item .portfolio-info h4 {
	  font-size: 18px;
	  line-height: 1px;
	  font-weight: 700;
	  margin-bottom: 18px;
	  padding-bottom: 0;
	}
	
	.portfolio .portfolio-item .portfolio-info h4 a {
	  color: #333;
	}
	
	.portfolio .portfolio-item .portfolio-info h4 a:hover {
	  color: #3498db;
	}
	
	.portfolio .portfolio-item .portfolio-info p {
	  padding: 0;
	  margin: 0;
	  color: #b8b8b8;
	  font-weight: 500;
	  font-size: 14px;
	  text-transform: uppercase;
	}
	
	.portfolio-info i {
	  font-size: 20px;
	  vertical-align: middle;
	}
  </style>
  <script>
  	'use strict';
  	
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
  	
  	// 리스트 불러오기 함수(ajax처리)
  	function getList(curPage) {
  		$.ajax({
  			url : "ScrollPage.st",
  			type : "post",
  			data : {pag : curPage},
  			success:function(res) {
  				$("#list-wrap").append(res);
  			},
  			error:function() {
  				alert("전송 오류!");
  			}
  		});
  	}
	
  	function wishToggle(sIdx) {
        $.ajax({
            url  : "StayWishToggle.st",
            type : "post",
            data : {sIdx : sIdx},
            success:function() {                
              location.reload();
            },
            error : function() {
  				alert("전송오류!");
            }
        });    
    }
  </script>
  
  <!-- Vendor CSS Files -->
  <link href="${ctp}/setting/css/stay/boxicons.min.css" rel="stylesheet">
  <link href="${ctp}/setting/css/stay/glightbox.min.css" rel="stylesheet">
  <link href="${ctp}/setting/css/stay/swiper-bundle.min.css" rel="stylesheet">
</head>
<body>
<%@ include file = "../../include/header.jsp"%>
<%@ include file = "../../include/nav.jsp"%>
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>Stay List</h2>
                            <p>Serene Nest는 당신에게 필요한 맞춤 보금자리를 제공합니다.</p>
                            <c:if test="${sMid == 'admin'}"><a href="StayInput.st" class="btn_1">숙소 등록하기</a></c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<div class="container">
    <!-- booking part start-->
    <section class="booking_part">
        <div class="row">
            <div class="col-lg-12">
                <div class="booking_content">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
                            <div class="booking_form">
                                <form action="#">
                                    <div class="form-row">
                                        <div class="form_colum">
                                            <select class="nc_select">
                                                <option selected>Choosace place </option>
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                        </div>
                                        <div class="form_colum">
                                            <input id="datepicker_1" placeholder="Check in date">
                                        </div>
                                        <div class="form_colum">
                                            <input id="datepicker_2" placeholder="Check in date">
                                        </div>
                                        <div class="form_colum">
                                            <select class="nc_select">
                                                <option selected>Persone </option>
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                        </div>
                                        <div class="form_btn">
                                            <a href="#" class="btn_1">search</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- ======= Portfolio Section ======= -->
    <section id="portfolio list-wrap" class="portfolio">
      <div class="container">

        <div class="row">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">전체</li>
              <li data-filter=".filter-Gang">강원도</li>
              <li data-filter=".filter-Chung">충청도</li>
              <li data-filter=".filter-Jeol">전라도</li>
              <li data-filter=".filter-Gyeong">경상도</li>
            </ul>
          </div>
        </div>
		<div class="row portfolio-container" id="list-wrap">
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
			</c:forEach>
		</div>
        </div>
    </section><!-- End Portfolio Section -->
</div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="fa-solid fa-arrow-up"></i></a>
<p><br/></p>
<%@ include file = "../../include/footer.jsp"%>
  <!-- Vendor JS Files -->
  <script src="${ctp}/js/stay/purecounter_vanilla.js"></script>
  <script src="${ctp}/js/stay/bootstrap.bundle.min.js"></script>
  <script src="${ctp}/js/stay/glightbox.min.js"></script>
  <script src="${ctp}/js/stay/isotope.pkgd.min.js"></script>
  <script src="${ctp}/js/stay/swiper-bundle.min.js"></script>
  <script src="${ctp}/js/stay/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="${ctp}/js/stay/main.js"></script>
</body>
</html>