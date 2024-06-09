<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Stay Detail</title>
    <%@ include file = "/include/bs4.jsp" %>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
		.mySlides {display: none}
		
    	/*--------------------------------------------------------------
		# Portfolio Details
		--------------------------------------------------------------*/
		.portfolio-details {
		  padding-top: 0;
		}
		
		.portfolio-details .portfolio-details-slider img {
		  width: 100%;
		}
		
		.portfolio-details .portfolio-details-slider .swiper-pagination {
		  margin-top: 20px;
		  position: relative;
		}
		
		.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet {
		  width: 12px;
		  height: 12px;
		  background-color: #fff;
		  opacity: 1;
		  border: 1px solid #3498db;
		}
		
		.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet-active {
		  background-color: #3498db;
		}
		
		.portfolio-details .portfolio-info {
		  padding: 30px;
		  box-shadow: 0px 0 30px rgba(56, 64, 70, 0.08);
		}
		
		.portfolio-details .portfolio-info h3 {
		  font-size: 22px;
		  font-weight: 700;
		  margin-bottom: 20px;
		  padding-bottom: 20px;
		  border-bottom: 1px solid #eee;
		}
		
		.portfolio-details .portfolio-info ul {
		  list-style: none;
		  padding: 0;
		  font-size: 15px;
		}
		
		.portfolio-details .portfolio-info ul li+li {
		  margin-top: 10px;
		}
		
		.portfolio-details .portfolio-description {
		  padding-top: 30px;
		}
		
		.portfolio-details .portfolio-description h2 {
		  font-size: 26px;
		  font-weight: 700;
		  margin-bottom: 20px;
		}
		
		.portfolio-details .portfolio-description p {
		  padding: 0;
		}
		
		/*--------------------------------------------------------------
		# Breadcrumbs
		--------------------------------------------------------------*/
		.breadcrumbs {
		  padding: 40px 0;
		  margin-top: 70px;
		}
		
		.breadcrumbs h2 {
		  font-size: 26px;
		  font-weight: 300;
		}
		
		.breadcrumbs ol {
		  display: flex;
		  flex-wrap: wrap;
		  list-style: none;
		  padding: 0;
		  margin: 0;
		  font-size: 15px;
		}
		
		.breadcrumbs ol li+li {
		  padding-left: 10px;
		}
		
		.breadcrumbs ol li+li::before {
		  display: inline-block;
		  padding-right: 10px;
		  color: #4f5a62;
		  content: "/";
		}
		
		@media (max-width: 768px) {
		  .breadcrumbs .d-flex {
		    display: block !important;
		  }
		
		  .breadcrumbs ol {
		    display: block;
		  }
		
		  .breadcrumbs ol li {
		    display: inline-block;
		  }
		}
		
	  	/* 별점 스타일 설정하기 */
	  	#commentForm fieldset {
	  		direction: rtl;  /* 오른쪽에서 왼쪽으로(아랍권) */
	  	}
	  	#commentForm input[type=radio] {
	  		display: none;  /* 안보이게 숨김 */
	  	}
	  	#commentForm label {
	  		font-size: 1.7em;
	  		color: transparent;
	  		text-shadow: 0 0 0 #f0f0f0;  /* 오른쪽 아래쪽 크기 */
	  	}
	  	#commentForm label:hover {
	  		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	  	}
	  	#commentForm label:hover ~ label {  /* ~ 흐름 앞의 레이블이 이어지는 곳에 적용하겠다 */
	  		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	  	}
	  	#commentForm input[type=radio]:checked ~ label {  /* 체크가 되어있는 곳에서 라벨까지 */
	  		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
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
		
		.portfolio-info {
		  grid-row-start: 1;
		  grid-row-end: 2;
		}
		
		.demo {
		    width: 100%;
		    height: 80px;
		    object-fit: cover;
		    cursor: pointer;
		}
		
		#paymentModal .row {
		  display: -ms-flexbox; /* IE10 */
		  display: flex;
		  -ms-flex-wrap: wrap; /* IE10 */
		  flex-wrap: wrap;
		  margin: 0 -16px;
		}
		
		.col-25 {
		  -ms-flex: 25%; /* IE10 */
		  flex: 25%;
		}
		
		.col-50 {
		  -ms-flex: 50%; /* IE10 */
		  flex: 50%;
		}
		
		.col-75 {
		  -ms-flex: 75%; /* IE10 */
		  flex: 75%;
		}
		
		.col-25,
		.col-50,
		.col-75 {
		  padding: 0 16px;
		}
		
		#paymentModal .container {
		  background-color: #f2f2f2;
		  padding: 5px 20px 15px 20px;
		  border: 1px solid lightgrey;
		  border-radius: 3px;
		}
		
		input[type=text] {
		  width: 100%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		#paymentModal label {
		  margin-bottom: 10px;
		  display: block;
		}
		
		#paymentModal .icon-container {
		  margin-bottom: 20px;
		  padding: 7px 0;
		  font-size: 24px;
		}
		
		#paymentModal .btn {
		  background-color: #04AA6D;
		  color: white;
		  padding: 12px;
		  margin: 10px 0;
		  border: none;
		  width: 100%;
		  border-radius: 3px;
		  cursor: pointer;
		  font-size: 17px;
		}
		
		#paymentModal .btn:hover {
		  background-color: #45a049;
		}
		
		span.price {
		  float: right;
		  color: grey;
		}
		
		/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (and change the direction - make the "cart" column go on top) */
		@media (max-width: 800px) {
		  .row {
		    flex-direction: column-reverse;
		  }
		  .col-25 {
		    margin-bottom: 20px;
		  }
		}
    </style>
    <script>
    	'use strict';
    	
    	$(function() {
			$("#datepicker_1").datepicker({
			  dateFormat: 'yy-mm-dd',
			  minDate: 0,
			  onSelect: function(dateText, inst) {
			    var date = $(this).datepicker('getDate');
			    date.setDate(date.getDate() + 1);
			    $("#datepicker_2").datepicker("option", "minDate", date);
			  }
			});
			
			$("#datepicker_2").datepicker({
			  dateFormat: 'yy-mm-dd',
			  minDate: +1,
			  beforeShow: function(input, inst) {
			    var date = $("#datepicker_1").datepicker('getDate');
			    if (date) {
			      date.setDate(date.getDate() + 1);
			      $(this).datepicker('option', 'minDate', date);
			    }
			  }
			});
		});
    	  
        function openPaymentModal() {
            $('#paymentModal').modal('show');
        }
		
	  	// 별점/리뷰평가 등록하기
 	  	function reviewCheck() {
	  		let star = starForm.star.value;
	  		let review = $("#review").val();
	  		if(star == "") {
	  			alert("별점을 부여해 주세요");
	  			location.reload();
	  		}
	  		
	  		let query = {
	  				part : 'stay',
	  				mid : '${sMid}',
	  				nickName : '${sNickName}',
	  				star : star,
	  				review : review
	  		}
	  		
	  		$.ajax({
	  			url : "ReviewInputOk.ad",
	  			type : "post",
	  			data : query,
	  			success:function(res) {
	  				alert(res);
	  				location.reload();
	  			},
	  			error : function() {
	  				alert("전송오류!");
	  			}
	  		});
	  	}
	  	
	  	// 리뷰 삭제하기
 	  	function reviewDelete(idx) {
	  		let ans = confirm("리뷰를 삭제하시겠습니까?");
	  		if(!ans) return false;
	  		
	  		$.ajax({
	  			url : "ReviewDelete.ad",
	  			type : "post",
	  			data : {idx : idx},
	  			success:function(res) {
	  				if(res != "0") {
		  				alert("리뷰가 삭제되었습니다.");
		  				location.reload();
	  				}
	  				else alert("리뷰 삭제 실패~~");
	  			},
	  			error : function() {
	  				alert("전송오류!");
	  			}
	  		});
	  	}
	  	
	  	function stayDiscontinue() {
	  		let ans = confirm("숙소 게시글을 비공개 처리하시겠습니까?");
	  		if(ans) location.href = "StayDiscontinue.st?sIdx=${vo.sIdx}";
	  	}
	  	
		
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container">
	<div class="w3-hide-large" style="margin-top:80px"></div>
	<div class="w3-container" id="apartment">
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
        	<h2 class="w3-text-green">${vo.sName}</h2>
          <ol>
            <li><a href="${ctp}/Main">Home</a></li>
            <li>Stay Details</li>
          </ol>
        </div>
      </div>
    </section>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
	
	  <!-- Push down content on small screens -->
	  <div class="w3-hide-large" style="margin-top:80px"></div>
    
	<div class="w3-container">
	    <!-- 이미지 리스트 설정 -->
	    <c:set var="sPhotos" value="${fn:split(vo.sPhoto, '/')}"/>
	
	    <!-- 각 이미지를 슬라이드로 표시 -->
	    <c:forEach var="sPhoto" items="${sPhotos}" varStatus="st">
	        <div class="w3-display-container mySlides text-center">
	            <img src="${ctp}/images/stay/${sPhoto}" style="width:90%;margin-bottom:-6px"">
	            <div class="w3-display-bottomleft w3-container w3-black">
	                <p>Image ${st.index + 1} of ${fn:length(sPhotos)}</p>
	            </div>
	        </div>
	    </c:forEach>
	    <!-- 썸네일 표시 -->
	    <div class="w3-row-padding w3-section">
	        <c:forEach var="sPhoto" items="${sPhotos}" varStatus="st">
	            <div class="w3-col s3">
	                <img class="demo w3-opacity w3-hover-opacity-off" src="${ctp}/images/stay/${sPhoto}" style="width:100%;cursor:pointer" onclick="currentDiv(${st.index + 1})" title="Image ${st.index + 1}">
	            </div>
	        </c:forEach>
	    </div>
	</div>

  <div class="w3-container">
  	<div class="w3-row-padding">
  	<div class="w3-col m5 portfolio-info" style="max-width:400px;">
	  <h3>예약</h3>
	  <form name="bookingForm" method="post" action="StayBooking.st?sIdx=${vo.sIdx}">
	    <div class="form_colum">
        <label><i class="fa fa-calendar-o"></i> Check In</label>
        <input class="w3-input w3-border mb-2" id="datepicker_1" placeholder="Check in date" name="CheckIn" required>
      </div>
	    <div class="form_colum">
        <label><i class="fa fa-calendar-o"></i> Check Out</label>
        <input class="w3-input w3-border mb-2" id="datepicker_2" placeholder="Check out date" name="CheckOut" required>
      </div>
	    <div class="form_colum">
        <label><i class="fa fa-male"></i> Guest</label>
        <input class="w3-input w3-border mb-2" type="number" value="1" name="guestNum" min="1" max="${vo.guestMax}">
      </div>
	    <div class="form_colum">
        <label style="font-size: 1.3em;font-weight: bold;"><i class="fa fa-money"></i> 가격 : ￦${vo.price} 원 / 1박</label>
      </div>
	  <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-search w3-margin-right"></i> 숙소 예약하기</button>
	  <input type="hidden" name="price" value="${vo.price}">
    </form>
	</div>
	<hr>
	<div>
	    <c:if test="${isBookingOk}">
	        <button onclick="openPaymentModal()" class="btn btn-primary">결제하기</button>
	    </c:if>
	    <c:if test="${!isBookingOk}">
	        <p class="text-danger">${message}</p>
	    </c:if>
	</div>
  	<div class="w3-col m7">
	    <div class="w3-row">
    	<h4><strong>The space</strong></h4>
	      <div class="w3-col m6">
	        <p><i class="fa fa-fw fa-male"></i> Max people: ${vo.guestMax}</p>
	        <p><i class="fa fa-fw fa-bath"></i> Bathrooms: ${fVo.toilet}</p>
	        <p><i class="fa fa-fw fa-bed"></i> Bedrooms: ${fVo.bed}</p>
	      </div>
	      <div class="w3-col m5 ">
	        <p><i class="fa fa-fw fa-clock-o"></i> Check In: After 3PM</p>
	        <p><i class="fa fa-fw fa-clock-o"></i> Check Out: 11AM</p>
	      </div>
	    </div>
	    <hr>
	    <div class="w3-row">
    	<h4><strong>Amenities</strong></h4>
	      <div class="w3-col m6">
	        <p><c:if test="${fVo.wifi == 'OK'}"><i class="fa fa-fw fa-wifi"></i> WiFi</c:if></p>
	        <p><c:if test="${fVo.ac == 'OK'}"><i class="material-icons">ac_unit</i> A/C</c:if></p>
	        <p><c:if test="${fVo.parking == 'OK'}"><i class="material-icons">local_parking</i> Parking</c:if></p>
	      </div>
	      <div class="w3-col m5">
	      	<span class="w3-margin-top"></span>
	        <p><c:if test="${fVo.pet == 'OK'}"><i class='fas fa-fw fa-dog'></i> Pet</c:if></p>
	        <p><c:if test="${fVo.kitchen == 'OK'}"><i class="fa fa-fw fa-cutlery"></i> Kitchen</c:if></p>
	        <p><c:if test="${fVo.washing == 'OK'}"><i class="material-icons">local_laundry_service</i> Washing machine</c:if></p>
	      </div>
    </div>
    </div>

    </div>
  </div>
    <hr>
     <div class="w3-container">
    <h4><strong>숙소 설명</strong></h4><br>
    <p>${fn:replace(vo.sContent, newLine, "<br/>")}</p><br>
    <p>결제가능 수단: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-paypal w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
    <hr>
    <div class="d-sm-flex justify-content-between">
	    <div class="col-sm-7">
		    <h4><strong>정책</strong></h4>
		    <i class="fa fa-map-marker" style="width:30px"></i> ${vo.sort}<br>
		    <p>자세한 주소는 예약 후에 공개됩니다.</p>
	    </div>
	    <div class="col-sm-5">
		    <p class="mb-3" style="font-size: 20px;"><b>리뷰평점 : <fmt:formatNumber value="${reviewAvg}" pattern="#,##0.0" /></b></p>
		    <p class="like-info"><span class="align-middle"><i class="far fa-heart"></i></span> Lily and 4 people like this</p>
	    </div>
    </div>
  </div>
  <hr>
<p><br/></p>
	<div class="navigation-top">
		<div class="comments-area">
            <h4>Review</h4>
        	<c:if test="${empty rVos}"><p class="text-center">아직 댓글이 없습니다. 숙소에 대한 댓글을 남겨주세요.</p></c:if>
        	<c:if test="${!empty rVos}">
        	<c:set var="imsiIdx" value="0" />
        	<c:forEach var="rVo" items="${rVos}" varStatus="st">
        	<c:if test="${imsiIdx != vo.idx}">
            <div class="comment-list">
                <div class="single-comment justify-content-between d-flex">
                    <div class="user justify-content-between d-flex">
                        <div class="thumb">
                            <img src="${ctp}/images/member/${memVo.userInfo == '공개' ? memVo.photo : noImage.jpg}">
                        </div>
                        <div class="desc">
                            <p class="comment">
                                ${fn:replace(rVo.content, newLine, '<br/>')}
                            </p>
                            <div class="d-flex justify-content-between">
                                <div class="d-flex align-items-center">
                            <h5>
                               <a href="#">${rVo.nickName}</a>
                            </h5>
                                    <p class="date">${rVo.mid}</p>
                                    <c:if test="${rVo.mid == sMid || sMid == 'admin'}"><p><a href="javascript:reviewDelete(${rVo.rIdx})" title="리뷰삭제" class="badge badge-danger">x</a></p></c:if>
                                </div>
                                <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
            </c:forEach>
            </c:if>
        </div>
	    <c:if test="${sMid != null}">
	    <div class="comment-form">
            <h4>댓글 작성하기</h4>
            <form class="comment_form" action="#" id="commentForm">
            	<fieldset style="border:0px;">  <!-- 별점자리 영역으로 지정 // border 0으로 흔적 삭제 -->
		  			<div class="viewPoint m-0 b-0">  <!-- margin때문에 별이 밀려서 0으로 설정 -->
		  				<input type="radio" name="star" value="5" id="star1"><label for="star1">★</label>  <!-- 원래 label 먼저 썼는데 right to left를 위해 오른쪽부터니까 5점부터 -->
		  				<input type="radio" name="star" value="4" id="star2"><label for="star2">★</label>
		  				<input type="radio" name="star" value="3" id="star3"><label for="star3">★</label>
		  				<input type="radio" name="star" value="2" id="star4"><label for="star4">★</label>
		  				<input type="radio" name="star" value="1" id="star5"><label for="star5">★</label>  <!-- rtl로 바꿨기 때문에 반대로 읽는 것 // 맨 앞의 별 -->
		  				: 별점을 남겨주세요
		  			</div>
		  		</fieldset>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
						    <p>작성자 아이디</p>
                            <input class="form-control" name="mid" type="text" value="${sMid}" readonly>
                        </div>
                    </div>
                    <div class="col-sm-6">
						<div class="form-group">
						    <p>숙소 예약 목적(지역 경제 지원 예산 편성을 위한 데이터로만 활용됩니다.)</p>
						    <select class="form-control" id="purpose" name="purpose">
						        <option value="">선택안함</option>
						        <option value="parents">부모님 예약</option>
						        <option value="leisure">레저</option>
						        <option value="festival">지역축제</option>
						        <option value="meeting">모임</option>
						        <option value="soloTravel">홀로여행</option>
						        <option value="travelWithFriends">지인과 여행</option>
						    </select>
						</div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <textarea class="form-control w-100" name="rContent" id="rContent" cols="30" rows="5" placeholder="숙소에 대한 평가를 남겨주세요"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="button" value="입력" onclick="reviewCheck()" class="button button-contactForm btn_1">
                </div>
            </form>
        </div>
        </c:if>
	</div>
</div>
</div>
<p><br/></p>

<div id="paymentModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">결제하기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <div class="container">
          <form action="StayBookingOk.st">
        	<div class="row">
	          <div class="col-50">
	            <h3>결제 정보</h3>
	            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
	            <input type="text" id="fname" name="firstname" placeholder="John M. Doe">
	            <label for="email"><i class="fa fa-envelope"></i> Email</label>
	            <input type="text" id="email" name="email" placeholder="john@example.com">
	            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
	            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
	            <label for="city"><i class="fa fa-institution"></i> City</label>
	            <input type="text" id="city" name="city" placeholder="New York">
	            <div class="row">
	              <div class="col-50">
	                <label for="state">State</label>
	                <input type="text" id="state" name="state" placeholder="NY">
	              </div>
	              <div class="col-50">
	                <label for="zip">Zip</label>
	                <input type="text" id="zip" name="zip" placeholder="10001">
	              </div>
	            </div>
	          </div>
	          <div class="col-50">
	            <h3>Payment</h3>
	            <label for="fname">Accepted Cards</label>
	            <div class="icon-container">
	              <i class="fa fa-cc-visa" style="color:navy;"></i>
	              <i class="fa fa-cc-paypal" style="color:blue;"></i>
	              <i class="fa fa-cc-mastercard" style="color:red;"></i>
	              <i class="fa fa-cc-jcb" style="color:orange;"></i>
	            </div>
	            <label for="cname">Name on Card</label>
	            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
	            <label for="ccnum">Credit card number</label>
	            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
	            <label for="expmonth">Exp Month</label>
	            <input type="text" id="expmonth" name="expmonth" placeholder="September">
	            <div class="row">
	              <div class="col-50">
	                <label for="expyear">Exp Year</label>
	                <input type="text" id="expyear" name="expyear" placeholder="2018">
	              </div>
	              <div class="col-50">
	                <label for="cvv">CVV</label>
	                <input type="text" id="cvv" name="cvv" placeholder="352">
	              </div>
	            </div>
	          </div>
        	</div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </label>
        <input type="submit" value="Continue to checkout" class="btn">
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Cart
        <span class="price" style="color:black">
          <b>요금 세부정보</b>
        </span>
      </h4>
      <p><a href="#">숙소정보</a> <span class="price">${vo.sName}</span></p>
      <p><a href="#">${vo.star}</a> <span class="price">(후기 개)</span></p>
      <p><a href="#">${vo.price}*${ckeckout - ckeckin}박</a> <span class="price">${vo.price*(ckeckout-ckeckin)}</span></p>
      <p><a href="#">청소비</a> <span class="price">${vo.price*(ckeckout-ckeckin)}*0.05</span></p>
      <hr>
      <p>총 합계(KRW) <span class="price" style="color:black"><b>${vo.price*(ckeckout-ckeckin)}+${vo.price*(ckeckout-ckeckin)}*0.05</b></span></p>
    </div>
  </div>
</div>
</div>
</div>
<jsp:include page="/include/footer.jsp" />
<script>
// Script to open and close sidebar when on tablets and phones
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Slideshow Apartment Images
	var slideIndex = 1;
	showDivs(slideIndex);
	
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	
	function currentDiv(n) {
	  showDivs(slideIndex = n);
	}
	
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  if (n > x.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
	  }
	  x[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " w3-opacity-off";
	}
</script>
</body>
</html>