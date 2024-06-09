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
		
	  	// 리뷰평가 등록하기
	  	function reviewCheck() {
	  		let rContent = $("#rContent").val();
	  		if(rContent.trim() == "") {
	  			alert("댓글을 입력하세요");
	  			return false;
	  		}
	  		let query = {
	  				part : 'blog',
	  				partIdx : ${vo.tIdx},
	  				mid : '${sMid}',
	  				nickName : '${sNickName}',
	  				rContent : rContent
	  		}
	  		
	  		$.ajax({
	  			url : "ReviewInputOk.ad",
	  			type : "post",
	  			data : query,
	  			success:function(res) {
	  				if(res != "0") {
		  				alert("댓글이 입력되었습니다.");
		  				location.reload();
	  				}
					else alert("댓글 입력 실패!");
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
	  	
	  	function likedToggle(tIdx) {
	        $.ajax({
	            url  : "BlogLikedToggle.bl",
	            type : "post",
	            data : {tIdx : tIdx},
	            success: function(res) {
	                let icon = $(`#liked-icon-${tIdx}`);
	                if (res.trim() == "true") {
	                    icon.removeClass('far').addClass('fas');
	                } 
	                else {
	                    icon.removeClass('fas').addClass('far');
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
    <!--================Blog Area =================-->
    <section class="blog_area single-post-area section_padding">
        <div class="container">
			<div>
                <h2 class="text-center">${vo.title}</h2>
                <ul class="blog-info-link mb-4">
                    <li><a href="#"><i class="fa-solid fa-suitcase-rolling"></i>${vo.residence == "" ? "미상" : vo.residence}</a></li>
                    <li><a href="#">${vo.sort}</a></li><c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif" /></c:if>
                    <li style="float:right;"><button class="btn btn-dark" onclick="likedToggle(${vo.tIdx})"><b><i id="liked-icon-${vo.tIdx}" class="far fa-thumbs-up"></i>Like </b>${vo.likedCnt}</button></li>
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
					        <div class="swiper-slide text-center">
					          <img src="${ctp}/images/blog/${tPhoto}" style="width:80%;">
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
                        <li><a href="https://pf.kakao.com/_iExmG" target="_blank"><i class="fa-solid fa-comment"></i></a></li>
                        <li><a href="https://www.instagram.com/accounts/login/" target="_blank"><i class="ti-instagram"></i></a></li>
                        <li><a href="https://www.facebook.com" target="_blank"><i class="ti-facebook"></i></a></li>
                        <li><a href="https://x.com" target="_blank"><i class="fa-brands fa-x-twitter"></i></a></li>
                    </ul>
                </div>
                <div class="navigation-area">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                        	<c:if test="${!empty preVo.title}">
                            <div class="thumb">
                                <a href="BlogDetail.bl?tIdx=${preVo.tIdx}">
                                	<c:set var="tPhotos" value="${fn:split(preVo.tPhoto, '/')}"/>
                                    <img class="img-fluid" src="${ctp}/images/blog/${tPhotos[0]}" alt="preThumb" style="max-width:120px;">
                                </a>
                            </div>
                            <div class="arrow">
                                <a href="BlogDetail.bl?tIdx=${preVo.tIdx}">
                                    <span class="lnr text-white ti-arrow-left"></span>
                                </a>
                            </div>
                            <div class="detials">
                                <p>Prev Blog</p>
                                <a href="BlogDetail.bl?tIdx=${preVo.tIdx}">
                                    <h4>${preVo.title}</h4>
                                </a>
                            </div>
                            </c:if>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                        	<c:if test="${!empty nextVo.title}">
                            <div class="detials">
                                <p>Next Blog</p>
                                <a href="BlogDetail.bl?tIdx=${nextVo.tIdx}">
                                    <h4>${nextVo.title}</h4>
                                </a>
                            </div>
                            <div class="arrow">
                                <a href="BlogDetail.bl?tIdx=${nextVo.tIdx}">
                                    <span class="lnr text-white ti-arrow-right"></span>
                                </a>
                            </div>
                            <div class="thumb">
                                <a href="BlogDetail.bl?tIdx=${nextVo.tIdx}">
                                	<c:set var="tPhotos" value="${fn:split(nextVo.tPhoto, '/')}"/>
                                    <img class="img-fluid" src="${ctp}/images/blog/${tPhotos[0]}" alt="nextThumb" style="max-width:120px;">
                                </a>
                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blog-author">
                <div class="media align-items-center">
                    <img src="images/member/${memVo.userInfo == '공개' ? memVo.photo : noImage.jpg}" alt="memPhoto">
                    <div class="media-body">
                	<c:if test="${memVo.userInfo == '공개'}">
                        <a href="#">
                            <h4>${memVo.nickName}</h4>
                        </a>
                        <p>${memVo.content}</p>
                    </c:if>
                    <c:if test="${memVo.userInfo != '공개'}"><h4>비공개 회원입니다.</h4></c:if>
                    </div>
                </div>
            </div>
            <div class="comments-area">
                <h4>Review</h4>
            	<c:if test="${empty rVos}"><p class="text-center">아직 댓글이 없습니다. 게시글이 유용하셨다면 댓글을 달아주세요.</p></c:if>
            	<c:if test="${!empty rVos}">
            	<c:set var="imsiIdx" value="0" />
            	<c:forEach var="rVo" items="${rVos}" varStatus="st">
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
                </c:forEach>
                </c:if>
            </div>
            <div class="comment-form">
                <h4>댓글남기기</h4>
                <form class="form-contact comment_form" method="post" id="reviewForm">
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
                                <textarea class="form-control w-100" name="rContent" id="rContent" rows="4" placeholder="댓글을 작성해주세요."></textarea>
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
                        	    <c:forEach var="sortCount" items="${sortCounts}">
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>${sortCount.sort}</p>
                                        <p>(${sortCount.sortCnt})</p>
                                    </a>
                                </li>
                                </c:forEach>
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