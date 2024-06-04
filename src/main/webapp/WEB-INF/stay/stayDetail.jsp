<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    	body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
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
	  	
	  	#reviewReplyForm {
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
    </style>
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
		
	  	// 별점/리뷰평가 등록하기
	  	function reviewCheck() {
	  		let star = starForm.star.value;
	  		let review = $("#review").val();  // 필수x
	  		if(star == "") {
	  			alert("별점을 부여해 주세요");
	  			location.reload();
	  		}
	  		
	  		let query = {
	  				part : 'pds',
	  				//partIdx : ${vo.idx},  // pds 게시글의 번호
	  				mid : '${sMid}',  // 문자는 ''안하면 에러
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
	  	//$(document).ready(function(){});  아래와 같음
	  	$(function(){
	  		$("#reviewShowBtn").hide();
	  		$("#reviewHideBtn").show();  		
	  		$("#reviewBox").show();  		
	  	});
	  	
	  	// 리뷰 보이기
	  	function reviewShow() {
	  		$("#reviewShowBtn").hide();
	  		$("#reviewHideBtn").show();  		
	  		$("#reviewBox").show();  		  		
	  	}

	  	// 리뷰 감추기
	  	function reviewHide() {
	  		$("#reviewShowBtn").show();
	  		$("#reviewHideBtn").hide();  		
	  		$("#reviewBox").hide();  		
	  	}
	  	
	  	// 리뷰 댓글 달기 폼 보여주기
	  	function reviewReply(idx, nickName, content) {  		
	  		$("#myModal #reviewIdx").val(idx);
	  		$("#myModal #reviewReplyNickName").text(nickName);
	  		$("#myModal #reviewReplyContent").html(content);  // html로 바꾸면 밑에 설정한 엔터키 실제 적용(2번 바꿔야)
	  	}
	  	
	  	// 리뷰 댓글 달기
	  	function reviewReplyCheck() {
				let replyContent = reviewReplyForm.replyContent.value;  // 입력한 댓글 내용
				let reviewIdx = reviewReplyForm.reviewIdx.value;
				
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
							alert("댓글이 등록되었습니다.");  // 부분리로드 해도 되지만 부분리로드는 내용이 많을때 처리하는 것이 좋음
							location.reload();
						}
						else alert("댓글 등록 실패~~");
					},
					error : function() {
						alert("전송 오류!");
					}
				});
	  	}
	  	
	  	function stayDiscontinue() {
	  		let ans = confirm("숙소 게시글을 비공개 처리하시겠습니까?");
	  		if(ans) location.href = "StayDiscontinue.st?idx=${vo.idx}";
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
            <li><a href="index.html">Home</a></li>
            <li>Portfoio Details</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

  <!-- Slideshow Header -->
    <div class="w3-display-container mySlides">
    <img src="/w3images/livingroom.jpg" style="width:100%;margin-bottom:-6px">
      <div class="w3-display-bottomleft w3-container w3-black">
        <p>Living Room</p>
      </div>
    </div>
    <div class="w3-display-container mySlides">
    <img src="/w3images/diningroom.jpg" style="width:100%;margin-bottom:-6px">
      <div class="w3-display-bottomleft w3-container w3-black">
        <p>Dining Room</p>
      </div>
    </div>
    <div class="w3-display-container mySlides">
    <img src="/w3images/bedroom.jpg" style="width:100%;margin-bottom:-6px">
      <div class="w3-display-bottomleft w3-container w3-black">
        <p>Bedroom</p>
      </div>
    </div>
    <div class="w3-display-container mySlides">
    <img src="/w3images/livingroom2.jpg" style="width:100%;margin-bottom:-6px">
      <div class="w3-display-bottomleft w3-container w3-black">
        <p>Living Room II</p>
      </div>
    </div>
  </div>
  <div class="w3-row-padding w3-section">
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src="/w3images/livingroom.jpg" style="width:100%;cursor:pointer" onclick="currentDiv(1)" title="Living room">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src="/w3images/diningroom.jpg" style="width:100%;cursor:pointer" onclick="currentDiv(2)" title="Dining room">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src="/w3images/bedroom.jpg" style="width:100%;cursor:pointer" onclick="currentDiv(3)" title="Bedroom">
    </div>
    <div class="w3-col s3">
      <img class="demo w3-opacity w3-hover-opacity-off" src="/w3images/livingroom2.jpg" style="width:100%;cursor:pointer" onclick="currentDiv(4)" title="Second Living Room">
    </div>
  </div>

  <div class="w3-container">
  	<div class="w3-row-padding">
  	<div class="w3-col m5 portfolio-info" style="max-width:400px;">
	  <h3>Project information</h3>
	    <div>
        <label><i class="fa fa-calendar-o"></i> Check In</label>
        <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckIn" required>
      </div>
      
	    <div>
        <label><i class="fa fa-calendar-o"></i> Check Out</label>
        <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckOut" required>
      </div>
	    <div>
        <label><i class="fa fa-male"></i> Adults</label>
        <input class="w3-input w3-border" type="number" value="1" name="Guest" min="1" max="6">
      </div>
	    <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-search w3-margin-right"></i> Search availability</button>
	</div>
  	<div class="w3-col m7">
	    <div class="w3-row">
    	<h4><strong>The space</strong></h4>
	      <div class="w3-col m6">
	        <p><i class="fa fa-fw fa-male"></i> Max people: 4</p>
	        <p><i class="fa fa-fw fa-bath"></i> Bathrooms: 2</p>
	        <p><i class="fa fa-fw fa-bed"></i> Bedrooms: 1</p>
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
	        <p><i class="fa fa-fw fa-wifi"></i> WiFi</p>
	        <p><i class="material-icons">ac_unit</i> A/C</p>
	        <p><i class="material-icons">local_parking</i> Parking</p>
	      </div>
	      <div class="w3-col m5">
	      	<span class="w3-margin-top"></span>
	        <p><i class='fas fa-fw fa-dog'></i> Pet</p>
	        <p><i class="fa fa-fw fa-cutlery"></i> Kitchen</p>
	        <p><i class="material-icons">local_laundry_service</i> Washing machine</p>
	      </div>
    </div>
    </div>

    </div>
  </div>
    <hr>
     <div class="w3-container">
    <h4><strong>Extra Info</strong></h4>
    <p>${fn:replace(vo.content, newLine, "<br/>")}</p>
    <p>결제가능 수단: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
    <hr>
    
    <h4><strong>Rules</strong></h4>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <p>Subscribe to receive updates on available dates and special offers.</p>
  </div>
  <hr>
  
  <div class="w3-container" id="contact">
    <h2>Contact</h2>
    <i class="fa fa-map-marker" style="width:30px"></i> Chicago, US<br>
    <i class="fa fa-phone" style="width:30px"></i> Phone: +00 151515<br>
    <i class="fa fa-envelope" style="width:30px"> </i> Email: mail@mail.com<br>
    <p>Questions? Go ahead, ask them:</p>
    <form action="/action_page.php" target="_blank">
      <p><input class="w3-input w3-border" type="text" placeholder="Name" required name="Name"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Email" required name="Email"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Message" required name="Message"></p>
    <button type="submit" class="w3-button w3-green w3-third">Send a Message</button>
    </form>
	<!-- 위로가기 버튼 -->
	<%-- <a href="#topMenu"><img src="${ctp}/images/arrow_top.gif" title="위로 이동" /></a> --%>
	<h6 id="topBtn" class="text-right mr-3"><img src="${ctp}/images/arrowTop.gif" title="위로 이동" /></h6>  <!-- 글자로 써도됨 그래서 h6 사용 -->
</div>
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
	  		<input type="button" value="수정" onclick="location.href='StayUpdate.st?idx=${vo.idx}'" class="btn btn-primary" />
	  		<input type="button" value="삭제" onclick="stayDiscontinue()" class="btn btn-danger" />
		</c:if>
		<c:if test="${sMid != 'admin'}">
			<c:if test="${call_112 == 'OK'}"><font color='red'><b>신고처리 중입니다..</b></font></c:if>
	  		<c:if test="${call_112 != 'OK'}"><input type="button" value="신고하기" data-toggle="modal" data-target="#myModal" class="btn btn-danger" /></c:if>
		</c:if>
	</div>
  <!-- 리뷰/평점 출력 -->
  <div class="row">
  	<div class="col">
  		<input type="button" value="리뷰보기" id="reviewShowBtn" onclick="reviewShow()" class="btn btn-success" />
  		<input type="button" value="리뷰닫기" id="reviewHideBtn" onclick="reviewHide()" class="btn btn-warning" />
  	</div>
  	<div class="col text-right">
  		<b>리뷰평점 : <fmt:formatNumber value="${reviewAvg}" pattern="#,##0.0" /></b>
  	</div>
  </div>
  <hr>
  <div id="reviewBox">
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
  </div>
  
  <!-- 자료실에 등록된 자료가 사진이라면, 아래쪽에 모두 보여주기 -->
  <div class="text-center">
		<c:forEach var="fSName" items="${fSNames}" varStatus="st">
			${fNames[st.index]}<br>  <!-- 파일명 -->
			<c:set var="len" value="${fn:length(fSName)}" />
			<c:set var="ext" value="${fn:substring(fSName, len-3, len)}"/>
		  <c:set var="extLower" value="${fn:toLowerCase(ext)}"/>
			<c:if test="${extLower == 'jpg' || extLower == 'gif' || extLower == 'png'}">  <!-- 소문자로 해야함 -->
				<img src="${ctp}/images/pds/${fSName}" width="85%" />  <!-- px로 주면 안됨 %로 줘야함 -->
			</c:if>
			<hr>
		</c:forEach>	
  </div>
	
	<!-- 위로가기 버튼 -->
	<%-- <a href="#topMenu"><img src="${ctp}/images/arrow_top.gif" title="위로 이동" /></a> --%>
	<%-- <h6 id="topBtn" class="text-right mr-3"><img src="${ctp}/images/arrowTop.gif" title="위로 이동" /></h6> --%>  <!-- 글자로 써도됨 그래서 h6 사용 -->
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
        	<form name="reviewReplyForm" class="was-validated">
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
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>

</html>