<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewpoint" content="width=divice-width, initial-scale=1.0">
	<title>Insert</title>
  <%@ include file = "../../include/bs4.jsp"%>
  <style>
	/*--------------------------------------------------------------
	# Portfolio
	--------------------------------------------------------------*/
	.portfolio {
	  padding: 60px 0;
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
	  height: 240px;
	  position: relative;
	  border-radius: 4px 4px 0 0;
	  margin: 0;
	}
	
	.portfolio .portfolio-item figure:hover img {
	  opacity: 0.4;
	  transition: 0.4s;
	}
	
	.portfolio .portfolio-item figure .link-preview,
	.portfolio .portfolio-item figure .link-details {
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
	.portfolio .portfolio-item figure .link-details i {
	  color: #384046;
	  line-height: 0;
	}
	
	.portfolio .portfolio-item figure .link-preview:hover,
	.portfolio .portfolio-item figure .link-details:hover {
	  background: #3498db;
	}
	
	.portfolio .portfolio-item figure .link-preview:hover i,
	.portfolio .portfolio-item figure .link-details:hover i {
	  color: #fff;
	}
	
	.portfolio .portfolio-item figure .link-preview {
	  left: calc(50% - 38px);
	  top: calc(50% - 18px);
	}
	
	.portfolio .portfolio-item figure .link-details {
	  right: calc(50% - 38px);
	  top: calc(50% - 18px);
	}
	
	.portfolio .portfolio-item figure:hover .link-preview {
	  opacity: 1;
	  left: calc(50% - 44px);
	}
	
	.portfolio .portfolio-item figure:hover .link-details {
	  opacity: 1;
	  right: calc(50% - 44px);
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
  </style>
  
  <!-- Vendor CSS Files -->
  <link href="${ctp}/setting/css/stay/boxicons.min.css" rel="stylesheet">
  <link href="${ctp}/setting/css/stay/glightbox.min.css" rel="stylesheet">
  <link href="${ctp}/setting/css/stay/swiper-bundle.min.css" rel="stylesheet">
</head>
<body>
<%@ include file = "../../include/header.jsp"%>
<%@ include file = "../../include/nav.jsp"%>
<div class="container">
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>Stay List</h2>
                            <p>Serene Nest는 당신에게 필요한 맞춤 보금자리를 제공합니다.</p>
                            <c:if test="${sMid == 'admin'}"><a href="StayInput.st" class="btn_1">숙소 등록하기</a></c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    <!-- booking part start-->
    <section class="booking_part">
        <div class="row">
            <div class="col-lg-12">
                <div class="booking_content">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
                            <div class="booking_form">
                                <form action="#">
                                    <div class="form-row">
                                        <div class="form_colum">
                                            <select class="nc_select">
                                                <option selected>Choosace place </option>
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                        </div>
                                        <div class="form_colum">
                                            <input id="datepicker_1" placeholder="Check in date">
                                        </div>
                                        <div class="form_colum">
                                            <input id="datepicker_2" placeholder="Check in date">
                                        </div>
                                        <div class="form_colum">
                                            <select class="nc_select">
                                                <option selected>Persone </option>
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                        </div>
                                        <div class="form_btn">
                                            <a href="#" class="btn_1">search</a>
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
    <!-- Header part end-->
		<!-- ======= Portfolio Section ======= -->
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

        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 portfolio-item filter-Gang wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="${ctp}/images/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
                <a href="${ctp}/images/portfolio/portfolio-1.jpg" data-gallery="portfolioGallery" class="link-preview portfolio-lightbox" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="StayDetail.st" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="StayDetail.st">App 1</a></h4>
                <p>App</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-Jeol wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="${ctp}/images/portfolio/portfolio-2.jpg" class="img-fluid" alt="">
                <a href="${ctp}/images/portfolio/portfolio-2.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="StayDetail.st">Web 3</a></h4>
                <p>Web</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-Gang wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="${ctp}/images/portfolio/portfolio-3.jpg" class="img-fluid" alt="">
                <a href="${ctp}/images/portfolio/portfolio-3.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="StayDetail.st">App 2</a></h4>
                <p>App</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-Chung wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="${ctp}/images/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
                <a href="${ctp}/images/portfolio/portfolio-4.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="StayDetail.st">Card 2</a></h4>
                <p>Card</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-Jeol wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="${ctp}/images/portfolio/portfolio-5.jpg" class="img-fluid" alt="">
                <a href="${ctp}/images/portfolio/portfolio-5.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="StayDetail.st">Web 2</a></h4>
                <p>Web</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="${ctp}/images/portfolio/portfolio-6.jpg" class="img-fluid" alt="">
                <a href="${ctp}/images/portfolio/portfolio-6.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="StayDetail.st">App 3</a></h4>
                <p>App</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-Chung wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="${ctp}/images/portfolio/portfolio-7.jpg" class="img-fluid" alt="">
                <a href="${ctp}/images/portfolio/portfolio-7.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="StayDetail.st">Card 1</a></h4>
                <p>Card</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="${ctp}/images/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
                <a href="${ctp}/images/portfolio/portfolio-8.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="StayDetail.st">Card 3</a></h4>
                <p>Card</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-Gyeong wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="${ctp}/images/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
                <a href="${ctp}/images/portfolio/portfolio-9.jpg" class="link-preview portfolio-lightbox" data-gallery="portfolioGallery" title="Preview"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" class="link-details" title="More Details"><i class="bx bx-link"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="StayDetail.st">Web 1</a></h4>
                <p>Web</p>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Section -->
</div>
<p><br/></p>
<%@ include file = "../../include/footer.jsp"%>
  <!-- Vendor JS Files -->
  <script src="${ctp}/js/stay/purecounter_vanilla.js"></script>
  <script src="${ctp}/js/stay/bootstrap.bundle.min.js"></script>
  <script src="${ctp}/js/stay/glightbox.min.js"></script>
  <script src="${ctp}/js/stay/isotope.pkgd.min.js"></script>
  <script src="${ctp}/js/stay/swiper-bundle.min.js"></script>
  <script src="${ctp}/js/stay/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="${ctp}/js/stay/main.js"></script>
</body>
</html>