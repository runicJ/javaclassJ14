<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberUpdate.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo1.js"></script>
  	<link href="${ctp}/setting/css/admin/style.min.css" rel="stylesheet">
	<style>
		@font-face {
		    font-family: 'Electrical Safety Bold';
		    src: url('setting/fonts/Electrical Safety Bold.ttf') format('truetype');
		}
	
		body {font-family: 'Electrical Safety Bold', Arial, Helvetica, sans-serif;}
		* {box-sizing: border-box;}
		
		input[type=text], input[type=password] {
		  width: 100%;
		  padding: 15px;
		  margin: 5px 0 22px 0;
		  display: inline-block;
		  border: none;
		  background: #f1f1f1;
		}
		
		input[type=text]:focus, input[type=password]:focus {
		  background-color: #ddd;
		  outline: none;
		}
		
		hr {
		  border: 1px solid #f1f1f1;
		  margin-bottom: 25px;
		}
		
		/* Set a style for all buttons */
		button {
		  background-color: #04AA6D;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		  opacity: 0.9;
		}
		
		button:hover {
		  opacity:1;
		}
		
		.cancelbtn {
		  padding: 14px 20px;
		  background-color: #f44336;
		}
		
		.cancelbtn, .signupbtn {
		  float: left;
		  width: 50%;
		}
		
		.container {
		  padding: 16px;
		}
		
		/* Clear floats */
		.clearfix::after {
		  content: "";
		  clear: both;
		  display: table;
		}
		
		@media screen and (max-width: 300px) {
		  .cancelbtn, .signupbtn {
		     width: 100%;
		  }
		}
		
		form {
	      max-width: 1000px;
	      margin: auto;
	      padding: 16px;
	    }
	
	    .box {
	      width: 100%;
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
	    
	    #photoDemo {
		  border: 1px solid #ddd;
		  border-radius: 4px;
		  padding: 5px;
		  width: 150px;
		}
		
		#photoDemo:hover {
		  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
		}
		
		#sidebarnav li:last-child {
		    margin-top: 140%;
		    font-size: 0.7em;
		}
	</style>
  	<script>
	    'use strict';
	    
	    let nickCheckSw = 0;
	    let telCheckSw = 0;  
	    
	    function fCheck() {
	    	let name = myform.name.value.trim();
	    	
	        let originalNickName = '${vo.nickName}';
	        let originalTel = '010-${tel2}-${tel3}'; 
	    	
	    	let nickName = myform.nickName.value.trim();
	    	
	        let currentPwd = myform.pwd.value.trim();
	        let newPwd = myform.newPwd.value.trim();
	        let newPwdCheck = myform.newPwdCheck.value.trim();
	    	
	    	let email1 = myform.email1.value.trim();
	    	let email2 = myform.email2.value;
	    	let email = email1 + "@" + email2;
	    	
	    	let residence = myform.residence.value;
	
	    	let tel1 = myform.tel1.value;
	    	let tel2 = myform.tel1.value.trim();
	    	let tel3 = myform.tel1.value.trim();
	    	let tel = tel1 + "-" + tel2 + "-" + tel3;
	
	        let regPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&^])[A-Za-z\d@$!%*#?&^]{4,30}$/;
			let regName = /^[가-힣a-zA-Z]+$/;
		    let regNickName = /^[a-zA-Z0-9가-힣]+$/;
		    let regTel = /^010-\d{3,4}-\d{4}$/;
		    let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		    
		    if(currentPwd == "") {
		        alert("정보를 수정하시려면 비밀번호를 입력해주세요.");
		        myform.pwd.focus();
		        return false;
		    }
		    else if(currentPwd != "${vo.pwd}") {
		    	alert("비밀번호가 틀렸습니다. 비밀번호를 확인해 주세요.");
		        myform.pwd.focus();
		        return false;
		    }
		    
		    if(newPwd != "" && currentPwd == newPwd) {
		        alert("새 비밀번호는 현재 비밀번호와 다르게 입력해야 합니다.");
		        myform.newPwd.focus();
		        return false;
		    }
			
	    	if(newPwd != "" && newPwd != newPwdCheck) {
	    		alert("입력하신 새 비밀번호와 일치하지 않습니다. 비밀번호를 확인해 주세요.");
	            myform.pwdCheck.focus();
	            return false;
	    	}
			else if(newPwd != "" && !regPwd.test(newPwd)) {
		        alert("비밀번호는 4~30자로 최소 하나의 대문자,소문자,숫자,특수문자를 넣어서 작성해주세요.");
		        myform.pwd.focus();
		        return false;
	      	}
		    
			if(name == "") {
				alert("이름을 입력하세요");
				myform.name.focus();
				return false;
			}
			else if(!regName.test(name)) {
				alert("이름은 한글과 영문대소문자만 사용가능합니다.");
				myform.name.focus();
				return false;
			}
			
			if(nickName == "") {
				alert("닉네임을 입력하세요");
				$("#nickName").focus();
				return false;
			}
			else if(!regNickName.test(nickName)) {
				alert("닉네임은 한글,영문대소문자,숫자만 사용가능합니다.");
				myform.nickName.focus();
				return false;
			}
			
	  		if(tel2 == "" || tel3 == "") {
				alert("전화번호를 입력하세요");
				myform.tel2.focus();
				return false;
	  		}
	  		else if(!regTel.test(tel)) {
				alert("올바른 전화번호 형식을 입력하세요");
				myform.tel2.focus();
				return false;
	  		}
	  		
			if (email1 != "" && !regEmail.test(email)) {
		        alert("올바른 이메일 주소를 입력하세요.");
		        myform.email1.focus();
		        return false;
		    }
	    
	  		// 전송 전에 파일에 관련된 사항들을 체크해준다.=> 프론트체크
	  		let fName = document.getElementById("file").value;
	  		
	  		if(fName.trim() != "") {
	  			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase(); 
		  		let maxSize = 1024 * 1024 * 10;
		  		let fileSize = document.getElementById("file").files[0].size;
		  		
		  		if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'jpeg') {
		  			alert("JPG, JPEG, PNG, GIF 파일만 업로드 가능합니다.");
		  			return false;
		  		}
		  		else if(fileSize > maxSize) {
		  			alert("업로드할 파일의 최대용량은 10Mbyte입니다.");
		  			return false;
		  		}	  			
	  		}			
			
	  	    if(nickName != originalNickName) {
	  	        nickCheckSw = 0;
	  	        nickCheck();
	  	        return false;
	  	    }
	  	    
	  	    if(tel != originalTel) {
	  	        telCheckSw = 0;
	  	        telCheck();
	  	        return false;
	  	    }
	  		
	    	// 아이디/닉네임 중복체크
	    	if(nickCheckSw == 0) {
	    		alert("닉네임 중복체크 버튼을 눌러주세요");
	    		document.getElementById("nickNameBtn").focus();
	    		return false;
	    	}
	        if (telCheckSw == 0) {
	            alert("전화번호 중복체크 버튼을 눌러주세요");
	            document.getElementById("telCheckBtn").focus();
	            return false;
	        }
	        
			myform.email.value = email;
			myform.tel.value = tel;
			
			myform.submit();
	    }
	    
	    function resetChecks() {
	        document.getElementById('nickNameBtn').disabled = true;
	        document.getElementById('telCheckBtn').disabled = true;
	        nickCheckSw = 0;
	        telCheckSw = 0;
	    }
	    
	    // 닉네임 중복체크
	    function nickCheck() {
	    	let nickName = myform.nickName.value;
	    	
	    	if(nickName.trim() == "") {
	    		alert("닉네임을 입력하세요!");
	    		myform.nickName.focus();
	    	}
	    	else if(nickName.trim() == '${sNickName}') {
	    		nickCheckSw = 1;
	    		return false;
	    	}
	    	else {
	    		nickCheckSw = 1;
	    		
		    	$.ajax({
		    		url : "${ctp}/MemberNickCheck.mem",
		    		type : "get",
		    		data : {nickName : nickName},
		    		success:function(res) {
	                    if(res != '0') {
	                        if('${sNickName}'==nickName) {
	                            alert("이전 닉네임(${sNickName}과 똑같은 닉네임입니다.)")
	                        } else {
	                            alert("이미 사용중인 닉네임 입니다. 다시 입력하세요.");
	                        }
	                        myform.nickName.focus();
	                    }
	                    else alert("사용 가능한 닉네임 입니다.");
		    		},
		    		error:function() {
		    			alert("전송 오류!");
		    		}
		    	});
	    	}
	    }
		// 전화번호 중복 체크 함수
	    function telCheck() {
			let tel1 = myform.tel1.value;
			let tel2 = myform.tel2.value.trim();
			let tel3 = myform.tel3.value.trim();
			let tel = tel1 + "-" + tel2 + "-" + tel3;
	      if (tel2 == "" || tel3 == "") {
	        alert("전화번호를 입력하세요!");
	        myform.tel2.focus();
	      } else {
	        $.ajax({
	          url: "MemberTelCheck.mem",
	          type: "post",
	          data: {tel : tel},
	          success: function(res) {
	            if (res !== '0') {
	              alert("이미 사용중인 전화번호입니다. 다시 입력하세요.");
	              myform.tel2.focus();
	            } else {
	              alert("사용 가능한 전화번호입니다.");
	              telCheckSw = 1;
	              $("#telCheckBtn").attr("disabled", true);
					myform.email1.focus();
	            }
	          },
	          error: function() {
	            alert("전송 오류!");
	          }
	        });
	      }
	    }
	    
		window.onload = function() {
		    resetChecks();
		
		    // 이벤트 리스너 추가
		    document.getElementById('nickName').addEventListener('input', function() {
		        document.getElementById('nickNameBtn').disabled = false;
		        nickCheckSw = 0;
		    });
		
		    document.getElementById('tel2').addEventListener('input', function() {
		        document.getElementById('telCheckBtn').disabled = false;
		        telCheckSw = 0;
		    });
		
		    document.getElementById('tel3').addEventListener('input', function() {
		        document.getElementById('telCheckBtn').disabled = false;
		        telCheckSw = 0;
		    });
		};
	    
	    function previewImage() {
	        let file = document.getElementById("file").files[0];
	        let preview = document.getElementById("photoDemo"); // 미리보기 이미지
	        let modalImage = document.getElementById("modalImage"); // 모달 이미지
	
	        if (file) {
	            let imageURL = URL.createObjectURL(file);
	            preview.src = imageURL;
	            modalImage.src = imageURL;
	            preview.style.display = 'block';
	            preview.onload = function() {
	                URL.revokeObjectURL(preview.src);
	            };
	        } else {
	            preview.style.display = 'none';
	        }
	    }
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container">	
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper">
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberMain.mem" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">마이페이지</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberUpdate.mem" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">내 정보 수정</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberBookingList.mem" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">예약 내역</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberWish.mem" aria-expanded="false"><i class="mdi mdi-border-inside"></i><span class="hide-menu">위시리스트</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberComplaint.mem" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu">문의/신고 글</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberMessage.ad" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu">메시지 내역</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberDelete.mem" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu" style="color:orange;">회원탈퇴</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>
		<div class="page-wrapper">
	    	<div class="page-breadcrumb">
	        	<div class="row">
	            	<div class="col-12 d-flex no-block align-items-center">
	                	<h4 class="page-title">내 정보 수정</h4>
	                	<div class="ml-auto text-right">
	                    	<nav aria-label="breadcrumb">
		                        <ol class="breadcrumb">
		                            <li class="breadcrumb-item" style="background-color:white;"><a href="${ctp}/Main">Home</a></li>
		                            <li class="breadcrumb-item active" aria-current="page" style="background-color:white;">마이페이지</li>
		                            <li class="breadcrumb-item active" aria-current="page" style="background-color:white;">내 정보 수정</li>
		                        </ol>
	                    	</nav>
	                	</div>
	            	</div>
	        	</div>
	    	</div>
	  		<form name="myform" method="post" action="MemberUpdateOk.mem" class="was-validated">
	    		<div class="box border border-info rounded p-5">
					<h2 class="text-center">회 원 정 보 수 정</h2>
		    		<br/>
					<div  class="form-group">
						<label for="fName">프로필 사진(파일용량:10MByte이내) : </label><br>
						<img src="${ctp}/images/member/${vo.photo}" id="photoDemo" width="100px"/>
						<input type="file" name="fName" id="file" onchange="previewImage();" class="form-control-file border"/>
	    			</div>
				    <div class="form-group">
						<label for="mid">아이디 : </label>
						<input type="text" class="form-control" id="mid" name="mid" value="${vo.mid}" readonly />
				    </div>
				    <div class="form-group">
						<label for="pwd">현재비밀번호 : </label>
						<input type="password" class="form-control mb-0" id="pwd" placeholder="정보 수정시 비밀번호를 입력하세요" name="pwd" required />
				    </div>
					<div class="form-group">
						<label for="newPwd">새 비밀번호 : </label>
						<input type="password" class="form-control mb-0" id="newPwd" placeholder="바꾸실 비밀번호를 입력하세요." name="newPwd" />
						<div class="invalid-feedback">비밀번호는 4~30자로 최소 하나의 대문자,소문자,숫자,특수문자를 넣어서 작성해주세요.</div>
					</div>
					<div class="form-group">
						<label for="newPwdCheck">새 비밀번호 확인 : </label>
						<input type="password" class="form-control mb-0" id="newPwdCheck" name="newPwdCheck" />
					</div>
					<div class="form-group">
						<label for="name">성명 :</label>
						<input type="text" class="form-control" id="name" value="${vo.name}" name="name" required />
					</div>
					<div class="form-group">
						<label for="nickName">닉네임 : &nbsp; &nbsp;<input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-info btn-sm" onclick="nickCheck()"/></label>
						<input type="text" class="form-control" id="nickName" value="${vo.nickName}" name="nickName" required />
					</div>
					<div class="form-group">
						<label for="tel2">전화번호 : &nbsp; &nbsp;</label><input type="button" value="연락처 중복체크" id="telCheckBtn" class="btn btn-info btn-sm" onclick="telCheck()"/>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
							    <select name="tel1" id="tel1" class="custom-select">
							      	<option value="010" selected>010</option>
							    </select>
							</div>
							<span class="mt-3">&nbsp;&nbsp; - &nbsp;&nbsp;</span>
							<input type="text" value="${tel2}" name="tel2" id="tel2" size=4 maxlength=4 class="form-control" required />
							<span class="mt-3">&nbsp;&nbsp; - &nbsp;&nbsp;</span>
							<input type="text" value="${tel3}" name="tel3" id="tel3" size=4 maxlength=4 class="form-control" required />
						</div>
					</div>
				    <div class="form-group">
				      	<label for="email1">Email address:</label>
			        	<div class="input-group mb-3">
			        	<c:set var="email" value="${fn:split(vo.email,'@')}" />
				          	<input type="text" class="form-control mr-2" id="email1" name="email1" value="${email[0]}" required />
				          	<div class="input-group-append ml-2">
					            <select name="email2" class="custom-select mt-1">
									<option value="naver.com" ${email[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>
									<option value="hanmail.net" ${email[1] == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
									<option value="gmail.com" ${email[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
									<option value="nate.com" ${email[1] == 'nate.com' ? 'selected' : ''}>nate.com</option>
									<option value="yahoo.com" ${email[1] == 'yahoo.com' ? 'selected' : ''}>yahoo.com</option>
					            </select>
				          	</div>
			        	</div>
				    </div>
				    <div class="form-group">
				      	<label for="sample6_sido">거주지('특별시/광역시/도'만 표시됩니다) : </label>
				      	<div class="input-group">
					   		<input type="text" name="residence" id="sample6_sido" value="${vo.residence}" size="40" class="form-control">
			        	<div class="input-group-append">
				       		<input type="button" onclick="sample6_execDaumPostcode()" value="지역 찾기" class="btn btn-info mt-1">
			        	</div>
				      </div>
				    </div>
				    <div class="form-group">
				      	<label for="content">자기소개</label>
				      	<textarea rows="5" class="form-control" id="content" name="content">${vo.content}</textarea>
				    </div>
	    			<div class="form-group">
	      				<div class="form-check-inline">
		        			<span class="input-group-text">정보공개 여부</span>  &nbsp; &nbsp;
					        <label class="form-check-label">
					          	<input type="radio" class="form-check-input" name="userInfo" ${vo.userInfo == '공개' ? 'checked' : ''} />공개
					        </label>
	  					</div>
		      			<div class="form-check-inline">
							<label class="form-check-label">
							  	<input type="radio" class="form-check-input" name="userInfo" ${vo.userInfo == '비공개' ? 'checked' : ''} />비공개
							</label>
		      			</div>
	    			</div>
				    <div class="from-group d-flex text-center mb-2">
					    <button type="button" class="genric-btn success radius mr-2" onclick="fCheck()" style="font-size:1em;">회원정보 수정</button>
					    <button type="reset" class="genric-btn radius default mr-2" style="font-size:1em;">다시작성</button>
					    <button type="button" class="genric-btn primary radius" onclick="location.href='MemberMain.mem';" style="font-size:1em;">돌아가기</button>
				    </div>
				    <input type="hidden" name="email" />
				    <input type="hidden" name="tel" />
	    		</div>
			</form>
		</div>
	</div>
	<p><br/></p>
	<div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="imageModalLabel">프로필 사진 미리보기</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img id="modalImage" src="" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/include/footer.jsp" />
	<script src="js/admin/jquery-ui.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/admin/perfect-scrollbar.jquery.min.js"></script>
    <script src="js/admin/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="js/admin/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/admin/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="js/admin/custom.min.js"></script>
    <!-- this page js -->
    <script src="js/admin/moment.min.js"></script>
</body>
</html>