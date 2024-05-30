<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberLogin.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
  	'use strict'
  	
  	let BtnSw = 0;
  	
  	$function(){
  		$("#idBtn").click(function(){
  			$(this).addClass("activeBtn");
  			$("#pwBtn").removeClass("activeBtn");
  			$("#findPw").hide();
  			BtnSw = 0;
  		});
  		$("#pwBtn").click(function(){
  			$(this).addClass("activeBtn")
  			$("#idBtn").removeClass("activeBtn");
  			$("#findId").hide();
  			BtnSw = 1;
  		});
  	}
  </script>
  <style>
	* {box-sizing: border-box;}
	
	/* Style the input container */
	.input-container {
	  display: flex;
	  width: 100%;
	  margin-bottom: 15px;
	}
	
	/* Style the form icons */
	.icon {
	  padding: 10px;
	  background: dodgerblue;
	  color: white;
	  min-width: 50px;
	  text-align: center;
	}
	
	/* Style the input fields */
	.input-field {
	  width: 100%;
	  padding: 10px;
	  outline: none;
	}
	
	.input-field:focus {
	  border: 2px solid dodgerblue;
	}
	
	/* Set a style for the submit button */
	.btn {
	  background-color: dodgerblue;
	  color: white;
	  padding: 15px 20px;
	  border: none;
	  cursor: pointer;
	  width: 100%;
	  opacity: 0.9;
	}
	
	.btn:hover {
	  opacity: 1;
	}
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<div class="toggleBtnBar">
		<span id="idBtn" class="toggleBtn activeBtn">아이디 찾기</span>
		<span id="pwBtn" class="toggleBtn">비밀번호 찾기</span>
	</div>
  <form name="findIdPw" method="post" class="needs-validation" action="FindIdPw.mem" novalidate>
	  <div id="findId" class="box border border-info rounded p-5">
		<h2>아이디 찾기</h2>
		  <div class="input-container">
		    <i class="fa fa-user icon"></i>
		    <input type="text" name="name" placeholder="이름을 입력하세요" autofocus required class="input-field form-control"/>
		  </div>
		  <div class="input-container">
		    <i class="fa fa-phone icon"></i>
	      <div class="input-group">
	        <input type="text" name="tel1" size=4 value=010 class="input-group-prepend input-field form-control" readonly /> -
	        <input type="text" name="tel2" size=4 maxlength=4 class="input-field form-control"/> -
	        <input type="text" name="tel3" size=4 maxlength=4 class="input-field form-control"/>
	      </div>
		  </div>
          <p>  
	          <input type="button" value="아이디 찾기" class="btn btn-success btn-sm mb-2"/>
	          <input type="button" value="돌아가기" onclick="location.href='MemberLogin.mem';" class="btn btn-primary btn-sm"/>
          </p>
	  </div>
	  <div id="findPw" class="box border border-info rounded p-5">
		<h2>비밀번호 찾기</h2>
		  <div class="input-container">
		    <i class="fa fa-user icon"></i>
		    <input type="text" name="mid" placeholder="아이디를 입력하세요" autofocus required class="input-field form-control"/>
		  </div>
		  <div class="input-container">
		    <i class="fa fa-user icon"></i>
		    <input type="text" name="name" placeholder="이름을 입력하세요" autofocus required class="input-field form-control"/>
		  </div>
		  <div class="input-container">
		    <i class="fa fa-key icon"></i>
		    <input type="number" name="tel" required class="input-field form-control"/>
		  </div>
          <p>  
	          <input type="button" value="비밀번호 찾기" class="btn btn-success btn-sm mb-2"/>
	          <input type="button" value="돌아가기" onclick="location.href='MemberLogin.mem';" class="btn btn-primary btn-sm"/>
          </p>
	  </div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>