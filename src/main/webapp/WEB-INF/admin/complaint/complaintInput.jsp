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
<p><br/></p>
<div class="contact-box-main">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-sm-12">
                <div class="contact-form-right">
                    <h2>GET IN TOUCH</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio justo, ultrices ac nisl sed, lobortis porta elit. Fusce in metus ac ex venenatis ultricies at cursus mauris.</p>
                    <form id="contactForm">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required data-error="Please enter your name">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" placeholder="Your Email" id="email" class="form-control" name="name" required data-error="Please enter your email">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="subject" name="name" placeholder="Subject" required data-error="Please enter your Subject">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <textarea class="form-control" id="message" placeholder="Your Message" rows="4" data-error="Write your message" required></textarea>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="submit-button text-center">
                                    <button class="btn hvr-hover" id="submit" type="submit">Send Message</button>
                                    <div id="msgSubmit" class="h3 text-center hidden"></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </form>
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