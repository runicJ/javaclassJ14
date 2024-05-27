<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	// 로그인창에 아이디 체크 유무에 대한 처리
	// 쿠키를 검색해서 cMid가 있을때 가져와서 아이디입력창에 뿌릴수 있게 한다.
	Cookie[] cookies = request.getCookies();

	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				pageContext.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberLogin.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
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
  <form name="myform" method="post" action="${ctp}/MemberLoginOk.mem">  <!-- 확장자 .mem(controller) -->
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2"><font size="5">LOGIN</font></td>
      </tr>
      <tr class="input-container">
        <td><i class="fa fa-key icon"></i><input type="text" name="mid" value="admin" placeholder="아이디를 입력하세요" autofocus required class="input-field form-control"/></td>
      </tr>
      <tr class="input-container">
        <td><i class="fa fa-key icon"></i><input type="password" name="pwd" value="1234" placeholder="비밀번호를 입력하세요" required class="input-field form-control"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="로그인" class="btn btn-success mr-2"/>
          <input type="reset" value="다시입력" class="btn btn-warning mr-2"/>
          <input type="button" value="회원가입" onclick="location.href='${ctp}/MemberJoin.mem';" class="btn btn-primary mr-4"/>
	    		<input type="checkbox" name="idSave" checked /> 아이디 저장
        </td>
      </tr>
    </table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>