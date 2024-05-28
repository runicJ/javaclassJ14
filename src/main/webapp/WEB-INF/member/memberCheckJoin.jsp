<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입 개인정보 동의</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		// 1. 전체 선택을 클릭하면 개별 선택에 영향을 미친다.
		const fnChkAll = () => {
		  $('#chk_all').click((ev) => {
		    $('.chk_each').prop('checked', $(ev.target).prop('checked'));
		  })
		}

		// 2. 개별 선택을 클릭하면 전체 선택에 영향을 미친다.
		const fnChkEach = () => {
		  $(document).on('click', '.chk_each', () => {
		    var total = 0;
		    $.each($('.chk_each'), (i, elem) => {
		      total += $(elem).prop('checked');
		    })
		    $('#chk_all').prop('checked', total === $('.chk_each').length);
		  })
		}

		// 3. 필수 동의를 해야만 가입 페이지로 이동할 수 있다.
		const fnJoinForm = () => {
		  $('#frm_agree').submit((ev) => {
		    if(!$('#service').is(':checked')){
		      alert('필수 약관에 동의하세요.');
		      ev.preventDefault();
		      return;
		    }
		  })
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<form id="frm_agree" action="MemberJoin.mem">
    
    <h1>약관 동의하기</h1>
    
    <div>
      <input type="checkbox" id="chk_all">
      <label for="chk_all">모두 동의합니다</label>
    </div>
    
    <hr>
    
    <div>
      <input type="checkbox" name="service" id="service" class="chk_each">
      <label for="service">서비스 이용약관 동의(필수)</label>
    </div>
    <div>
      <textarea>본 약관은 ...</textarea>
    </div>
    
    <div>
      <input type="checkbox" name="event" id="event" class="chk_each">
      <label for="event">이벤트 알림 동의(선택)</label>
    </div>
    <div>
      <textarea>본 약관은 ...</textarea>
    </div>

    <div>
      <button type="submit">다음</button>
    </div>
    
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>