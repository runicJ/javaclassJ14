<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
	<%@ include file = "/include/bs4.jsp" %>
	<style>
		 .contact-box-main{
	     padding: 70px 0px;
		}
		 .contact-info-left{
		     padding: 20px;
		     background: url(../images/contact-bg.jpg) no-repeat center;
			 background-size: cover;
		}
		 .contact-info-left h2{
		     font-size: 22px;
		     font-weight: 700;
		}
		 .contact-info-left p{
		     margin-bottom: 15px;
		}
		 .contact-info-left ul li{
		     margin-bottom: 12px;
		}
		 .contact-info-left ul li p{
		     font-size: 16px;
		     color: #222222;
		     font-weight: 300;
		     padding-right: 16px;
		     padding-left: 25px;
		     line-height: 24px;
		     position: relative;
		}
		 .contact-info-left ul li p i{
		     position: absolute;
		     left: 0;
		     top: 5px;
		     padding-right: 6px;
		     color: #b0b435;
		}
		 .contact-info-left ul li p a:hover{
		     color: #b0b435;
		}
		 .contact-form-right{
		     padding: 20px;
		}
		 .contact-form-right h2{
		     font-size: 24px;
		     font-weight: 700;
		}
		 .contact-form-right p{
		     margin-bottom: 15px;
		}
		 .contact-form-right .form-group .form-control::-moz-placeholder{
		     color: #999999;
		}
		 .contact-form-right .form-group .form-control{
		     border-radius: 0px;
		     min-height: 40px;
		}
		 .contact-form-right .form-group {
		     margin-bottom: 30px;
		     position: relative;
		}
		 .contact-form-right .form-group .form-control:focus{
		     border: 1px solid #b0b435;
		     box-shadow: none;
		}
		 .submit-button button{
		     padding: 10px 20px;
		     font-weight: 700;
		     color: #ffffff;
		     border: none;
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
                        <h2>Service</h2>
                        <p>Serene Nest는 항상 당신의 목소리에 귀 기울이겠습니다.</p>
                        <c:if test="${sMid == 'admin'}"><a href="StayInput.st" class="btn_1">숙소 등록하기</a></c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<p><br/></p>
    <div class="contact-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="contact-form-right">
                        <h2>1:1 문의</h2>
                        <p>Serene Nest에서 불편하거나 궁금한 사항이 있다면 언제든 문의해 주세요.<br>
                        빠른 시일 내에 성심성의껏 답변드릴 것을 약속드립니다.</p>
                        <form id="contactForm">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="mid" name="mid" placeholder="비회원 분들은 연락처나 이메일을 적어주세요" required data-error="필수 입력사항입니다!">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="part" name="part" placeholder="문의유형" required data-error="문의 유형을 적어주세요!">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea class="form-control" id="message" placeholder="문의하실 내용을 적어주세요" rows="5" data-error="필수 입력사항입니다!" required></textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="submit-button text-center">
                                        <button class="btn hvr-hover" id="submit" type="submit" style="background-color:#ccce7b;">문의사항 입력하기</button>
                                        <div id="msgSubmit" class="h3 text-center hidden"></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
				<div class="col-lg-4 col-sm-12">
                    <div class="contact-info-left">
                        <h2 class="mb-5">CONTACT INFO</h2>
                        <p> 카카오톡 전용 채널을 통해 문의사항을 남겨주셔도 좋습니다. </p>
                        <ul>
                            <li>
                                <p><i class="fas fa-map-marker-alt"></i>Address :<br>그린컴퓨터아트학원<br>충청북도 청주시 서원구<br>사직대로 109 4층 401호 </p>
                            </li>
                            <li>
                                <p><i class="fas fa-phone-square"></i>Phone : +1324</p>
                            </li>
                            <li>
                                <p><i class="fas fa-envelope"></i>Email : <a href="https://cheongju.greenart.co.kr">https://cheongju.greenart.co.kr</a></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
  <script src="${ctp}/js/stay/contact-form-script.js"></script>
</body>
</html>