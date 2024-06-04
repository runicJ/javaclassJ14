<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Travelog Input</title>
	<%@ include file = "/include/bs4.jsp" %>
  <script>
    'use strict';
    
    let cnt = 1;
    
    function fCheck() {
    	let fName1 = document.getElementById("fName1").value;
    	let maxSize = 1024 * 1024 * 30;
    	let title = $("#title").val();
    	
    	if(title.trim() == "") {
    		alert("파일의 제목을 입력하세요");
    		return false;
    	}
    	else if(fName1.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	
    	// 파일 사이즈와 확장자 체크하기
    	let fileSize = 0;
    	for(let i=1; i<=cnt; i++) {
    		let imsiName = 'fName' + i;  // id 첫번째 것
    		if(isNaN(document.getElementById(imsiName))) {  // isNaN 숫자가 아니냐? 즉 문자냐? 문자면 값을 가져와서 밑에 누적하고 있음
    			let fName = document.getElementById(imsiName).value;
    			if(fName != "") {
    				fileSize += document.getElementById(imsiName).files[0].size;
			    	let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			    	if(ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png' && ext != 'zip' && ext != 'hwp' && ext != 'ppt' && ext != 'pptx' && ext != 'doc' && ext != 'pdf' && ext != 'xlsx' && ext != 'txt') {
			    		alert("업로드 가능한 파일은 'jpg/jpeg/gif/png/zip/hwp/ppt/pptx/doc/pdf/xlsx/txt'만 가능합니다.");
			    		return false;
			    	}
    			}
    		}
    	}
    		
    	if(fileSize > maxSize) {
    		alert("업로드할 1개 파일의 최대용량은 30MByte입니다.");
    		return false;
    	}
    	else {
    		blogInputForm.submit();
    	}	
    }
    
    // 파일 박스 추가하기
    function fileBoxAppend() {
    	cnt++;
    	let fileBox = '';
    	fileBox += '<div id="fBox'+cnt+'">';
    	fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control-file border mb-2 mr-2" style="float:left; width:85%;" />';
    	fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger btn-sm mb-2 ml-2" style="width:10%;" />';
    	fileBox += '</div>';
    	$("#fileBox").append(fileBox);		// html(), text(), append()
    }
    
    // 파일 박스 삭제
    function deleteBox(cnt) {
    	$("#fBox"+cnt).remove();
    	cnt--;
    }
  </script>
  <style>
  	label {
  		font-size: 1.2em;
  	}
  </style>
</head>
<body>안녕하세요. Serene Nest 관리자입니다.
이곳에 오신 것을 환영합니다!
여러분도 알다시피 이 사이트는 인구소멸지역을 대상으로,
지역홍보를 목적으로 만들어졌습니다.
추천이든 기록이든 좋습니다.
여러분의 추억을 이곳에 남겨주세요:)
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
    <div class="justify-content-center">
        <form name="blogInputForm" method="post" action="BlogInputOk.bl" class="was-validated" enctype="multipart/form-data">
        <h2 class=" mb-5 heading text-center">Travelog 등록하기</h2>
          <div class="row form-group">
            <div class="col-md-6 mb-3 mb-md-0">
              <label>작성자 아이디<span style="font-size:0.8em;color:green;">(Travelog는 작성자의 닉네임으로 게시됩니다.)</span></label>
              <input type="text" name="mid" id="mid" value="${sMid}" class="form-control" readonly>
            </div>
            <div class="col-md-6">
              <label for="residence">지역</label>
              <input type="text" name="residence" id="residence" class="form-control" placeholder=" ex) 전라남도 해남군 ">
            </div>
          </div>
          <div class="row form-group">
            <div class="col-md-2">
              <label for="sort">분류</label> 
	            <select name="sort" class="custom-select">
	              <option value="여행기록" selected>여행기록</option>
	              <option value="여행지추천">여행지추천</option>
	              <option value="맛집소개">맛집소개</option>
	              <option value="지역홍보">지역홍보</option>
	              <c:if test="${sMid == 'admin'}"><option value="공지사항">공지사항</option></c:if>
	            </select>
            </div>
            <div class="col-md-10">
              <label for="title">제목</label> 
              <input type="text" name="title" id="title" class="form-control" required>
            </div>
          </div>
          <div class="row form-group">
            <div class="col-md-12">
              	<div>
	              	<label for="file">자료 등록</label>
	            	<input type="button" value="자료추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm" style="float:right" />
			    </div>
	    		<input type="file" name="fName1" id="fName1" class="form-control-file border mb-2" />
			    <div id="fileBox"></div>
            </div>
          </div>
          <div class="row form-group">
            <div class="col-md-12">
              <label for="tContent">내용</label> 
              <textarea name="tContent" id="tContent" cols="30" rows="7" class="form-control"></textarea>
            </div>
          </div>
		    <div class="row form-group">
		    	<div class="col-md-12">
			    	<label class="mr-2" for="openSw">공개여부</label>
			    	<input type="radio" name="openSw" value="공개" checked /> 공개 &nbsp;&nbsp;
			    	<input type="radio" name="openSw" value="비공개" /> 비공개
		    	</div>
		    </div>
          <div class="row form-group text-center">
            <div class="col-md-12">
              <input type="button" value="새글 등록" onclick="fCheck()" class="btn btn-success mr-3">
              <input type="button" value="취소" onclick="location.href='BlogList.bl';" class="btn btn-warning">
            </div>
          </div>
	    <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" />
	    <input type="hidden" name="nickName" value="${sNickName}" />
	    </form>
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>