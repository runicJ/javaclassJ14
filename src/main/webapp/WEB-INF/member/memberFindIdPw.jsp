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
  	
  	$(document).ready(function(){
  		$("#idBtn").click(function(){
  			$(this).addClass("activeBtn");
  			$("#pwBtn").removeClass("activeBtn");
  			$("#findPw").hide();
  			$("#findId").show();
  		});
  		$("#pwBtn").click(function(){
  			$(this).addClass("activeBtn")
  			$("#idBtn").removeClass("activeBtn");
  			$("#findId").hide();
  			$("#findPw").show();
  		});
  	});
  	
  	function findId() {
  		let name = findIdForm.name.value.trim();
  		let tel1 = findIdForm.tel1.value;
  		let tel2 = findIdForm.tel2.value.trim();
  		let tel3 = findIdForm.tel3.value.trim();
  		let tel = tel1 + "-" + tel2 + "-" + tel3;
  		
  		if(name == "") {
  			alert("이름을 입력해주세요");
  			return false;
  		}
  		if(tel2 == "" || tel3 == "") {
  			alert("전화번호를 입력해주세요");
  			return false;
  		}
  		
        $.ajax({
            url: 'MemberFindIdOk.mem',
            type: 'POST',
            data: {
            	name : name,
            	tel : tel
            	},
            success: function(res) {
                $('#resultModal .modal-body').text(res);
                $('#resultModal').modal('show');
            }
        });
  	}
  	
  	function findPw() {
  		let mid = findPwForm.mid.value.trim();
  		let name = findPwForm.name.value.trim();
  		let tel1 = findIdForm.tel1.value;
  		let tel2 = findPwForm.tel2.value.trim();
  		let tel3 = findPwForm.tel3.value.trim();
  		let tel = tel1 + "-" + tel2 + "-" + tel3;
  		
  		if(mid == "") {
  			alert("아이디를 입력해주세요");
  			return false;
  		}
  		if(name == "") {
  			alert("이름을 입력해주세요");
  			return false;
  		}
  		if(tel2 == "" || tel3 == "") {
  			alert("전화번호를 입력해주세요");
  			return false;
  		}
  		
        $.ajax({
            url: 'MemberFindPwOk.mem',
            type: 'POST',
            data: {
            	mid : mid,
            	name : name,
            	tel : tel
            	},
            success: function(res) {
            	if(res != "0") {
                	$('#passwordResetModal').modal('show');
                	$('#hideMid').val(mid);
            	}
            	else {
            		alert("입력하신 정보가 일치하지 않습니다.");
            	}
            },
            error: function() {
            	alert("전송 오류!");
            }
        });
  	}

  	$(document).ready(function() {
  	    $('#passwordResetForm').submit(function(e) {
  	        e.preventDefault();
  	        let newPw = $('#newPw').val();
  	        let confirmPw = $('#confirmPw').val();
  	        let mid = $('#hideMid').val();
  	        let regPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&^])[A-Za-z\d@$!%*#?&^]{4,30}$/;

  	        if (newPw != confirmPw) {
  	            alert('비밀번호가 일치하지 않습니다.');
  		      	$('#confirmPw').focus();
  		        return;
  	        }
  			else if(!regPwd.test(newPw)) {
  		        alert("비밀번호는 4~30자로 최소 하나의 대문자,소문자,숫자,특수문자를 넣어서 작성해주세요.");
  		      	$('#newPw').focus();
  		        return;
  	      	}

  	        $.ajax({
  	            url: 'MemberResetPw.mem',
  	            type: 'POST',
  	            data: {
  	            	mid : mid,
  	                newPw: newPw
  	            },
  	            success:function(res) {
  	            	if(res != "0") {
  	            		alert("비밀번호가 변경되었습니다. 로그인 페이지로 이동합니다.");
  	            		location.href="MemberLogin.mem";
  	            	}
  	            	else {
  	            		alert("비밀번호가 변경 실패!");
  	            	}
  	            },
  	            error: function() {
  	            	alert("전송 오류!");
  	            }
  	        });

  	    });
  	});
  	
  	$('#idFindModal').on('hidden.bs.modal', function () {
  	  // 모달이 닫힐 때 입력 필드 초기화
  	  $('#findIdForm #name').val('');
  	  $('#findIdForm #tel').val('');
  	});
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
	
	#tabBar {
		padding-top: 60px;
		padding-bottom: 20px;
	}
	
	#tabBar .toggleBtn {
		font-size: 1.2em;
		font-weight: 500;
		padding: 20px 180px;
		border: 1px solid dodgerblue;
		  cursor: pointer;
	}
	
	@media (max-width: 900px) {
	  #tabBar .toggleBtn {
	    padding: 16px 80px;
	    font-size: 1em;
	    flex-grow: 1;
	  }
	}
	
	@media (max-width: 480px) {
	  #tabBar .toggleBtn {
	    padding: 12px 10px;
	  }
	}
	
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
	  opacity: 0.8;
	}
	
	.activeBtn {
	  background-color: dodgerblue;
	  color: white;
	}
	
	.box {
      max-width: 900px;
      margin: auto;
      padding: 16px;
    }

    @media (max-width: 768px) {
      form {
        max-width: 90%;
      }
    }

    @media (max-width: 480px) {
      form {
        max-width: 95%;
      }
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container text-center">
	<div id="tabBar" class="text-center">
		<span id="idBtn" class="toggleBtn activeBtn">아이디 찾기</span>
		<span id="pwBtn" class="toggleBtn">비밀번호 찾기</span>
	</div>
	  <div id="findId" class="box border border-info rounded p-5">
  		<form name="findIdForm" method="post" class="needs-validation" action="MemberFindIdOk.mem" novalidate>
		<h2>아이디 찾기</h2>
		<br><br><br>
		  <div class="input-container">
		    <i class="fa fa-user icon"></i>
		    <input type="text" name="name" placeholder="이름을 입력하세요" autofocus required class="input-field form-control"/>
		  </div>
		  <div class="input-container mb-5">
		    <i class="fa fa-phone icon"></i>
		    <div class="input-group">
		        <input type="text" name="tel1" value="010" class="form-control text-center" readonly />
		        <span>&nbsp;&nbsp; - &nbsp;&nbsp;</span>
		        <input type="text" name="tel2" size=4 maxlength=4 class="form-control" required />
		        <span>&nbsp;&nbsp; - &nbsp;&nbsp;</span>
		        <input type="text" name="tel3" size=4 maxlength=4 class="form-control" required />
			</div>
		  </div>
          <div class="d-flex justify-content-between mb-3">
	          <input type="button" value="아이디 찾기" onclick="findId()" class="btn btn-success btn-sm mr-3"/>
	          <input type="button" value="돌아가기" onclick="location.href='MemberLogin.mem';" class="btn btn-warning btn-sm"/>
          </div>
          </form>
	  </div>
	  <div id="findPw" class="box border border-info rounded p-5" style="display:none;">
  		<form name="findPwForm" method="post" class="needs-validation" action="MemberFindPwOk.mem" novalidate>
		<h2>비밀번호 찾기</h2>
		<br><br><br>
		  <div class="input-container">
		    <i class="fa fa-key icon"></i>
		    <input type="text" name="mid" placeholder="아이디를 입력하세요" autofocus required class="input-field form-control"/>
		  </div>
		  <div class="input-container">
		    <i class="fa fa-user icon"></i>
		    <input type="text" name="name" placeholder="이름을 입력하세요" autofocus required class="input-field form-control"/>
		  </div>
		  <div class="input-container mb-5">
		    <i class="fa fa-phone icon"></i>
		    <div class="input-group">
		        <input type="text" name="tel1" value="010" class="form-control text-center" readonly />
		        <span>&nbsp;&nbsp; - &nbsp;&nbsp;</span>
		        <input type="text" name="tel2" size=4 maxlength=4 class="form-control" required />
		        <span>&nbsp;&nbsp; - &nbsp;&nbsp;</span>
		        <input type="text" name="tel3" size=4 maxlength=4 class="form-control" required />
			</div>
			</div>
          <div class="d-flex justify-content-between mb-3">  
	          <input type="button" value="비밀번호 찾기" onclick="findPw()" class="btn btn-success btn-sm mr-3"/>
	          <input type="button" value="돌아가기" onclick="location.href='MemberLogin.mem';" class="btn btn-warning btn-sm"/>
          </div>
	  	</form>
	  </div>
</div>
<p><br/></p>
<div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="resultModalLabel">고객님의 정보와 일치하는 아이디 목록입니다.</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"></div>
            <hr>
            <div class="modal-footer">
	            <input type="button" value="로그인하기" class="btn btn-info btn-sm mr-2" onclick="location.href='MemberLogin.mem';">
	            <input type="button" value="비밀번호 찾기" class="btn btn-danger btn-sm" data-dismiss="modal">
	      </div>
        </div>
    </div>
</div>
<div class="modal fade" id="passwordResetModal" tabindex="-1" role="dialog" aria-labelledby="passwordResetModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="passwordResetModalLabel">비밀번호 재설정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="passwordResetForm">
          <div class="form-group">
            <label for="newPw">새 비밀번호:</label>
            <input type="password" class="form-control" id="newPw" name="newPw" required>
          </div>
          <div class="form-group">
            <label for="confirmPw">비밀번호 확인:</label>
            <input type="password" class="form-control" id="confirmPw" name="confirmPw" required>
          </div>
          <input type="hidden" id="hideMid" value="${mid}" />
          <hr>
          <button type="submit" class="btn btn-primary">비밀번호 변경</button>
        </form>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>