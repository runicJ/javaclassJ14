<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Introduce Page</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
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
    <section class="about_us section_padding">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4">
                    <div class="about_img">
                        <img src="${ctp}/images/logoMain.png" alt="MainLogo">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="about_text">
                        <h5>- 우리는 약속합니다 -</h5>
                        <h2>Serene Nest는 평온한(고요한)<br> 보금자리를 상징합니다.</h2>
                        <p>교통·통신의 발달로 거주중심에서 활동중심으로 이동성 증가 등 지역의 방문자 특성을 분석하여, 지역 경제 활력 방안을 마련을 위해 노력하고 있습니다.</p>
                        <p>축적한 데이터를 기반으로 인구감소지역 및 관심지역 종합적으로 분석하여 인구감소지역 및 주요관심지역, 관광문제점 및 관광특성 도출하고 있습니다.</p>
                        <p>생활인구에 대한 정의, 「인구감소지역 지원 특별법」 제2조제2항에 기입되어 있는 ‘생활인구’의 개념은 법률적인 용어로 2023년 1월 1일부터 공식적으로 사용하기 시작했습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <section class="our_gallery section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                    	<h5 style="color:#fe5c24;">- 우리는 공익, 다수의 이익을 지향합니다 -</h5>
                        <h2>관련자료 시각화</h2>
                        <p>현행법 2023. 7. 10.부터 시행된 「인구감소지역 지원 특별법」은 지역이 주도하여<br> 
                        인구감소 및 지방소멸 문제에 효과적으로 대응하고, 국가는 행·재정적으로 지원하기 위한<br> 
                        제도적 기반 마련하여 실제 정주인구(체류,상주)가 아닌 관광생활인구를 모집하여<br> 
                        지역 경제 활성화를 도모하고 관광지로 확장함으로서 일자리 창출과 외국인 관광객 유치 기대하고 있습니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-columns text-center">
                        <div class="card">
                            <a href="images/view1.png" class="gallery_img">
                               <img src="images/view1.png" class="card-img-top" alt="">
                            </a>
                        </div>
                        <div class="card">
                            <a href="images/view2.png" class="gallery_img">
                                <img src="images/view2.png" class="card-img-top" alt="">
                            </a>
                        </div>
                        <div class="card">
                            <a href="images/view5.png" class="gallery_img">
                                <img src="images/view5.png" class="card-img-top" alt="">
                            </a>
                        </div>
                        <div class="card">
                            <a href="images/view4.png" class="gallery_img">
                                <img src="images/view4.png" class="card-img-top" alt="" style="width:350px;height:auto;">
                            </a>
                        </div>
                        <div class="card">
                            <a href="images/view3.jpg" class="gallery_img">
                                <img src="images/view3.jpg" class="card-img-top" alt="" style="width:350px;height:auto;">
                            </a>
                        </div>
                      </div>
                </div>
            </div>
        </div>
    </section>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>