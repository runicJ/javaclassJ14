<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewpoint" content="width=divice-width, initial-scale=1.0">
	<title>Stay Quote</title>
  <%@ include file = "../../include/bs4.jsp"%>
  <!-- Vendor CSS Files -->
  <link href="${ctp}/setting/css/stay/boxicons.min.css" rel="stylesheet">
  <link href="${ctp}/setting/css/stay/swiper-bundle.min.css" rel="stylesheet">

  <style>
  	/*--------------------------------------------------------------
	# Sections General
	--------------------------------------------------------------*/
	section {
	  padding: 60px 0;
	}
	
	.section-bg {
	  background-color: #f7fbfe;
	}
	
	.section-title {
	  text-align: center;
	  padding-bottom: 30px;
	}
	
	.section-title h2 {
	  font-size: 32px;
	  font-weight: 600;
	  margin-bottom: 20px;
	  padding-bottom: 20px;
	  position: relative;
	}
	
	.section-title h2::before {
	  content: "";
	  position: absolute;
	  display: block;
	  width: 120px;
	  height: 1px;
	  background: #ddd;
	  bottom: 1px;
	  left: calc(50% - 60px);
	}
	
	.section-title h2::after {
	  content: "";
	  position: absolute;
	  display: block;
	  width: 40px;
	  height: 3px;
	  background: #3498db;
	  bottom: 0;
	  left: calc(50% - 20px);
	}
	
	.section-title p {
	  margin-bottom: 0;
	}
  	/*--------------------------------------------------------------
	# Testimonials
	--------------------------------------------------------------*/
	.testimonials .testimonials-carousel,
	.testimonials .testimonials-slider {
	  overflow: hidden;
	}
	
	.testimonials .testimonial-item {
	  box-sizing: content-box;
	  padding: 30px 30px 0 30px;
	  margin: 30px 15px;
	  text-align: center;
	  min-height: 350px;
	  box-shadow: 0px 2px 12px rgba(0, 0, 0, 0.08);
	  background: #fff;
	}
	
	.testimonials .testimonial-item .testimonial-img {
	  width: 90px;
	  border-radius: 50%;
	  border: 4px solid #fff;
	  margin: 0 auto;
	}
	
	.testimonials .testimonial-item h3 {
	  font-size: 18px;
	  font-weight: bold;
	  margin: 10px 0 5px 0;
	  color: #111;
	}
	
	.testimonials .testimonial-item h4 {
	  font-size: 14px;
	  color: #999;
	  margin: 0;
	}
	
	.testimonials .testimonial-item .quote-icon-left,
	.testimonials .testimonial-item .quote-icon-right {
	  color: #e1f0fa;
	  font-size: 26px;
	}
	
	.testimonials .testimonial-item .quote-icon-left {
	  display: inline-block;
	  left: -5px;
	  position: relative;
	}
	
	.testimonials .testimonial-item .quote-icon-right {
	  display: inline-block;
	  right: -5px;
	  position: relative;
	  top: 10px;
	}
	
	.testimonials .testimonial-item p {
	  font-style: italic;
	  margin: 0 auto 15px auto;
	}
	
	.testimonials .swiper-pagination {
	  margin-top: 20px;
	  position: relative;
	}
	
	.testimonials .swiper-pagination .swiper-pagination-bullet {
	  width: 12px;
	  height: 12px;
	  background-color: #fff;
	  opacity: 1;
	  border: 1px solid #3498db;
	}
	
	.testimonials .swiper-pagination .swiper-pagination-bullet-active {
	  background-color: #3498db;
	}
  </style>
</head>
<body>
<%@ include file = "../../include/header.jsp"%>
<%@ include file = "../../include/nav.jsp"%>
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>Stay Quote</h2>
                            <p>여행에 대한 당신의 한줄평을 남겨주세요.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<div class="container">
    <!-- breadcrumb start-->
    <!-- breadcrumb start-->
    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Testimonials</h2>
          <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem</p>
        </div>

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/images/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                <h3>Saul Goodman</h3>
                <h4>Ceo &amp; Founder</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/images/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                <h3>Sara Wilsson</h3>
                <h4>Designer</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/images/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                <h3>Jena Karlis</h3>
                <h4>Store Owner</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/images/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                <h3>Matt Brandon</h3>
                <h4>Freelancer</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img src="assets/images/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                <h3>John Larson</h3>
                <h4>Entrepreneur</h4>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->
</div>
<p><br/></p>
<%@ include file = "../../include/footer.jsp"%>
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