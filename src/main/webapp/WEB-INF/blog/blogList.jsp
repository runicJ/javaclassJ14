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
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <jsp:include page="/include/bs4.jsp" />
  <style>
.pagination a {
  border-radius: 5px;
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: dodgerblue;
  color: white;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
}
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
    <section class="blog_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                    	<div class="mb-2" style="display:flex; justify-content:space-between; align-items:center;">
				  			<form name="partForm">
								<select name="part" id="part" onchange="location.href = 'BlogList.bl?part=' + this.value;" style="height: 35px; font-size: 16px; padding: 4px 8px;">
								    <option value="tIdx" ${part == "tIdx" ? "selected" : ""}>최신글</option>
								    <option value="viewCnt" ${part == "viewCnt" ? "selected" : ""}>조회수</option>
								    <option value="likedCnt" ${part == "likedCnt" ? "selected" : ""}>좋아요</option>
								    <option value="reviewCnt" ${part == "reviewCnt" ? "selected" : ""}>댓글수</option>
								</select>
				  			</form>
			  				<button onclick="location.href='BlogInput.bl';" class="button primary-bg btn_1">새글쓰기</button>
			  			</div>
			  			
				    <c:if test="${not empty searchMsg}">
				        <div class="alert alert-info text-center">
				            ${searchMsg}
				        <p class="text-center"><input type="button" value="전체 게시글 보기" onclick="location.href='BlogList.bl';" class="btn btn-info btn-sm" />
				        </div>
				    </c:if>
			  			
                    	<c:set var="curScrStartNo" value="${curScrStartNo}" />
        				<c:forEach var="vo" items="${vos}" varStatus="st">
                        <article class="blog_item">
                            <div class="blog_item_img">
                            	<c:set var="tPhotos" value="${fn:split(vo.tPhoto, '/')}"/>
                                <img class="card-img rounded-0" src="${ctp}/images/blog/${tPhotos[0]}" style="height:300px;">
                                <a href="#" class="blog_item_date">
                                    <h3>(조회수 : ${vo.viewCnt})</h3>
                                    <p>${vo.date_diff >= 0 ? fn:substring(vo.tDate,0,10) : fn:substring(vo.tDate,0,16)}</p>
                                </a>
                            </div>

                            <div class="blog_details" style="height:200px;padding:40px 20px 30px 30px;">
                            	<div>
	                                <a class="d-inline-block" href="BlogDetail.bl?tIdx=${vo.tIdx}&pag=${pag}&pageSize=${pageSize}">
	                                    <h2>[${vo.sort}] ${vo.title} <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif" /></c:if></h2>
	                                </a>
								</div>
                                <p>
                                	<c:if test="${fn:length(vo.tContent) >= 40}">${fn:substring(vo.tContent,0,40)}...</c:if>
                                	<c:if test="${fn:length(vo.tContent) < 40}">${vo.tContent}</c:if>
                                </p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa-solid fa-suitcase-rolling"></i>${vo.residence == "" ? "미상" : vo.residence}</a></li>
                                    <li><a href="#"><i class="far fa-comments"></i>${vo.reviewCnt} reviews</a></li>
                                    <li><a href="#"><i class="far fa-user"></i>by ${vo.nickName}</a></li>
									<li style="float:right;"><button class="w3-button w3-black" onclick="likeFunction(this)"><b><i class="fa fa-thumbs-up"></i> Like </b><span class="w3-tag w3-white">${vo.likedCnt}</span></button></li>
                                </ul>
                            </div>
                            <c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
                        </article>
                        </c:forEach>
                        
                        <nav class="">
                            <ul class="pagination">
                                <c:if test="${pag > 1}">
                                    <li class="item">
                                        <a class="link" href="${ctp}/BlogList.bl?part=${part}&pag=1&pageSize=${pageSize}">첫페이지</a>
                                    </li>
                                </c:if>
                                <c:if test="${curBlock > 0}">
                                    <li class="item">
                                        <a class="link" href="${ctp}/BlogList.bl?part=${part}&pag=${(curBlock*blockSize+1)-blockSize}&pageSize=${pageSize}">
                                            <i class="ti-angle-left"></i>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
                                    <c:if test="${i <= totPage && i == pag}">
                                        <li class="item active">
                                            <a class="link" href="${ctp}/BlogList.bl?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${i <= totPage && i != pag}">
                                        <li class="item">
                                            <a class="link" href="${ctp}/BlogList.bl?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${curBlock < lastBlock}">
                                    <li class="item">
                                        <a class="link" href="${ctp}/BlogList.bl?part=${part}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">
                                            <i class="ti-angle-right"></i>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${pag < totPage}">
                                    <li class="item">
                                        <a class="link" href="${ctp}/BlogList.bl?part=${part}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="BlogSearch.bl">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" name="keyword" placeholder='검색어를 입력하세요'
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
                            <h3 class="widget_title">최근 공지사항</h3>
                            <c:forEach var="gVo" items="${gVos}" varStatus="st">
                            <div class="media post_item">
                            	<c:set var="tPhotos" value="${fn:split(gVo.tPhoto, '/')}"/>
                                <img src="${ctp}/images/blog/${tPhotos[0]}" alt="post" style="width:70px;object-fit:cover;">
                                <div class="media-body">
                                    <a href="BlogDetail.bl?tIdx=${gVo.tIdx}">
                                        <h3 style="font-size:15px;">${gVo.title}</h3>
                                    </a>
                                    <p>${fn:substring(gVo.tDate,0,10)}</p>
                                </div>
                            </div>
                            <hr>
                            </c:forEach>
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
                        
                        <aside class="single_sidebar_widget instagram_feeds">
                            <h4 class="widget_title">Instagram Feeds</h4>
                            <ul class="instagram_row flex-wrap">
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="images/post/post_5.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="images/post/post_6.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="images/post/post_7.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="images/post/post_8.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="images/post/post_9.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="images/post/post_10.png" alt="">
                                    </a>
                                </li>
                            </ul>
                        </aside>
                      
                    </div>
                </div>
            </div>
        </div>
    </section>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>