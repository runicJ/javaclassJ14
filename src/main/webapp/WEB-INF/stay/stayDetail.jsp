<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Portfolio Details - Lumia Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Vendor CSS Files -->
  <link href="${ctp}/setting/css/stay/bootstrap.min.css" rel="stylesheet">
  <link href="${ctp}/setting/css/stay/boxicons.min.css" rel="stylesheet">
  <link href="${ctp}/setting/css/stay/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${ctp}/setting/css/stay/style.css" rel="stylesheet">
  
    <%@ include file = "/include/bs4.jsp" %>
</head>

<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Portfoio Details</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Portfoio Details</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

<div class="w3-main w3-white" style="margin-left:260px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:80px"></div>

  <!-- Slideshow Header -->
  <div class="w3-container" id="apartment">
    <h2 class="w3-text-green">The Apartment</h2>
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
    <h4><strong>The space</strong></h4>
    <div class="w3-row w3-large">
      <div class="w3-col s6">
        <p><i class="fa fa-fw fa-male"></i> Max people: 4</p>
        <p><i class="fa fa-fw fa-bath"></i> Bathrooms: 2</p>
        <p><i class="fa fa-fw fa-bed"></i> Bedrooms: 1</p>
      </div>
      <div class="w3-col s6">
        <p><i class="fa fa-fw fa-clock-o"></i> Check In: After 3PM</p>
        <p><i class="fa fa-fw fa-clock-o"></i> Check Out: 12PM</p>
      </div>
    </div>
    <hr>
    
    <h4><strong>Amenities</strong></h4>
    <div class="w3-row w3-large">
      <div class="w3-col s6">
        <p><i class="fa fa-fw fa-shower"></i> Shower</p>
        <p><i class="fa fa-fw fa-wifi"></i> WiFi</p>
        <p><i class="fa fa-fw fa-tv"></i> TV</p>
      </div>
      <div class="w3-col s6">
        <p><i class="fa fa-fw fa-cutlery"></i> Kitchen</p>
        <p><i class="fa fa-fw fa-thermometer"></i> Heating</p>
        <p><i class="fa fa-fw fa-wheelchair"></i> Accessible</p>
      </div>
    </div>
    <hr>
    
    <h4><strong>Extra Info</strong></h4>
    <p>Our apartment is really clean and we like to keep it that way. Enjoy the lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
    <hr>
    
    <h4><strong>Rules</strong></h4>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <p>Subscribe to receive updates on available dates and special offers.</p>
    <p><button class="w3-button w3-green w3-third" onclick="document.getElementById('subscribe').style.display='block'">Subscribe</button></p>
  </div>
  <hr>
  <main id="main">
    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center">

                <div class="swiper-slide">
                  <img src="${ctp}/images/portfolio/portfolio-1.jpg" alt="">
                </div>

                <div class="swiper-slide">
                  <img src="${ctp}/images/portfolio/portfolio-2.jpg" alt="">
                </div>

                <div class="swiper-slide">
                  <img src="${ctp}/images/portfolio/portfolio-3.jpg" alt="">
                </div>

              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>Project information</h3>
              <ul>
                <li><strong>Category</strong>: Web design</li>
                <li><strong>Client</strong>: ASU Company</li>
                <li><strong>Project date</strong>: 01 March, 2020</li>
                <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
              </ul>
            </div>
            <div class="portfolio-description">
              <h2>This is an example of portfolio detail</h2>
              <p>
                Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.
              </p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->

    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong><span>Lumia</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
	  <div class="header-social-links d-flex align-items-center">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
      </div>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${ctp}/js/stay/purecounter_vanilla.js"></script>
  <script src="${ctp}/js/stay/bootstrap.bundle.min.js"></script>
  <script src="${ctp}/js/stay/isotope.pkgd.min.js"></script>
  <script src="${ctp}/js/stay/swiper-bundle.min.js"></script>
  <script src="${ctp}/js/stay/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="${ctp}/js/stay/main.js"></script>
</div>
</body>

</html>