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
  <title>Travelog Page</title>
  <jsp:include page="/include/bs4.jsp" />
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <style>
  	.pagination a {
	  border-radius: 5px;
	}
	
	.pagination a.active {
	  border-radius: 5px;
	}
	
	.pagination a:hover:not(.active) {background-color: #eee;}
	
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>Travelog</h2>
                            <p>여러분의 추억을 기록하세요</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    <!--================Blog Area =================-->
    <section class="blog_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                    	<div class="mb-2" style="display:flex; justify-content:space-between; align-items:center;">
				  			<form name="partForm">
				  				<select name="part" id="part" onchange="partCheck()" style="height: 35px; font-size: 16px; padding: 4px 8px;">
				  					<option ${part=="최신글" ? "selected" : ""}>최신글</option>
				  					<option ${part=="조회수" ? "selected" : ""}>조회수</option>
				  					<option ${part=="좋아요" ? "selected" : ""}>좋아요</option>
				  					<option ${part=="댓글수" ? "selected" : ""}>댓글수</option>
				  				</select>
				  			</form>
			  				<input type="button" onclick="BlogInput.bl" value="글쓰기" class="button primary-bg btn_1">
			  			</div>
                    	<c:set var="curScrStartNo" value="${curScrStartNo}" />
        				<c:forEach var="vo" items="${vos}" varStatus="st">
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="${ctp}/images/blog/${vo.tPhoto}">
                                <a href="#" class="blog_item_date">
                                    <h3>${curScrStartNo} - (조회수 : ${vo.viewCnt})</h3>
                                    <p>${vo.date_diff == 0 ? fn:substring(vo.tDate,11,19) : fn:substring(vo.tDate,0,16)}</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="BlogDetail.bl?tIdx=${vo.tIdx}&pag=${pag}&pageSize=${pageSize}">
                                    <h2>${vo.title}</h2><c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif" /></c:if>
                                </a>
                                <p>${vo.tContent}</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="far fa-user"></i>${vo.residence}</a></li>
                                    <li><a href="#"><i class="far fa-comments"></i>by ${vo.nickName}</a></li>
                                </ul>
								<p class="w3-left"><button class="w3-button w3-white w3-border" onclick="likeFunction(this)"><b><i class="fa fa-thumbs-up"></i> Like ${vo.likedCnt}</b></button></p>
								<p class="w3-right"><button class="w3-button w3-black" onclick="myFunction('demo3')"><b>Replies  </b> <span class="w3-tag w3-white">3</span></button></p>
                            </div>
                            <c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
                        </article>
                        </c:forEach>

						<!-- 페이징 처리 -->
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination justify-content-center" style="margin:20px 0">
							<c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BlogList.bl?part=${part}&pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
							<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BlogList.bl?part=${part}&pag=${(curBlock*blockSize+1)-blockSize}&pageSize=${pageSize}"><i class="ti-angle-left"></i></a></li></c:if>  <!-- (curBlock-1)*blockSize +1 -->
							<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
								<c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/BlogList.bl?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
								<c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BlogList.bl?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
							</c:forEach>
							<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BlogList.bl?part=${part}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}"><i class="ti-angle-right"></a></li></c:if>
							<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BlogList.bl?part=${part}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
                            </ul>
                        </nav>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
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
                                        <p>Resaurant food</p>
                                        <p>(37)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Travel news</p>
                                        <p>(10)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Modern technology</p>
                                        <p>(03)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Product</p>
                                        <p>(11)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Inspiration</p>
                                        <p>21</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Health Care (21)</p>
                                        <p>09</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Recent Post</h3>
                            <div class="media post_item">
                                <img src="img/post/post_1.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>From life was you fish...</h3>
                                    </a>
                                    <p>January 12, 2019</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_2.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>The Amazing Hubble</h3>
                                    </a>
                                    <p>02 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_3.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Astronomy Or Astrology</h3>
                                    </a>
                                    <p>03 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_4.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Asteroids telescope</h3>
                                    </a>
                                    <p>01 Hours ago</p>
                                </div>
                            </div>
                        </aside>
                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">Tag Clouds</h4>
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


                        <aside class="single_sidebar_widget instagram_feeds">
                            <h4 class="widget_title">Instagram Feeds</h4>
                            <ul class="instagram_row flex-wrap">
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_5.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_6.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_7.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_8.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_9.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_10.png" alt="">
                                    </a>
                                </li>
                            </ul>
                        </aside>


                        <aside class="single_sidebar_widget newsletter_widget">
                            <h4 class="widget_title">Newsletter</h4>

                            <form action="#">
                                <div class="form-group">
                                    <input type="email" class="form-control" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Enter email'" placeholder='Enter email' required>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1"
                                    type="submit">Subscribe</button>
                            </form>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>