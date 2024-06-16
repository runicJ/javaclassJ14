<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1.0">
	<title>Please wait..</title>
	<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <link href="${ctp}/setting/admin/style.min.css" rel="stylesheet">
  <%@ include file = "/include/bs4.jsp"%>
</head>
<body>
<%@ include file = "/include/header.jsp"%>
</header>
<p><br><p>
<div class="container">
    <div class="main-wrapper">
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <div class="error-box">
            <div class="error-body text-center">
            	<img src="${ctp}/images/work.jpg" width="500px" />
                <h1 class="error-title text-danger mt-3 mb-3">공사중입니다..</h1>
                <h3 class="text-uppercase error-subtitle">해당 페이지를 최선을 다해 제작하고 있습니다!</h3>
                <p class="text-muted m-t-30 m-b-30">부디 다음에 다시 방문해 주세요</p>
                <a href="${ctp}/Main" class="btn btn-danger btn-rounded waves-effect waves-light m-t-30 m-b-40">To Main Page</a> </div>
        </div>
    </div>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script>
    $('[data-toggle="tooltip"]').tooltip();
    $(".preloader").fadeOut();
    </script>
</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp"%>
</body>
</html>