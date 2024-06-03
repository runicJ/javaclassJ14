<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>소개 페이지</title>
  <jsp:include page="/include/bs4.jsp" />
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
                            <h2>Introduce</h2>
                            <p>일상에 지친 당신에게 평온한 보금자리를 제공하고 싶습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- about us css start-->
    <section class="about_us section_padding">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="about_img">
                        <img src="${ctp}/images/about_img.png" alt="#">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about_text">
                        <h5>Who we are</h5>
                        <h2>We love to discover around the world</h2>
                        <p>Waters make fish every without firmament saw had. Morning air subdue. Our. Air very one. Whales grass is fish whales winged night yielding land creeping that seed appear were bearing.</p>
                        <p>Waters make fish every without firmament saw had. Morning air subdue. Our. Air very one. Whales grass is fish whales winged night yielding land creeping that seed appear were bearing.</p>
                        <p>Waters make fish every without firmament saw had. Morning air subdue. Our. Air very one. Whales grass is fish whales winged night yielding land creeping that seed appear were bearing.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about us css end-->

     <!--::gallery part start::-->
     <section class="our_gallery section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>Our gallery</h2>
                        <p>WWaters make fish every without firmament saw had. Morning air subdue. Our. Air very one. Whales grass is fish whales winged.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-columns">
                        <div class="card">
                            <a href="img/gallery/gallery_1.png" class="gallery_img">
                               <img src="img/gallery/gallery_1.png" class="card-img-top" alt="">
                            </a>
                        </div>
                        <div class="card">
                            <a href="img/gallery/gallery_3.png" class="gallery_img">
                                <img src="img/gallery/gallery_3.png" class="card-img-top" alt="">
                            </a>
                        </div>
                        <div class="card">
                            <a href="img/gallery/gallery_2.png" class="gallery_img">
                                <img src="img/gallery/gallery_2.png" class="card-img-top" alt="">
                            </a>
                        </div>
                        <div class="card">
                            <a href="img/gallery/gallery_4.png" class="gallery_img">
                                <img src="img/gallery/gallery_4.png" class="card-img-top" alt="">
                            </a>
                        </div>
                        <div class="card">
                            <a href="img/gallery/gallery_5.png" class="gallery_img">
                                <img src="img/gallery/gallery_5.png" class="card-img-top" alt="">
                            </a>
                        </div>
                      </div>
                </div>
            </div>
        </div>
    </section>
    <!--::gallery part end::-->
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>

</html>