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
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <style>
		.mySlides {display: none}
		
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
    	
    	window.onload = function() {
    	    if (${sMid == null || sMid == ""}) {
    	        ['checkInInput', 'checkOutInput', 'guestNumInput'].forEach(id => {
    	            let e = document.getElementById(id);
    	            if (e) {
    	                e.addEventListener('click', function() {
    	                    alert("로그인 이후에 해당 숙소에 대한 예약이 가능합니다.\n로그인 페이지로 이동합니다!");
    	                    location.href = "MemberLogin.mem";
    	                });
    	            }
    	        });
    	    }

            document.getElementById('paymentBtn').addEventListener('click', function() {
                $('#bookingCheckModal').modal('hide');
                $('#paymentModal').modal('show');
            });
        }
    	
        function checkBooking() {
            let sIdx = ${vo.sIdx};
            let checkIn = bookingForm.checkIn.value;
            let checkOut = bookingForm.checkOut.value;
            let guestNum = bookingForm.guestNum.value.trim();
            let price = ${vo.price};
            
            if (${sMid == null || sMid == ""}) {
                alert("로그인 이후에 해당 숙소에 대한 예약이 가능합니다.\n로그인 페이지로 이동합니다!");
                location.href = "MemberLogin.mem";
                return;
            }
            else if(checkIn == "" || checkOut == "") {
				alert("예약 날짜를 입력하세요!");
				return;
			}
			else if(guestNum > ${vo.guestMax}) {
				alert("최대 인원 수를 초과하셨습니다!");
				return;
			}
			
            $.ajax({
                url: "StayBooking.st",
                type: "post",
                data: {
                    sIdx: sIdx,
                    checkIn: checkIn,
                    checkOut: checkOut,
                    guestNum: guestNum,
                    price: price
                },
                success: function(response) {
                	let res = response.split(",");
                	if (res[0] == "OK") {
                		alert('예약 내용을 정확히 입력하셨나요? \n확인 후에 결제창으로 이동합니다.');
                		let totalPrice = res[1];
                        $('#totalPriceCheck').text('￦' + totalPrice + ' 원');
                        $('#checkInCheck').text(checkIn);
                        $('#checkOutCheck').text(checkOut);
                        $('#guestNumCheck').text(guestNum);
                        $('#checkInPayment').val(checkIn);
                        $('#checkOutPayment').val(checkOut);
                        $('#guestNumPayment').val(guestNum);
                        $('#totalPayment').val(totalPrice);
                        $('#totalStr').text('￦' + totalPrice + ' 원');
                        $('#bookingCheckModal').modal('show');
                    } 
                    else {
                        alert(res[1]);
                    }
                },
                error: function() {
                    alert("서버 오류!");
                }
            });
        }
	  	
	  	// 리뷰 삭제하기
 	  	function reviewDelete(rIdx) {
	  		let ans = confirm("리뷰를 삭제하시겠습니까?");
	  		if(!ans) return false;
	  		
	  		$.ajax({
	  			url : "ReviewDelete.ad",
	  			type : "post",
	  			data : {rIdx : rIdx},
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
 	  	    let ans = confirm("해당 숙소를 비공개 처리하시겠습니까?");
 	  	    if(ans) {
 	  	        $.ajax({
 	  	            url: "StayDiscontinue.st",
 	  	            type: "post",
 	  	            data: { sIdx: ${vo.sIdx} },
 	  	            success: function(res) {
 	  	                if (res.trim() == "OK") {
 	  	                    alert("숙소를 비공개 처리되었습니다.");
 	  	                    document.getElementById("checkBookingBtn").disabled = true;
 	  	                    document.getElementById("checkBookingBtn").innerText = "예약 불가";
 	  	                } else {
 	  	                    alert("숙소 비공개 처리에 실패했습니다.");
 	  	                }
 	  	            },
 	  	            error: function() {
 	  	                alert("전송오류");
 	  	            }
 	  	        });
 	  	    }
 	  	}
	  	
 	  	function wishToggle(sIdx) {
 	  	    $.ajax({
 	  	        url: "StayWishToggle.st",
 	  	        type: "post",
 	  	        data: { sIdx: sIdx },
 	  	        success: function(res) {
 	  	            let icon = document.getElementById("wish-icon-" + sIdx);
 	  	            let wishCnt = document.getElementById("wishCnt");
 	  	            if (res.trim() == "true") {
 	  	                alert("해당 숙소를 위시리스트에서 제거하였습니다.");
 	  	                icon.classList.remove('fa-solid', 'fa-heart');
 	  	                icon.classList.add('fa-regular', 'fa-heart');
 	  	             	wishCnt.textContent = parseInt(wishCnt.textContent) - 1;
 	  	            } else {
 	  	                alert("해당 숙소를 위시리스트에 추가하였습니다.");
 	  	                icon.classList.remove('fa-regular', 'fa-heart');
 	  	                icon.classList.add('fa-solid', 'fa-heart');
 	  	                icon.style.color = 'red';
 	  	             	wishCnt.textContent = parseInt(wishCnt.textContent) + 1;
 	  	            }
 	  	        },
 	  	        error: function() {
 	  	            alert("전송 오류!");
 	  	        }
 	  	    });
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
        	<h2 class="w3-text-light-green" style="font-size:30px;font-weight:bolder;">${vo.sName}&nbsp;&nbsp;
        	<c:if test="${sMid == 'admin'}"><!-- <a href="'StayUpdate.st';" class="btn btn-outline-warning btn-sm mr-2">수정하기</a> -->
        	<a href="javascript:stayDiscontinue()" class="btn btn-outline-danger btn-sm">판매중지</a></c:if></h2>
			<ol>
				<li><a href="${ctp}/Main">Home</a></li>
				<li><a href="StayList.st">Stay List</a></li>
				<li>Stay Details</li>
			</ol>
        </div>
    	<p class="like-info"><a type="button" onclick="wishToggle(${vo.sIdx})" class="link-wish" title="위시리스트 저장">
            <c:if test="${vo.isWished == 1}">
                <i id="wish-icon-${vo.sIdx}" class="fa-solid fa-heart" style="color:red;"></i>
            </c:if>
            <c:if test="${vo.isWished == 0}">
                <i id="wish-icon-${vo.sIdx}" class="fa-regular fa-heart" style="color:black;"></i>
            </c:if>
    	</a> [<span id="wishCnt">${vo.wishCnt}</span>]명의 사람들이 이 숙소를 위시리스트에 저장했습니다</p>
      </div>
    </section>

	<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
	
	  <div class="w3-hide-large" style="margin-top:80px"></div>
    
	<div class="w3-container">
	    <c:set var="sPhotos" value="${fn:split(vo.sPhoto, '/')}"/>
	
	    <c:forEach var="sPhoto" items="${sPhotos}" varStatus="st">
	        <div class="w3-display-container mySlides text-center">
	            <img src="${ctp}/images/stay/${sPhoto}" style="width:90%;margin-bottom:-6px">
	            <div class="w3-display-bottomleft w3-container w3-black">
	                <p>Image ${st.index + 1} of ${fn:length(sPhotos)}</p>
	            </div>
	        </div>
	    </c:forEach>
	    
	    <div class="w3-row-padding w3-section">
	        <c:forEach var="sPhoto" items="${sPhotos}" varStatus="st">
	            <div class="w3-col s3">
	                <img class="demo w3-opacity w3-hover-opacity-off" src="${ctp}/images/stay/${sPhoto}" style="width:100%;cursor:pointer" onclick="currentDiv(${st.index + 1})" title="Image ${st.index + 1}">
	            </div>
	        </c:forEach>
	    </div>
	</div>

    <hr>
  <div class="w3-container">
  	<div class="w3-row-padding">
  	
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
	<div class="w3-col m5 portfolio-info" style="max-width:400px;">
  		<form name="bookingForm" method="post">
	    	<div class="form_colum">
	        	<label><i class="fa fa-calendar-o"></i> Check In</label>
	        	<input class="w3-input w3-border mb-2" id="datepicker_1" placeholder="Check in" id="checkInInput" name="checkIn" required>
      		</div>
	    	<div class="form_colum">
		        <label><i class="fa fa-calendar-o"></i> Check Out</label>
		        <input class="w3-input w3-border mb-2" id="datepicker_2" placeholder="Check out" id="checkOutInput" name="checkOut" required>
      		</div>
	    	<div class="form_colum">
		        <label><i class="fa fa-male"></i> Guest (미취학 아동 제외)</label>
		        <input class="w3-input w3-border mb-2" type="number" value="1" id="guestNumInput" name="guestNum" min="1" max="${vo.guestMax}" required>
        	</div>
		    <div class="form_colum">
	        	<label style="font-size: 1.3em;font-weight: bold;"> ￦ <fmt:formatNumber value="${vo.price}" pattern="#,##0" /> 원 <span style="font-size:0.8em;font-weight:500;">/박</span></label>
	      	</div>
	  		<button class="w3-button w3-right w3-red mt-2" id="checkBookingBtn" onclick="checkBooking()"><i class="fa fa-search w3-margin-right"></i> 숙소 예약하기</button>
    	</form>
	</div>
</div>
</div>
    <hr>
     <div class="w3-container">
     <div class="w3-row">
     	<div class="col">
		    <h4><strong>숙소 설명</strong></h4><br>
		    <p style="color:#162b45;">${fn:replace(vo.sContent, newLine, "<br/>")}</p><br>
		    <p><span style="color:#162b45;font-weight:bold;"> - 결제가능 수단</span> : <i class="fa fa-credit-card w3-large"></i> | <i class="fa fa-cc-mastercard w3-large"></i> | <i class="fa fa-cc-paypal w3-large"></i> | <i class="fa fa-cc-visa w3-large"></i></p>
    	</div>
    </div>
    <hr>
    <div class="d-sm-flex justify-content-between">
	    <div class="col-sm-5">
		    <h4><strong>숙소 운영 정책</strong></h4>
		    <br>
			<h5><i class="fa fa-map-marker" style="width:30px"></i>대한민국, ${stayVo.residence == 'Chung' ? '충청도' : stayVo.residence == 'Gang' ? '강원도' : stayVo.residence == 'Jeol' ? '전라도' : '경상도'}</h5>
    		&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-check"></i> &nbsp;${vo.sort}
			<p><br></p>
		    <p>자세한 주소는 예약 후에 공개됩니다.</p>
	    </div>
	    <div class="col-sm-7">
	    	<p><br><p>
		    <p style="color:#162b45;"><span style="font-size:1.1em;font-weight:bold;">예약 취소</span>는 체크인 날짜로부터 <span style="font-size:1.1em;font-weight:bold;">'3일 전'</span>까지 가능합니다.<br>
		    이후에는 취소가 불가능하니, 참조 부탁드립니다.<br>
		    아울러 숙소에 대해 궁금한 점이 있다면,<br>
		    저희 카카오톡 채널이나 홈페이지 메시지로 남겨주세요<br>
		    더 좋은 서비스로 보답하겠습니다.<br>
		    감사합니다!! <i class="fa-regular fa-face-smile"></i><br>
		    <br>
		    <span class="w3-right mr-5">- Serene nest 일동 올림 -</span>
		    </p>
	    </div>
    </div>
	<div class="navigation-top">
		<div class="comments-area">
			<div class="d-flex justify-content-between">
            	<h3 style="font-weight:bold;">&nbsp;&nbsp;Review</h3>
            	<p class="mb-3 mr-2" style="font-size: 20px;" style="float:right;"><b>리뷰평점 : <fmt:formatNumber value="${reviewAvg}" pattern="#,##0.0" /></b>&nbsp;&nbsp;&nbsp;&nbsp;</p>
            </div>
        	<c:if test="${empty rVos}"><p class="text-center">아직 숙소에 대한 리뷰가 없습니다.<br>예약 완료 후, 다른 분들을 위해 리뷰를 남겨주세요.</p></c:if>
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
	</div>
	<hr>
</div>
</div>
</div>
<p><br/></p>
<div id="bookingCheckModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">예약 내용 확인</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
            	<ul>
		      <li><p>숙소정보 : ${vo.sName}</p></li>
		      <li><p>check In : <span id="checkInCheck"></span></p></li>
		      <li><p>check Out : <span id="checkOutCheck"></span></p></li>
		      <li><p>숙박인원 : <span id="guestNumCheck"></span> 인</p></li>
		      <li><p>1박요금 : ￦ <fmt:formatNumber value="${vo.price}" pattern="#,##0" /> 원</p></li>
		      <li><p>청소비 : ￦ <fmt:formatNumber value="${vo.price*0.1}" pattern="#,##0" /> 원</p></li>
		      </ul>
		      <hr>
		      <p>총 합계(KRW) : <b><span id="totalPriceCheck"></span></b></p>
		      <hr>
		      <div class="text-center">
                <a type="button" id="paymentBtn" class="btn btn-success mr-2">결제하기</a>
                <a type="button" data-dismiss="modal" class="btn btn-warning">취소</a>
              </div>
            </div>
        </div>
    </div>
</div>

<div id="paymentModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Credit Card</h4>
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
		          <input type="checkbox" checked="checked" name="sameadr"> 결제 정보 저장하기
		        </label>
				<p><input type="submit" value="숙소 예약하기" class="btn"></p>
		        <input type="hidden" value="${vo.sIdx}" name="sIdx" />
		        <input type="hidden" id="checkInPayment" name="checkInPayment" />
		        <input type="hidden" id="checkOutPayment" name="checkOutPayment" />
		        <input type="hidden" id="guestNumPayment" name="guestNumPayment" />
		        <input type="hidden" id="totalPayment" name="totalPayment" />
      		</form>
    	</div>
	</div>
    	<div class="container">
			<div class="col-25">
		      <h4>KRW
		        <span class="price">
		          <b>결제 요금(원)</b>
		        </span>
		      </h4>
	    	</div>
			<div class="col-25">
		      <h4><span class="badge badge-info">쿠폰 등록하기</span>
		      	<b><span class="price" id="totalStr"></span></b>
		      </h4>
			</div>
		</div>
	</div>
</div>
</div>
<jsp:include page="/include/footer.jsp" />
<script>
	// 이미지 슬라이드
	function w3_open() {
	  document.getElementById("mySidebar").style.display = "block";
	  document.getElementById("myOverlay").style.display = "block";
	}
	 
	function w3_close() {
	  document.getElementById("mySidebar").style.display = "none";
	  document.getElementById("myOverlay").style.display = "none";
	}

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