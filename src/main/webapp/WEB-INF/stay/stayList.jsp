<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Stay List</title>
  <%@ include file = "../../include/bs4.jsp"%>
  <style>
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
	/*--------------------------------------------------------------
	# Portfolio
	--------------------------------------------------------------*/
	.portfolio {
	  padding: 60px 0;
	}
	
	.portfolio-container {
	    height: auto;
	    overflow-y: auto;
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
	  height: 220px;
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
	  opacity: 0.6;
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
	  height: 100px;
	  border-radius: 0 0 3px 3px;
	}
	
	.portfolio .portfolio-item .portfolio-info h4 {
	  font-size: 18px;
	  line-height: 1px;
	  font-weight: bold;
	  padding-bottom: 0;
	}
	
	.portfolio .portfolio-item .portfolio-info p h5 {
	  font-size: 16px;
	  line-height: 1px;
	  font-weight: bold;
	  padding-bottom: 0;
	}
	
	.portfolio .portfolio-item .portfolio-info h4 a {
	  color: #333;
	}
	
	.portfolio .portfolio-item .portfolio-info h4 a:hover {
	  color: #3498db;
	}
	
	.portfolio .portfolio-item .portfolio-info p #facility {
	  padding: 0;
	  margin: 0;
	  color: #b8b8b8;
	  font-weight: 500;
	  font-size: 14px;
	}
	
	.portfolio-info i {
	  font-size: 18px;
	  vertical-align: middle;
	}
  </style>
  <script>
  	'use strict';
  	
    document.addEventListener('DOMContentLoaded', function () {
        let checkInInput = document.getElementById('datepicker_1');
        let checkOutInput = document.getElementById('datepicker_2');

        if (checkInInput) {
            checkInInput.value = '';
        }

        if (checkOutInput) {
            checkOutInput.value = '';
        }
    });
    
    $(function() {
        let today = new Date();
        $("#datepicker_1, #datepicker_2").datepicker({
            locale: 'ko-kr',
            format: 'yyyy-mm-dd',
            startDate: today,
            autoclose: true
        });

        $("#datepicker_1").val('');
        $("#datepicker_2").val('');
    });
  	
   	let lastScroll = 0;  // 마지막 위치
  	let curPage = 1;
  	
  	$(document).scroll(function(){
  		let currentScroll = $(this).scrollTop();
  		let documentHeight = $(document).height();
  		let nowHeight = $(this).scrollTop() + $(window).height();
  		
  		if(currentScroll > lastScroll) {
  			if(documentHeight < (nowHeight + (documentHeight*0.1))) {
  				console.log("다음페이지 가져오기");
  				curPage++;
  				getList(curPage);
  			}
  		}
  		lastScroll = currentScroll;
  	});
  	
  	let iso;

  	$(document).ready(function() {
  	    if ($('.portfolio-container').length) {
  	        iso = new Isotope('.portfolio-container', {
  	            itemSelector: '.portfolio-item',
  	            layoutMode: 'fitRows'
  	        });
  	    }

  	    $('#portfolio-flters li').on('click', function() {
  	        var filterValue = $(this).attr('data-filter');
  	        iso.arrange({ filter: filterValue });
  	        $('#portfolio-flters li').removeClass('filter-active');
  	        $(this).addClass('filter-active');
  	    });
  	});

	function getList(curPage) {
	    $.ajax({
	        url: "ScrollPage.st",
	        type: "post",
	        data: {pag: curPage},
	        success: function(res) {
	            var $items = $(res);
	            $('#list-wrap').append($items);
	            iso.appended($items);
	            iso.arrange();
	
	            if (lightbox) {
	                lightbox.destroy();
	            }
	
	            lightbox = GLightbox({
	                selector: '.portfolio-lightbox'
	            });
	        },
	        error: function() {
	            alert("전송 오류!");
	        }
	    });
	}

	function wishToggle(sIdx) {
		if(${sMid==null || sMid == ""}) {
			alert("로그인 후에 가능한 메뉴입니다!");
			return;
		}
		
	    $.ajax({
	        url: "StayWishToggle.st",
	        type: "post",
	        data: { sIdx: sIdx },
	        success: function(res) {
	        	let icon = document.getElementById("wish-icon-" + sIdx);
	            if (res.trim() == "true") {
	                icon.classList.remove('fa-solid', 'fa-heart');
	                icon.classList.add('fa-regular', 'fa-heart');
	                icon.style.color = 'black';
	                alert("해당 숙소가 위시리스트에 등록되었습니다.");
	            } else {
	                icon.classList.remove('fa-regular', 'fa-heart');
	                icon.classList.add('fa-solid', 'fa-heart');
	                icon.style.color = 'red';
	                alert("위시리스트 삭제!");
	            }
	        },
	        error: function() {
	            alert("전송 오류!");
	        }
	    });
	}
	
	function fCheck() {
  		let address = searchForm.address.value.trim();
  		let checkIn = searchForm.checkIn.value;
  		let checkOut = searchForm.checkOut.value;
  		
  		if(address == "" && (checkIn == "" && checkOut == "")) {
  			alert("여행 지역 또는 예약 날짜를 입력하세요!");
  			return;
  		}
  		
  		searchForm.submit();
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
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>Stay</h2>
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
    </section>
    
    <c:if test="${not empty searchMsg}">
        <div class="alert alert-info text-center">
            ${searchMsg}
        </div>
        <p class="text-center"><input type="button" value="전체 숙소보기" onclick="location.href='StayList.st';" class="btn_1" />
    </c:if>
    
    <section id="portfolio" class="portfolio">
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
		                    <img src="${ctp}/images/stay/${sPhotos[0]}" class="img-fluid" alt="${curScrStartNo}.${vo.sName}" style="width:100%;height:300px;overflow:hidden;">
		                    <c:forEach var="sPhoto" items="${sPhotos}" varStatus="st">
		                        <a href="${ctp}/images/stay/${sPhoto}" data-gallery="${sPhotos}" class="link-preview portfolio-lightbox" title="사진 보기"><i class="fa-solid fa-plus"></i></a>
		                    </c:forEach>
			                <a type="button" onclick="wishToggle(${vo.sIdx})" class="link-wish" title="위시리스트 저장">
			                    <c:if test="${vo.isWished == 1}">
			                        <i id="wish-icon-${vo.sIdx}" class="fa-solid fa-heart" style="color:red;"></i>
			                    </c:if>
			                    <c:if test="${vo.isWished == 0}">
			                        <i id="wish-icon-${vo.sIdx}" class="fa-regular fa-heart" style="color:black;"></i>
			                    </c:if>
			                </a>
		                    <a href="StayDetail.st?sIdx=${vo.sIdx}" class="link-details" title="상세정보 보기"><i class="fa-solid fa-link"></i></a>
		                </figure>
						<div class="portfolio-info">
		                	<h4><a href="StayDetail.st?sIdx=${vo.sIdx}">${vo.sName}</a></h4>
		                	<p><h5>￦<fmt:formatNumber value="${vo.price}" pattern="#,##0" /><span style="font-size:13px;"> /박 (최대 ${vo.guestMax}명)</span></h5><p>
			                <p id="facility">
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
    </section>
</div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="fa-solid fa-arrow-up"></i></a>
<p><br/></p>
<%@ include file = "../../include/footer.jsp"%>
  <!-- Vendor JS Files -->
  <script src="${ctp}/js/stay/purecounter_vanilla.js"></script>
  <script src="${ctp}/js/stay/glightbox.min.js"></script>
  <script src="${ctp}/js/stay/isotope.pkgd.min.js"></script>
  <script src="${ctp}/js/stay/swiper-bundle.min.js"></script>
  <script src="${ctp}/js/stay/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="${ctp}/js/stay/main.js"></script>
</body>
</html>