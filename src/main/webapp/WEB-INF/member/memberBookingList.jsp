<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    LocalDate today = LocalDate.now();
    request.setAttribute("today", today.toString());
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1.0">
	<title>Member Booking</title>
	<%@ include file = "../../include/bs4.jsp"%>
  	<link href="${ctp}/setting/css/admin/style.min.css" rel="stylesheet">
	<style>
		@font-face {
		    font-family: 'Electrical Safety Bold';
		    src: url('setting/fonts/Electrical Safety Bold.ttf') format('truetype');
		}
	
		body {font-family: 'Electrical Safety Bold', Arial, Helvetica, sans-serif;}
		* {box-sizing: border-box;}
		
	  	/* 별점 스타일 설정하기 */
	  	#commentForm fieldset {
	  		direction: rtl;
	  	}
	  	#commentForm input[type=radio] {
	  		display: none;
	  	}
	  	#commentForm label {
	  		font-size: 1.7em;
	  		color: transparent;
	  		text-shadow: 0 0 0 #f0f0f0;
	  	}
	  	#commentForm label:hover {
	  		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	  	}
	  	#commentForm label:hover ~ label {
	  		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	  	}
	  	#commentForm input[type=radio]:checked ~ label {
	  		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	  	}
	</style>
	<script>
		'use strict';
		
		function setReviewModal(sIdx, bIdx) {
		    document.getElementById('sIdx').value = sIdx;
		    if (bIdx) {
		        document.getElementById('bIdx').value = bIdx;
		    } else {
		        document.getElementById('bIdx').value = '';
		    }
		}

		function reviewCheck() {
		    let sIdx = document.getElementById('sIdx').value;
		    let bIdx = document.getElementById('bIdx').value;
		    let star = document.querySelector('input[name="star"]:checked').value;
		    let review = $("#rContent").val();
		    let purpose = $("#purpose").val();
		    
		    if (star == "") {
		        alert("숙소에 대한 별점을 부여해 주세요");
		        return;
		    }

		    if (review.trim() == "") {
		        alert("리뷰를 작성해 주세요");
		        return;
		    }

		    let query = {
		        part: 'stay',
		        partIdx: sIdx,
		        mid: '${sMid}',
		        nickName: '${sNickName}',
		        star: star,
		        review: review,
		        purpose : purpose
		    };

		    if (bIdx) {
		        query.bIdx = bIdx;
		    }

		    $.ajax({
		        url: "ReviewInputOk.ad",
		        type: "post",
		        data: query,
		        success: function(res) {
		            alert(res);
		            $('#reviewModal').modal('hide');
		            if (bIdx) {
		                $('button[data-id="' + bIdx + '"]').closest('td').text('종료된 예약');
		            }
		            location.reload();
		        },
		        error: function() {
		            alert("전송오류!");
		        }
		    });
		}
		
	  	$(document).ready(function(){
	  	    $('.open-modal').click(function(){
	  	        let bookingData = $(this).data('booking');
	  	        $('#sName').text(bookingData.sName);
	  	        $('#checkInCheck').text(bookingData.checkIn);
	  	        $('#checkOutCheck').text(bookingData.checkOut);
	  	        $('#guestNumCheck').text(bookingData.guestNum + '명');
	  	        $('#totalPriceCheck').text('￦' + bookingData.totalPrice + ' 원');
	  	        $('#detailLink').attr('href', 'StayDetail.st?sIdx=' + bookingData.sIdx);
	  	        $('#bookingCheckModal').modal('show');
	  	    });
	  	});
	</script>
</head>
<body>
<%@ include file = "../../include/header.jsp"%>
<%@ include file = "../../include/nav.jsp"%>
<div class="container">
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper">
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberMain.mem" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">마이페이지</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberUpdate.mem" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">내 정보 수정</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberBookingList.mem" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">예약 내역</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberWish.mem" aria-expanded="false"><i class="mdi mdi-border-inside"></i><span class="hide-menu">위시리스트</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberComplaint.mem" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu">문의/신고 글</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberMessage.ad" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu">메시지 내역</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberDelete.mem" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu" style="color:orange;">회원탈퇴</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>
     	<div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">예약내역</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb" style="background-color:white;">
                                    <li class="breadcrumb-item" style="background-color:white;"><a href="${ctp}/Main">Home</a></li>
		                            <li class="breadcrumb-item active" aria-current="page" style="background-color:white;">마이페이지</li>
                                    <li class="breadcrumb-item active" aria-current="page" style="background-color:white;">예약내역</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <p><br><p>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                            	<h2 class="card-title m-b-0 text-center">숙소 예약 확인</h2>
                            </div>
                            <table class="table">
                                  <thead>
                                    <tr>
                                      <th scope="col">예약일</th>
                                      <th scope="col">숙소정보</th>
                                      <th scope="col">숙박날짜</th>
                                      <th scope="col">숙박인원</th>
                                      <th scope="col">총금액</th>
                                      <th scope="col">예약상태</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                  	<c:forEach var="vo" items="${vos}" varStatus="st">
									    <tr>
									        <th scope="row">${fn:substring(vo.bDate,0,16)}</th>
									        <td>
									            <a href="#" class="open-modal" data-booking='{"sName": "${vo.sName}", "checkIn": "${fn:substring(vo.checkIn,0,10)}", "checkOut": "${fn:substring(vo.checkOut,0,10)}", "guestNum": "${vo.guestNum}", "totalPrice": "${vo.total}", "sIdx": "${vo.sIdx}"}'>
									                ${vo.sName}
									            </a>
									        </td>
									        <td>${fn:substring(vo.checkIn,2,10)} ~ ${fn:substring(vo.checkOut,2,10)}</td>
									        <td>${vo.guestNum}명</td>
									        <td><fmt:formatNumber value="${vo.total}" pattern="#,##0" />원</td>
									        <td>
									            <c:choose>
									                <c:when test="${vo.status == 'OK'}">
									                    <c:choose>
									                        <c:when test="${fn:substring(vo.checkOut,0,10) lt today}">
									                            <button class="btn btn-success" data-toggle="modal" data-target="#reviewModal" data-id="${vo.bIdx}" onclick="setReviewModal(${vo.sIdx}, ${vo.bIdx})">예약 완료</button>
									                        </c:when>
									                        <c:when test="${vo.date_diff <= -3}">
									                            <a href="BookingCancel.st?bIdx=${vo.bIdx}" class="btn btn-danger">예약 취소</a>
									                        </c:when>
									                        <c:otherwise>
									                            예약 취소 불가
									                        </c:otherwise>
									                    </c:choose>
									                </c:when>
									                <c:when test="${vo.status == 'NO'}">
									                    취소된 예약
									                </c:when>
									                <c:when test="${vo.status == 'DONE'}">
									                    종료된 예약
									                </c:when>
									            </c:choose>
									        </td>
									    </tr>
									</c:forEach>
                                  </tbody>
                            </table>
                        </div>
                    </div>
                 </div>
                 <!-- 페이징 처리 -->
                <nav class="blog-pagination justify-content-center d-flex">
                    <ul class="pagination">
					<c:if test="${pag > 1}"><li class="page-item"><a class="page-link" href="${ctp}/MemberBookingList.mem?part=${part}&pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
					<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link" href="${ctp}/MemberBookingList.mem?part=${part}&pag=${(curBlock*blockSize+1)-blockSize}&pageSize=${pageSize}"><i class="ti-angle-left"></i></a></li></c:if>
					<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
						<c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link" href="${ctp}/MemberBookingList.mem?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
						<c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link" href="${ctp}/MemberBookingList.mem?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
					</c:forEach>
					<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link" href="${ctp}/MemberBookingList.mem?part=${part}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}"><i class="ti-angle-right"></i></a></li></c:if>
					<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link" href="${ctp}/MemberBookingList.mem?part=${part}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
                    </ul>
                </nav>
             </div>
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
                  <li><p>숙소정보 : <span id="sName"></span></p></li>
                  <li><p>Check In : <span id="checkInCheck"></span> 15:00 PM</p></li>
                  <li><p>Check Out : <span id="checkOutCheck"></span>11:00 AM</p></li>
                  <li><p>숙박인원 : <span id="guestNumCheck"></span></p></li>
                </ul>
                <hr>
		      <p>총 합계(KRW) : <b><span id="totalPriceCheck"></span></b></p>
            </div>
		      <div class="modal-footer text-center">
                <a id="detailLink" type="button" href="#" class="btn btn-info mr-2">숙소 상세보기</a>
                <a type="button" class="btn btn-success" data-dismiss="modal">확인</a>
              </div>
        </div>
    </div>
</div>
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <%		request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8"); %>
        <div class="modal-content">
            <div class="modal-header">
            	<h5 class="modal-title" id="reviewModalLabel">리뷰 작성</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
	            <form class="comment_form" id="commentForm">
	            	<fieldset style="border:0px;">
	            	 <label for="rating">이용하신 숙소는 어떠셨나요? 별점을 남겨주세요(선택)</label>
			  			<div class="viewPoint m-0 b-0">
			  				<input type="radio" name="star" value="5" id="star1"><label for="star1">★</label>
			  				<input type="radio" name="star" value="4" id="star2"><label for="star2">★</label>
			  				<input type="radio" name="star" value="3" id="star3"><label for="star3">★</label>
			  				<input type="radio" name="star" value="2" id="star4"><label for="star4">★</label>
			  				<input type="radio" name="star" value="1" id="star5"><label for="star5">★</label>
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
							    <p>숙소 예약 목적<br>(지역 경제 지원 예산 편성을 위한 데이터로만 활용됩니다.)</p>
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
	                <input type="hidden" id="sIdx" name="sIdx">
	                <input type="hidden" id="bIdx" name="bIdx">
	            </form>
        	</div>
        </div>
	</div>
</div>
	<script src="js/admin/jquery-ui.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script src="js/admin/perfect-scrollbar.jquery.min.js"></script>
	<script src="js/admin/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="js/admin/waves.js"></script>
	<!--Menu sidebar -->
	<script src="js/admin/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="js/admin/custom.min.js"></script>
	<!-- this page js -->
	<script src="js/admin/moment.min.js"></script>
<%@ include file = "../../include/footer.jsp"%>
</body>
</html>