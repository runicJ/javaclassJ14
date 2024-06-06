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
		
		/*--------------------------------------------------------------
		# Contact
		--------------------------------------------------------------*/
		.contact .info-wrap {
		  padding: 30px;
		  background: #fff;
		  border-radius: 4px;
		}
		
		.contact .info i {
		  font-size: 20px;
		  color: #3498db;
		  float: left;
		  width: 44px;
		  height: 44px;
		  background: #eaf4fb;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  border-radius: 50px;
		  transition: all 0.3s ease-in-out;
		}
		
		.contact .info h4 {
		  padding: 0 0 0 60px;
		  font-size: 22px;
		  font-weight: 600;
		  margin-bottom: 5px;
		  color: #384046;
		}
		
		.contact .info p {
		  padding: 0 0 0 60px;
		  margin-bottom: 0;
		  font-size: 14px;
		  color: #65747f;
		}
		
		.contact .info:hover i {
		  background: #3498db;
		  color: #fff;
		}
		
		.contact {
		  width: 100%;
		  padding: 30px;
		  background: #fff;
		  border-radius: 4px;
		}
		
		.contact .form-group {
		  padding-bottom: 8px;
		}
		
		.contact .validate {
		  display: none;
		  color: red;
		  margin: 0 0 15px 0;
		  font-weight: 400;
		  font-size: 13px;
		}
		
		.contact .error-message {
		  display: none;
		  color: #fff;
		  background: #ed3c0d;
		  text-align: left;
		  padding: 15px;
		  font-weight: 600;
		}
		
		.contact .error-message br+br {
		  margin-top: 25px;
		}
		
		.contact .sent-message {
		  display: none;
		  color: #fff;
		  background: #18d26e;
		  text-align: center;
		  padding: 15px;
		  font-weight: 600;
		}
		
		.contact .loading {
		  display: none;
		  background: #fff;
		  text-align: center;
		  padding: 15px;
		}
		
		.contact .loading:before {
		  content: "";
		  display: inline-block;
		  border-radius: 50%;
		  width: 24px;
		  height: 24px;
		  margin: 0 10px -6px 0;
		  border: 3px solid #18d26e;
		  border-top-color: #eee;
		  animation: animate-loading 1s linear infinite;
		}
		
		.contact input,
		.contact textarea {
		  border-radius: 0;
		  box-shadow: none;
		  font-size: 14px;
		}
		
		.contact input {
		  height: 44px;
		}
		
		.contact textarea {
		  padding: 10px 12px;
		}
		
		.contact button[type=submit] {
		  background: #3498db;
		  border: 0;
		  padding: 10px 24px;
		  color: #fff;
		  transition: 0.4s;
		  border-radius: 4px;
		}
		
		.contact button[type=submit]:hover {
		  background: #5faee3;
		}
		
		@keyframes animate-loading {
		  0% {
		    transform: rotate(0deg);
		  }
		
		  100% {
		    transform: rotate(360deg);
		  }
		}
		
	  	th {
	  		background-color: #eee;
	  		width: 15%;
	  	}
	  	h6 {
			  position: fixed;  /* 위치고정 */
			  right: 1rem;
			  bottom: -50px;
			  transition: 0.7s ease;
			}
	   	.on {  /* 버튼에 관한것 마우스 올리면 */
			  opacity: 0.8;
			  cursor: pointer;
			  bottom: 0;
			}
	  	
	  	/* 별점 스타일 설정하기 */
	  	#starForm fieldset {
	  		direction: rtl;  /* 오른쪽에서 왼쪽으로(아랍권) */
	  	}
	  	#starForm input[type=radio] {
	  		display: none;  /* 안보이게 숨김 */
	  	}
	  	#starForm label {
	  		font-size: 1.7em;
	  		color: transparent;
	  		text-shadow: 0 0 0 #f0f0f0;  /* 오른쪽 아래쪽 크기 */
	  	}
	  	#starForm label:hover {
	  		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	  	}
	  	#starForm label:hover ~ label {  /* ~ 흐름 앞의 레이블이 이어지는 곳에 적용하겠다 */
	  		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	  	}
	  	#starForm input[type=radio]:checked ~ label {  /* 체크가 되어있는 곳에서 라벨까지 */
	  		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	  	}
	  	
	  	#replyForm {
	      font-size: 11pt;
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
    </style>
    <script>
    	'use strict';
		
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
	  	
	  	// 처음 접속 시 '리뷰보기' 버튼을 감추고, '리뷰닫기' 버튼과 '리뷰박스'를 보이게 한다.
/*
		// 리뷰 댓글 달기 폼 보여주기
	  	function reviewReply(idx, nickName, content) {  		
	  		$("#myModal #reviewIdx").val(idx);
	  		$("#myModal #reviewReplyNickName").text(nickName);
	  		$("#myModal #reviewReplyContent").html(content);  // html로 바꾸면 밑에 설정한 엔터키 실제 적용(2번 바꿔야)
	  	}
	  	
	  	// 리뷰 댓글 달기
	  	function reviewReplyCheck() {
				let replyContent = replyForm.replyContent.value;  // 입력한 댓글 내용
				let reviewIdx = replyForm.reviewIdx.value;
				
				if(replyContent.trim() == "") {
					alert("리뷰 댓글을 입력하세요");
					return false;
				}
				
				let query = {
						reviewIdx : reviewIdx,
						replyMid : '${sMid}',
						replyNickName : '${sNickName}',
						replyContent : replyContent,
				}
				
				$.ajax({
					url : "ReviewReplyInputOk.ad",
					type : "post",
					data : query,
					success:function(res) {
						if(res != "0") {
							alert("댓글이 등록되었습니다.");
							location.reload();
						}
						else alert("댓글 등록 실패~~");
					},
					error : function() {
						alert("전송 오류!");
					}
				});
	  	}
	  	 */
	  	function stayDiscontinue() {
	  		let ans = confirm("숙소 게시글을 비공개 처리하시겠습니까?");
	  		if(ans) location.href = "StayDiscontinue.st?sIdx=${vo.sIdx}";
	  	}
	</script>
    
  <!-- Vendor CSS Files -->
  <link href="${ctp}/setting/css/stay/boxicons.min.css" rel="stylesheet">
  <link href="${ctp}/setting/css/stay/swiper-bundle.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container">
  <div class="w3-hide-large" style="margin-top:80px"></div>
  <div class="w3-container" id="apartment">
    <!-- ======= Breadcrumbs ======= -->
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
    </section><!-- End Breadcrumbs -->

  <!-- Slideshow Header -->	
<div class="w3-container">
    <!-- 이미지 리스트 설정 -->
    <c:set var="sPhotos" value="${fn:split(vo.sPhoto, '/')}"/>

    <!-- 각 이미지를 슬라이드로 표시 -->
    <c:forEach var="sPhoto" items="${sPhotos}" varStatus="st">
        <div class="w3-display-container mySlides" style="display:none;">
            <img src="${ctp}/images/stay/${sPhoto}" style="width:100%">
            <div class="w3-display-bottomleft w3-container w3-black">
                <p>Image ${st.index + 1} of ${fn:length(sPhotos)}</p>
            </div>
        </div>
    </c:forEach>

    <!-- 썸네일 표시 -->
    <div class="w3-row-padding w3-section">
        <c:forEach var="sPhoto" items="${sPhotos}" varStatus="st">
            <div class="w3-col s3">
                <img class="demo w3-opacity w3-hover-opacity-off" src="${ctp}/images/stay/${sPhoto}" style="width:100%;cursor:pointer" onclick="currentDiv(${st.index + 1})" title="Image ${st.index + 1}" id="myOverlay">
            </div>
        </c:forEach>
    </div>
</div>

  <div class="w3-container">
  	<div class="w3-row-padding">
  	<div class="w3-col m5 portfolio-info" style="max-width:400px;">
	  <h3>Reservation</h3>
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
        <input class="w3-input w3-border mb-2" type="number" value="1" name="Guest" min="1" max="${vo.guestMax}">
      </div>
	    <div class="form_colum">
        <label><i class="fa fa-money"></i> Price : ${vo.price} / 1박</label>
      </div>
	    <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-search w3-margin-right"></i> Search availability</button>
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
    <p>결제가능 수단: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
    <hr>
    
    <h4><strong>정책</strong></h4>
    <i class="fa fa-map-marker" style="width:30px"></i> ${vo.sort}<br>
    <p>자세한 주소는 예약 후에 공개됩니다.</p>
  </div>
  <hr>
<p><br/></p>

  <div>
  	<form name="starForm" id="starForm">
  		<fieldset style="border:0px;">  <!-- 별점자리 영역으로 지정 // border 0으로 흔적 삭제 -->
  			<div class="viewPoint m-0 b-0">  <!-- margin때문에 별이 밀려서 0으로 설정 -->
  				<input type="radio" name="star" value="5" id="star1"><label for="star1">★</label>  <!-- 원래 label 먼저 썼는데 right to left를 위해 오른쪽부터니까 5점부터 -->
  				<input type="radio" name="star" value="4" id="star2"><label for="star2">★</label>
  				<input type="radio" name="star" value="3" id="star3"><label for="star3">★</label>
  				<input type="radio" name="star" value="2" id="star4"><label for="star4">★</label>
  				<input type="radio" name="star" value="1" id="star5"><label for="star5">★</label>  <!-- rtl로 바꿨기 때문에 반대로 읽는 것 // 맨 앞의 별 -->
  				: 별점을 남겨주세요 ■
  			</div>
  		</fieldset>
  		<div class="m-0 p-0">
  			<textarea rows="3" name="review" id="review" class="form-control" placeholder="별점 후기를 남겨주시면 100포인트를 지급합니다."></textarea>  <!-- cols를 안주려면 form-control로 작성 -->
  		</div>
  		<div>
  			<input type="button" value="별점/리뷰등록" onclick="reviewCheck()" class="btn btn-primary btn-sm form-control" />
  		</div>
  	</form>
  </div>
  <hr>
	<div class="col text-right">
		<c:if test="${sMid == 'admin'}">
	  		<input type="button" value="수정" onclick="location.href='StayUpdate.st?sIdx=${vo.sIdx}';" class="btn btn-primary" />
	  		<input type="button" value="삭제" onclick="stayDiscontinue()" class="btn btn-danger" />
		</c:if>
	</div>
	<div class="row">
	  	<div class="col text-right">
	  		<b>리뷰평점 : <fmt:formatNumber value="${reviewAvg}" pattern="#,##0.0" /></b>
	  	</div>
  	</div>
 <%--  <div id="reviewBox">
		<c:set var="imsiIdx" value="0" />  <!-- 임시로 변수하나 줌 // 0은 없으니까 값으로 먼저 줌 -->
  	<c:forEach var="vo" items="${rVos}" varStatus="st">
  		<c:if test="${imsiIdx != vo.idx}">  <!-- 리뷰가 새로운 것이 왔다 => 이때 뿌림 -->
	  		<div class="row">
	  			<div class="col ml-2">
	  				<b>${vo.nickName}</b>
	  				<span style="font-size:11px">${fn:substring(vo.rDate,0,10)}</span>  <!-- font로 하면 맘대로 조절이 안됨 -->
	  				<c:if test="${vo.mid == sMid || sLevel == 0}"><a href="javascript:reviewDelete(${vo.idx})" title="리뷰삭제" class="badge badge-danger">x</a></c:if>
	  				<a href="#" onclick="reviewReply('${vo.idx}','${vo.nickName}','${fn:replace(vo.content,newLine,'<br>')}')" title="댓글달기" data-toggle="modal" data-target="#myModal" class="badge badge-secondary">▤</a>  <!-- 내용 2줄이상이면 enter키 처리해야 보임 / 모달창으로 적용 / onclick이니까 어차피 js처리 -->
	  			</div>
	  			<div class="col text-right mr-2">
	  				<c:forEach var="i" begin="1" end="${vo.star}" varStatus="iSt">  <!-- 위에 st 사용 inlineSt -->
	  					<font color="gold">★</font>
	  				</c:forEach>
	  				<c:forEach var="i" begin="1" end="${5 - vo.star}" varStatus="iSt">☆</c:forEach>
	  			</div>
	  		</div>
				<div class="row border m-1 p-2" style="border-radius:5px">
	        ${fn:replace(vo.content, newLine, '<br/>')}
				</div>
			</c:if>
			<c:set var="imsiIdx" value="${vo.idx}" />  <!-- vo.idx 리뷰의 idx를 imsi에 넣어줌 -->
			<c:if test="${!empty vo.replyContent}">  <!-- 댓글이 비어있지 않으면 -->
				<div class="d-flex text-secondary">
					<div class="mt-2 ml-3">└─▶ </div>
					<div class="mt-2 ml-2">${vo.replyNickName}
						<span style="font-size:11px">${fn:substring(vo.replyRDate,0,10)}</span>  <!-- 한줄로 끝낼거라서 span으로 줌 -->
						<c:if test="${vo.replyMid == sMid || sLevel == 0}"><a href="javascript:reviewReplyDelete(${vo.replyIdx})" title="댓글삭제" class="badge badge-danger">x</a></c:if>
						<br>${vo.replyContent}
					</div>
				</div>
			</c:if>
			<hr>
  	</c:forEach>
  </div> --%>
<div class="navigation-top">
	    <div class="d-sm-flex justify-content-between text-center">
	        <p class="like-info"><span class="align-middle"><i class="far fa-heart"></i></span> Lily and 4 people like this</p>
	        <div class="col-sm-4 text-center my-2 my-sm-0">
	            <p class="comment-count"><span class="align-middle"><i class="far fa-comment"></i></span> 06 Comments</p>
	        </div>
	    </div>	    
	<div class="comments-area">
	    <h4>05 Comments</h4>
	    <div class="comment-list">
	        <div class="single-comment justify-content-between d-flex">
	            <div class="user justify-content-between d-flex">
	                <div class="thumb">
	                    <img src="${ctp}/images/comment/comment_1.png" alt="">
	                </div>
	                <div class="desc">
	                    <p class="comment">
	                        Multiply sea night grass fourth day sea lesser rule open subdue female fill which them Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
	                    </p>
	                    <div class="d-flex justify-content-between">
	                        <div class="d-flex align-items-center">
	                            <h5>
	                   <a href="#">Emilly Blunt</a>
	                </h5>
	                            <p class="date">December 4, 2017 at 3:12 pm </p>
	                        </div>
	                        <div class="reply-btn">
	                            <a href="#" class="btn-reply text-uppercase">reply</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <c:if test="${sMid != null}">
	    <div class="comment-form">
            <h4>댓글 작성하기</h4>
            <form class="form-contact comment_form" action="#" id="commentForm">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
						    <label>작성자 아이디</label>
                            <input class="form-control" name="mid" type="text" value="${sMid}" readonly>
                        </div>
                    </div>
                    <div class="col-sm-6">
						<div class="form-group">
						    <label for="reservationPurpose">숙소 예약 목적(지역 경제 지원 예산 편성을 위한 데이터로만 활용됩니다.)</label>
						    <select class="form-control" id="reservationPurpose" name="reservationPurpose">
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
                            <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="5" placeholder="숙소에 대한 평가를 남겨주세요"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="button button-contactForm btn_1">Send Message</button>
                </div>
            </form>
        </div>
        </c:if>
</div>
<p><br/></p>

<!-- 댓글달기를 위한 모달처리 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">>> 리뷰에 댓글달기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
        	<form name="replyForm" class="was-validated">
				<table class="table table-bordered">
					<tr>
						<th style="width:25%;">리뷰 작성자</th>
						<td style="width:75%;"><span id="reviewReplyNickName"></span></td>
					</tr>
					<tr>
						<th>리뷰내용</th>  <!-- 첫번째 행에 style 적용하면 아래 같이 적용 -->
						<td><span id="reviewReplyContent"></span></td>
					</tr>
				</table>
				<hr>
				댓글 작성자 : ${sNickName}<br>
				댓글 내용 : <textarea rows="3" name="replyContent" id="replyContent" class="form-control" required></textarea>
				<input type="button" value="리뷰댓글등록" onclick="reviewReplyCheck()" class="btn btn-success form-control"/>
				<input type="hidden" name="reviewIdx" id="reviewIdx" />
        	</form>
        </div>        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>    
      </div>
    </div>
  </div>
</div>
<p><br/></p>
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
	
	window.onload = function() {
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
	};
</script>
</body>
</html>