<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Join Page</title>
  <jsp:include page="/include/bs4.jsp" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <style>
		body {font-family: Arial, Helvetica, sans-serif;}
		* {box-sizing: border-box}
		
		/* Full-width input fields */
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
		
		/* Extra styles for the cancel button */
		.cancelbtn {
		  padding: 14px 20px;
		  background-color: #f44336;
		}
		
		/* Float cancel and signup buttons and add an equal width */
		.cancelbtn, .signupbtn {
		  float: left;
		  width: 50%;
		}
		
		/* Add padding to container elements */
		.container {
		  padding: 16px;
		}
		
		/* Clear floats */
		.clearfix::after {
		  content: "";
		  clear: both;
		  display: table;
		}
		
		/* Change styles for cancel button and signup button on extra small screens */
		@media screen and (max-width: 300px) {
		  .cancelbtn, .signupbtn {
		     width: 100%;
		  }
		}
	</style>
  <script>
    'use strict';
    
    let idCheckSw = 0;  // 버튼 활성화 => 1로 바꾸고 아이디 고쳐도 0으로
    let nickCheckSw = 0;  // 둘다 1이 되어 있어야 submit 되도록
    
    /* let mid = $("#mid").val().trim();
		let pwd = $("#pwd").val().trim();
		let nickName = myform.nickName.value.trim();
		let name = $("#name").val().trim();
		let gender = myform.gender.value;
		
		if(mid == "") {
			alert("아이디를 입력하세요");
			$("#mid").focus();
			return false;
		}
		else if(pwd == "") {
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return false;
		}  		
		else if(nickName == "") {
			alert("닉네임을 입력하세요");
			$("#nickName").focus();
			return false;
		}  		
		else if(name == "") {
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}  		
		else if(email1 == "") {
			alert("이메일을 입력하세요");
			$("#email1").focus();
			return false;
		} */
    
    function fCheck() {
    	// 유효성 검사.....(정규식-버튼체크-묶어서-담아서 submit)
    	// 아이디,닉네임,성명,이메일,홈페이지,전화번호,비밀번호 등등....
    	
    	// 정규식을 이용한 유효성검사처리.....
		let regMid = /^[a-zA-Z0-9_]{4,20}$/;	// 아이디는 4~20의 영문 대/소문자와 숫자와 밑줄 가능
		let regName = /^[가-힣a-zA-Z]+$/;				// 이름은 한글/영문 가능
	    let regNickName = /^[가-힣]+$/;					// 닉네임은 한글만 가능
      
/*       let regMid = /^[a-zA-Z0-9_]{4,20}$/;
		  let regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W_]).{4,20}$/; 
      let regNickName = /^[a-zA-Z0-9가-힣]{2,10}$/;
      let regName = /^[a-zA-Z가-힣]{2,10}$/; 
      let regEmail = /^[a-zA-Z0-9]([-_]?[a-zA-Z0-9])*$/i;
      let regHomePage = /(https?:\/\/)?([a-zA-Z\d-]+)\.([a-zA-Z\d-]{2,8})([\/\w\.-]*)*\/?$/;
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/; */
      
/*       let regMid = /^[\w]{4,20}$/;
      let regPwd = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{4,20}$/;
      let regNickName = /^[가-힣\w]{2,7}$/;
      let regName = /^[가-힣]{2,5}$/;
      let regEmail = /^[a-zA-Z0-9]([-_]?[a-zA-Z0-9])*$/;
      let regHomePage = /(https?:\/\/)?([a-zA-Z\d-]+)\.([a-zA-Z\d-]{2,8})([\/\w\.-]*)*\/?$/
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/; */
      
/*       function fCheck() {
        // 유효성 검사.....
        // 아이디,닉네임,성명,이메일,홈페이지,전화번호,비밀번호 등등....
        
        // 검사를 끝내고 필요한 내역들을 변수에 담아 회원가입처리한다.
        
        let email1 = myform.email1.value.trim();
        let email2 = myform.email2.value;
        let email = email1 + '@' + email2;
        
        let tel1 = myform.tel1.value;
        let tel2 = myform.tel2.value.trim();
        let tel3 = myform.tel3.value.trim();
        let tel = tel1 + '-' + tel2 + '-' + tel3;
        
        let postcode = myform.postcode.value + " ";
        let roadAddress = myform.roadAddress.value + " ";
        let detailAddress = myform.detailAddress.value + " ";
        let extraAddress = myform.extraAddress.value + " ";
        let address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
        
        // 정규식을 이용한 유효성 검사처리
        let pwd = myform.pwd.value.trim();
        let pwdReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&^])[A-Za-z\d@$!%*#?&^]{8,16}$/;
        
        let name = myform.name.value.trim();
        let nameReg = /^[가-힣]{2,4}$/;
        
        let emailReg = /^[a-zA-Z0-9-_]{4,12}$/;
        let tel2Reg = /^[\d]{3,4}$/;
        let tel3Reg = /^[\d]{4,4}$/;
        
        let homePage = myform.homePage.value.trim();
        let homePageReg = /^https?:\/\/(.+)?\.([a-zA-Z]+)?\/?([\?#].*)?$/;
        
        if(!pwdReg.test(pwd)){
            document.getElementById("hidden-pwd-msg").style.display = "block";
            myform.pwd.value = "";
            myform.pwd.focus();
        }
        else if(!nameReg.test(name)){
            document.getElementById("hidden-pwd-msg").style.display = "none";
            document.getElementById("hidden-name-msg").style.display = "block";
            myform.name.value = "";
            myform.name.focus();
        }
        else if(!emailReg.test(email1)){
            document.getElementById("hidden-pwd-msg").style.display = "none";
            document.getElementById("hidden-name-msg").style.display = "none";
            document.getElementById("hidden-email-msg").style.display = "block";
            myform.email1.value = "";
            myform.email1.focus();
        }
        else if(!tel2Reg.test(tel2)){
            document.getElementById("hidden-pwd-msg").style.display = "none";
            document.getElementById("hidden-name-msg").style.display = "none";
            document.getElementById("hidden-email-msg").style.display = "none";
            document.getElementById("hidden-tel-msg").style.display = "block";
            myform.tel2.value = "";
            myform.tel2.focus();
        }
        else if(!tel3Reg.test(tel3)){
            document.getElementById("hidden-pwd-msg").style.display = "none";
            document.getElementById("hidden-name-msg").style.display = "none";
            document.getElementById("hidden-email-msg").style.display = "none";
            document.getElementById("hidden-tel-msg").style.display = "block";
            myform.tel3.value = "";
            myform.tel3.focus();
        }
        else if(!homePageReg.test(homePage)){
            document.getElementById("hidden-pwd-msg").style.display = "none";
            document.getElementById("hidden-name-msg").style.display = "none";
            document.getElementById("hidden-email-msg").style.display = "none";
            document.getElementById("hidden-tel-msg").style.display = "none";
            document.getElementById("hidden-homePage-msg").style.display = "block";
            myform.homePage.value = "";
            myform.homePage.focus();
        }
        else if(idCheckSw == 0){
            alert("아이디 중복체크를 해주세요!");
            document.getElementById("midBtn").focus();
        }
        else if(nickCheckSw == 0) {
            alert("닉네임 중복체크를 해주세요!");
            document.getElementById("nickNameBtn").focus();
        }
        else {
            document.getElementById("hidden-homePage-msg").style.display = "none";
            myform.email.value = email;
            myform.tel.value = tel;
            myform.address.value = address;
            $("#mid").removeAttr("disabled");
            $("#nickName").removeAttr("disabled");
            
            myform.submit();
        }
    }
    
    // 아이디 중복체크
    function idCheck() {
        let mid = myform.mid.value;
        let midReg = /^[a-zA-Z0-9-_]{4,12}$/;
        
        if(mid.trim() == ""){
            alert("아이디를 입력하세요!");
            myform.mid.focus();
        }
        else if(!midReg.test(mid)){
            document.getElementById("hidden-mid-msg").style.display = "block";
            myform.mid.value = "";
            myform.mid.focus();
        }
        else {
            document.getElementById("hidden-mid-msg").style.display = "none";
            $.ajax({
                url : "${ctp}/MemberIdCheck.mem",
                type : "get",
                data : {mid : mid},
                success : function(res) {
                    if(res != 0){
                        alert("이미 사용중인 아이디입니다.");
                        myform.mid.focus();
                    }
                    else {
                        let ans = confirm‎("사용 가능한 아이디입니다.\n사용하시겠습니까?");
                        if(ans) {
                            idCheckSw = 1;
                            $("#mid").attr("disabled", true);
                            $("#midBtn").attr("disabled", true);
                        }
                    }
                },
                error : function() {
                    alert("전송 오류");
                }
            });
        }
    }
    
    // 닉네임 중복체크
        function nickCheck() {
        let nickName = myform.nickName.value;
        let nickNameReg = /^[a-zA-Z가-힣0-9]{1,8}$/;
        
        if(nickName.trim() == ""){
            alert("닉네임을 입력하세요!");
            myform.nickName.focus();
        }
        else if(!nickNameReg.test(nickName)){
            document.getElementById("hidden-nickName-msg").style.display = "block";
            myform.nickName.value = "";
            myform.nickName.focus();
        }
        else {
            document.getElementById("hidden-nickName-msg").style.display = "none";
            $.ajax({
                url : "${ctp}/MemberNickCheck.mem",
                type : "get",
                data : {nickName : nickName},
                success : function(res) {
                    if(res != 0){
                        alert("이미 사용중인 닉네임입니다.");
                        myform.nickName.focus();
                    }
                    else {
                        let ans = confirm‎("사용 가능한 닉네임입니다.\n사용하시겠습니까?");
                        if(ans) {
                            nickCheckSw = 1;
                            $("#nickName").attr("disabled", true);
                            $("#nickNameBtn").attr("disabled", true);
                        }
                    }
                },
                error : function() {
                    alert("전송 오류");
                }
            });
        }
    }
    
    // 다시작성 눌렀을 때 버튼 활성화
    function resetForm() {
        $("#nickName").removeAttr("disabled");
        $("#nickNameBtn").removeAttr("disabled");
        $("#mid").removeAttr("disabled");
        $("#midBtn").removeAttr("disabled");
        myform.reset();
        $("#mid").focus();
    } */
    	
    	// 검사를 끝내고 필요한 내역들을 변수에 담아 회원가입 처리한다.
    	// 변수에 저장(위에서 해도됨)
    	let mid = myform.mid.value.trim();
    	let pwd = myform.pwd.value.trim();
    	let name = myform.name.value;
    	let nickName = myform.nickName.value;
    	
    	let email1 = myform.email1.value.trim();
    	let email2 = myform.email2.value;  // 콤보상자 선택 trim()안해도 됨
    	let email = email1 + "@" + email2;  // 결합 , 구분자 넣기
    	
    	let residence = myform.residence.value;
    	
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	else if(pwd.length < 4 && pwd.length > 20) {
        alert("비밀번호는 4~20 자리로 작성해주세요.");
        myform.pwd.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myform.name.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
  		// 이메일 주소형식체크
  		
  		// 전화번호 형식 체크
  		let tel1 = myform.tel1.value;
    	let tel2 = myform.tel2.value.trim();
    	let tel3 = myform.tel3.value.trim();
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
    	
  		if(tel2 != "" && tel3 != "") {
  			// 전화번호 형식 정규화 체크
  		}
  		else {
  			tel2 = " ";
  			tel3 = " ";
  			tel = tel1 + "-" + tel2 + "-" + tel3;
  		}
  		
  		// 전송 전에 파일에 관련된 사항들을 체크해준다.=> 프론트체크
  		let fName = document.getElementById("file").value;
  		
  		if(fName.trim() != "") {
  			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase(); 
	  		let maxSize = 1024 * 1024 * 5;
	  		let fileSize = document.getElementById("file").files[0].size;
	  		
	  		if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'jpeg') {
	  			alert("그림파일만 업로드 가능합니다.");
	  			return false;
	  		}
	  		else if(fileSize > maxSize) {
	  			alert("업로드할 파일의 최대용량은 5Mbyte입니다.");
	  			return false;
	  		}	  			
  		}
  		else return false;
  		
    	// 아이디/닉네임 중복체크
    	if(idCheckSw == 0) {
    		alert("아이디 중복체크 버튼을 눌러주세요");
    		document.getElementById("midBtn").focus();
    	}
    	else if(nickCheckSw == 0) {
    		alert("닉네임 중복체크 버튼을 눌러주세요");
    		document.getElementById("nickNameBtn").focus();
    	}
    	else {
    		myform.email.value = email;  // hidden에 묶어서 보내는거 담기
    		myform.tel.value = tel;
    		myform.address.value = address;
    		
    		myform.submit();  // MemberJoinOk로 넘김
    	}
    }
		
    // 아이디 중복체크
    function idCheck() {
    	let mid = myform.mid.value;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요!");
    		myform.mid.focus();
    	}
    	else {
    		idCheckSw = 1;
    		
	    	$.ajax({
	    		url : "${ctp}/MemberIdCheck.mem",
	    		type : "get",
	    		data : {mid : mid},
	    		success:function(res) {
	    			if(res != '0') {
	    				alert("이미 사용중인 아이디입니다. 다시 입력하세요.");
	    				myform.mid.focus();
	    			}
	    			else {
	    				alert("사용 가능한 아이디입니다.");
	    				$("#midBtn").attr("disabled",true);
	    				myform.pwd.focus();
	    			}
	    		},
	    		error:function() {
	    			alert("전송 오류!");
	    		}
	    	});
    	}
    }
    
    // 닉네임 중복체크
    function nickCheck() {
    	let nickName = myform.nickName.value;
    	
    	if(nickName.trim() == "") {
    		alert("닉네임을 입력하세요!");
    		myform.nickName.focus();
    	}
    	else {
    		nickCheckSw = 1;
    		
	    	$.ajax({
	    		url : "${ctp}/MemberNickCheck.mem",
	    		type : "get",
	    		data : {nickName : nickName},
	    		success:function(res) {
	    			if(res != 0) {
	    				alert("이미 사용중인 닉네임입니다. 다시 입력하세요.");
	    				myform.nickName.focus();
	    			}
	    			else {
	    				alert("사용 가능한 닉네임입니다.");
	    				$("#nickNameBtn").attr("disabled",true);
	    				myform.name.focus();
	    			}
	    		},
	    		error:function() {
	    			alert("전송 오류!");
	    		}
	    	});
    	}
    }
    
    // 입력창 누르면 스위치 리셋...?
    window.onload = function(){
    	mid.addEventListener('click',function(){
    		idCheckSw = 0;
    		$("#midBtn").removeAttr("disabled");
    	});
    	nickName.addEventListener('click',function(){
    		nickCheckSw = 0;
    		$("#nickNameBtn").removeAttr("disabled");
    	});
    }
    
    // 선택된 사진 미리보기
    function imgCheck(e) {
    	if(e.files && e.files[0]) {
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			document.getElementById("photoDemo").src = e.target.result;
    		}
    		reader.readAsDataURL(e.files[0]);
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="MemberJoinOk.mem" class="was-validated" enctype="multipart/form-data">  <!-- enctype="multipart/form-data" 잊지말기 -->
    <h2 class="text-center">회 원 가 입</h2>
    <br/>
    <div class="form-group">
      <label for="mid">아이디 : &nbsp; &nbsp;<input type="button" value="아이디 중복체크" id="midBtn" class="btn btn-secondary btn-sm" onclick="idCheck()"/></label>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
    </div>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
    </div>
    <div class="form-group">
      <label for="nickName">닉네임 : &nbsp; &nbsp;<input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" id="nickName" placeholder="별명을 입력하세요." name="nickName" required />
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
            <select name="tel1" class="custom-select">
              <option value="010" selected>010</option>
            </select>-
        </div>
        <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
        <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
      </div>
      <!-- <input type="button" value="연락처 중복체크" id="telBtn" class="btn btn-secondary btn-sm" onclick="telCheck()"/> -->
    </div>
    <div class="form-group">
      <label for="email1">Email address:</label>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
          <div class="input-group-append">
            <select name="email2" class="custom-select">
              <option value="naver.com" selected>naver.com</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="hotmail.com">hotmail.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="nate.com">nate.com</option>
              <option value="yahoo.com">yahoo.com</option>  <!-- 기타(입력) -->
            </select>
          </div>
        </div>
    </div>
    <div class="form-group">
      <label for="sample6_sido">거주지('특별시/광역시/도'만 표시됩니다.)</label>
      <div class="input-group mb-1">
      	<input type="text" name="residence" id="sample6_sido" size="50" class="form-control">
        <div class="input-group-append">
          <input type="button" onclick="sample6_execDaumPostcode()" value="지역 찾기" class="btn btn-secondary">  <!-- 다음api에서 찾는 함수 -->
        </div>
      </div>
    </div>
    <div class="form-group">
      <label for="content">자기소개</label>
      <textarea rows="5" class="form-control" id="content" name="content" placeholder="자기소개를 입력하세요."></textarea>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">정보공개</span>  &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="공개" checked/>공개
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="비공개"/>비공개
        </label>
      </div>
    </div>
    <div class="form-group">
      회원 사진(파일용량:2MByte이내) :
      <input type="file" name="fName" id="file" onchange="imgCheck(this)" class="form-control-file border"/>  <!-- 사진이 바뀔때마다 미리보기 // this로 넣고 e로 체크 -->
      <div><img id="photoDemo" width="100px"/></div>
    </div>
    <div class="from-group">
	    <button type="button" class="btn btn-success btn-sm mr-2" onclick="fCheck()">회원가입</button> &nbsp;
	    <button type="reset" class="btn btn-warning btn-sm mr-2">다시작성</button> &nbsp;
	    <button type="button" class="btn btn-danger btn-sm mr-2" onclick="location.href='MemberLogin.mem';">취소</button>
    </div>
    
    <input type="hidden" name="email" />  <!-- email도 한덩어리로 -->
    <input type="hidden" name="tel" />  <!-- tel1,2,3 한덩어리로 묶어서 보내도록 -->
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>