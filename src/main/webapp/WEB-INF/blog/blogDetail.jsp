<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>TravelogDetail Page</title>
  	<link href="${ctp}/setting/css/stay/boxicons.min.css" rel="stylesheet">
	<link href="${ctp}/setting/css/stay/swiper-bundle.min.css" rel="stylesheet">
  <jsp:include page="/include/bs4.jsp" />
	<style>
	/*--------------------------------------------------------------
		# Portfolio Details
		--------------------------------------------------------------*/
		.portfolio-details .portfolio-details-slider img {
		  width: 100%;
		}
		
		.portfolio-details .portfolio-details-slider .swiper-pagination {
		  margin-top: 20px;
		  margin-bottom: 10px;
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
	</style>
	<script>
		'use strict';
		
	  	// 별점/리뷰평가 등록하기
	  	function reviewCheck() {
	  		let review = $("#review").val();
	  		let star = "";
	  		
	  		let query = {
	  				part : 'blog',
	  				partIdx : ${vo.tIdx},
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
	  	
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container">
    <!--================Blog Area =================-->
    <section class="blog_area single-post-area section_padding">
        <div class="container">
			<div>
                <h2 class="text-center">${vo.title}</h2>
                <ul class="blog-info-link mb-4">
                    <li><a href="#"><i class="fa-solid fa-suitcase-rolling"></i>${vo.residence == "" ? "미상" : vo.residence}</a></li>
                    <li><a href="#">${vo.sort}</a></li><c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif" /></c:if>
                </ul>
            </div>
			<div class="row">
                <div class="col-lg-9 posts-list">
                    <div class="gy-4">
    					<div class="portfolio-details-slider swiper">
					      <div class="swiper-wrapper align-items-center">
							<c:set var="tPhotos" value="${fn:split(vo.tPhoto, '/')}"/>
							<c:forEach var="tPhoto" items="${tPhotos}" varStatus="st">
							<c:set var="len" value="${fn:length(tPhoto)}" />
							<c:set var="ext" value="${fn:substring(tPhoto, len-3, len)}"/>
						  	<c:set var="extLower" value="${fn:toLowerCase(ext)}"/>
							<c:if test="${extLower == 'jpg' || extLower == 'jpeg' || extLower == 'gif' || extLower == 'png'}">
					        <div class="swiper-slide">
					          <img src="${ctp}/images/blog/${tPhoto}" alt="">
					        </div>
					        </c:if>
					        </c:forEach>
					      </div>
					      <div class="swiper-pagination"></div>
					  </div>
                    <div class="quote-wrapper">
                        <div class="quotes">
							${fn:replace(vo.tContent,newLine,'<br>')}
                        </div>
                    </div>
					<div class="text-center">${fn:replace(vo.tContent,newLine,'<br>')}</div>
                </div>
            <div class="navigation-top mt-5">
                <div class="d-sm-flex justify-content-between text-center">
                    <p class="like-info"><span class="align-middle"><i class="far fa-heart"></i></span> Lily and 4 people like this</p>
                    <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="far fa-comment"></i></span> 06 Comments</p> -->
                    </div>
                    <ul class="social-icons">
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                        <li><a href="#"><i class="fab fa-behance"></i></a></li>
                    </ul>
                </div>
                <div class="navigation-area">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                            <div class="thumb">
                                <a href="#">
                                    <img class="img-fluid" src="images/post/preview.png" alt="">
                                </a>
                            </div>
                            <div class="arrow">
                                <a href="#">
                                    <span class="lnr text-white ti-arrow-left"></span>
                                </a>
                            </div>
                            <div class="detials">
                                <p>Prev Post</p>
                                <a href="#">
                                    <h4>Space The Final Frontier</h4>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                            <div class="detials">
                                <p>Next Post</p>
                                <a href="#">
                                    <h4>Telescopes 101</h4>
                                </a>
                            </div>
                            <div class="arrow">
                                <a href="#">
                                    <span class="lnr text-white ti-arrow-right"></span>
                                </a>
                            </div>
                            <div class="thumb">
                                <a href="#">
                                    <img class="img-fluid" src="images/post/next.png" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blog-author">
                <div class="media align-items-center">
                    <img src="images/blog/author.png" alt="">
                    <div class="media-body">
                        <a href="#">
                            <h4>Harvard milan</h4>
                        </a>
                        <p>Second divided from form fish beast made. Every of seas all gathered use saying you're, he our dominion twon Second divided from</p>
                    </div>
                </div>
            </div>
            <div class="comments-area">
                <h4>Review</h4>
                <div class="comment-list">
                    <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                            <div class="thumb">
                                <img src="images/comment/comment_1.png" alt="">
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
                                        <c:if test="${vo.mid == sMid || sMid == 'admin'}"><p><a href="javascript:reviewDelete(${vo.tIdx})" title="리뷰삭제" class="badge badge-danger">x</a></p></c:if>
                                    </div>
                                    <div class="reply-btn">
                                        <a href="#" class="btn-reply text-uppercase">reply</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="comment-form">
                <h4>댓글남기기</h4>
                <form class="form-contact comment_form" action="#" id="commentForm">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <input class="form-control" name="mid" type="text" value="${sMid}" readonly>
                            </div>
                        </div>
                        <div class="col-sm-6 text-right">
		                    <div class="form-group">
		                        <input type="button" value="입력" onclick="reviewCheck()" class="button button-contactForm btn_1">
		                    </div>
	                    </div>
                        <div class="col-12">
                            <div class="form-group">
                                <textarea class="form-control w-100" name="review" id="review" rows="3" placeholder="댓글을 작성해주세요."></textarea>
                            </div>
                        </div>
                    </div>
                </form>
	        </div>
	        </div>
                <div class="col-lg-3">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="BlogSearch.bl">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='Search Keyword'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Search Keyword'">
                                        <div class="input-group-append">
                                            <button class="btn" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1"
                                    type="submit">Search</button>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Category</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>여행기록</p>
                                        <p>(37)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>여행지추천</p>
                                        <p>(10)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>지역홍보</p>
                                        <p>(03)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>지역음식소개</p>
                                        <p>(11)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>공지사항</p>
                                        <p>(21)</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">현재 인기글</h3>
                            <div class="media post_item">
                                <img src="images/post/post_1.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>From life was you fish...</h3>
                                    </a>
                                    <p>January 12, 2019</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="images/post/post_2.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>The Amazing Hubble</h3>
                                    </a>
                                    <p>02 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="images/post/post_3.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Astronomy Or Astrology</h3>
                                    </a>
                                    <p>03 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="images/post/post_4.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Asteroids telescope</h3>
                                    </a>
                                    <p>01 Hours ago</p>
                                </div>
                            </div>
                        </aside>
                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">#Keyword</h4>
                            <ul class="list">
                                <li>
                                    <a href="#">project</a>
                                </li>
                                <li>
                                    <a href="#">love</a>
                                </li>
                                <li>
                                    <a href="#">technology</a>
                                </li>
                                <li>
                                    <a href="#">travel</a>
                                </li>
                                <li>
                                    <a href="#">restaurant</a>
                                </li>
                                <li>
                                    <a href="#">life style</a>
                                </li>
                                <li>
                                    <a href="#">design</a>
                                </li>
                                <li>
                                    <a href="#">illustration</a>
                                </li>
                            </ul>
                        </aside>       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================ Blog Area end =================-->
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
  <script src="${ctp}/js/stay/swiper-bundle.min.js"></script>
<script>
	 new Swiper('.portfolio-details-slider', {
	    speed: 400,
	    loop: true,
	    autoplay: {
	      delay: 5000,
	      disableOnInteraction: false
	    },
	    pagination: {
	      el: '.swiper-pagination',
	      type: 'bullets',
	      clickable: true
	    }
	  });
</script>
</body>
</html>