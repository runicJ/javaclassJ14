<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Stay Update</title>
   	<%@ include file = "/include/bs4.jsp" %>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script> 
    <script>
	    'use strict';
	    let cnt = 1;
	    
	    function fCheck() {
	    	let fName1 = stayInputForm.fName1.value;
	    	let maxSize = 1024 * 1024 * 30;
	    	let	sort1 = stayInputForm.sort1.value;
	    	let	sort2 = stayInputForm.sort2.value;
	    	let	sort3 = stayInputForm.sort3.value;
    		let sort = sort1 + "/" + sort2 + "/" + sort3;
	    	let sName = $("#sName").val();
	    	let postcode = stayInputForm.postcode.value + " ";
	    	let roadAddress = stayInputForm.roadAddress.value + " ";
	    	let detailAddress = stayInputForm.detailAddress.value + " ";
	    	let extraAddress = stayInputForm.extraAddress.value + " ";
	    	let address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
	    	let sContent = stayInputForm.sContent.value;
	    	let residence = stayInputForm.residence.value;
	    	let guestMax = stayInputForm.guestMax.value;
	    	let price = stayInputForm.price.value;
	    	let bed = stayInputForm.bed.value;
	    	let toilet = stayInputForm.toilet.value;
	    	
	    	if(fName1.trim() == "") {
	    		alert("업로드할 파일을 선택하세요");
	    		return false;
	    	}

	    	if(sName.trim() == "") {
	    		alert("숙소명을 입력하세요");
	    		return false;
	    	}
	    	
	    	if(postcode.trim() == "") {
	    		alert("숙소 주소를 입력하세요");
	    		return false;
	    	}
	    	
	    	if(sContent.trim() == "") {
	    		alert("숙소 설명을 입력하세요");
	    		return false;
	    	}
	    	
	    	if(residence.trim() == "") {
	    		alert("지역 구분을 선택하세요");
	    		return false;
	    	}
	    	
	    	if(!guestMax > 0) {
	    		alert("최대 인원을 확인해 주세요");
	    		return false;
	    	}
	    	
	    	if(sort1.trim() == "" || sort2.trim() == "" || sort3.trim() == "" ) {
	    		alert("숙소 분류를 선택하세요");
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
				    	if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'zip' && ext != 'hwp' && ext != 'ppt' && ext != 'pptx' && ext != 'doc' && ext != 'pdf' && ext != 'xlsx' && ext != 'txt') {
				    		alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/ppt/pptx/doc/pdf/xlsx/txt'만 가능합니다.");
				    		return false;  // 확장자가 하나라도 안맞으면 탈주
				    	}
	    			}
	    		}
	    	}
	    		
	    	if(fileSize > maxSize) {
	    		alert("업로드할 1개 파일의 최대용량은 30MByte입니다.");
	    		return false;
	    	}
	    	
    		stayInputForm.sort.value = sort;
    		stayInputForm.address.value = address;
    		
    		stayInputForm.submit();
	    }
	    
	    // 파일 박스 추가하기
	    function fileBoxAppend() {
	    	cnt++;
	    	let fileBox = '';
	    	fileBox += '<div id="fBox'+cnt+'">';
	    	fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control-file border mb-2" style="float:left; width:85%;" />';
	    	fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger btn-sm mb-2 ml-2" style="width:10%;" />';
	    	fileBox += '</div>';
	    	$("#fileBox").append(fileBox);
	    }
	    
	    // 파일 박스 삭제
	    function deleteBox(cnt) {
	    	$("#fBox"+cnt).remove();
	    	cnt--;
	    }
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container">
    <div class="card mt-5 p-2">
        <div class="card-body">
		<form name="stayInputForm" action="StayInputOk.st" method="post" enctype="multipart/form-data">
			<h2 class="text-center mb-3">정보 수정하기</h2>
			<div class="card mb-3">
		        <div class="card-body">
		            <p class="card-title text-center control-label col-form-label" style="font-size:20px;font-weight:bolder;">- 숙소 정보 -</p>
		            <div class="form-group row">
		                <span class="col-md-3"></span>
		                <div class="col-md-9">
		                	<label class="custom-control-inline">숙소유형</label>
		                    <div class="custom-control custom-radio custom-control-inline">
		                        <input type="radio" name="sort1" id="sort11" value="주택" class="custom-control-input">
		                        <label class="custom-control-label" for="sort11">주택</label>
		                    </div>
		                    <div class="custom-control custom-radio custom-control-inline">
		                        <input type="radio" name="sort1" id="sort12" value="아파트" class="custom-control-input">
		                        <label class="custom-control-label" for="sort12">아파트</label>
		                    </div>
		                    <div class="custom-control custom-radio custom-control-inline">
		                        <input type="radio" name="sort1" id="sort13" value="한옥" class="custom-control-input">
		                        <label class="custom-control-label" for="sort13">한옥</label>
		                    </div>
	                	</div>
	                </div>
		            <div class="form-group row">
		               	<label class="col-md-3 text-right control-label col-form-label">숙소 분류</label>
		                <div class="col-md-9">
		                	<label class="custom-control-inline">사용공간</label>
		                    <div class="custom-control custom-radio custom-control-inline">
		                        <input type="radio" name="sort2" id="sort21" value="독채" class="custom-control-input">
		                        <label class="custom-control-label" for="sort21">독채</label>
		                    </div>
		                    <div class="custom-control custom-radio custom-control-inline">
		                        <input type="radio" name="sort2" id="sort22" value="독채" class="custom-control-input">
		                        <label class="custom-control-label" for="sort22">방</label>
		                    </div>
		                    <div class="custom-control custom-radio custom-control-inline">
		                        <input type="radio" name="sort2" id="sort23" value="공용숙소" class="custom-control-input">
		                        <label class="custom-control-label" for="sort23">공용숙소</label>
		                    </div>
	                	</div>
	                </div>
		            <div class="form-group row">
		                <span class="col-md-3"></span>
		                <div class="col-md-9">
		                	<label class="custom-control-inline">주변환경</label>
		                    <div class="custom-control custom-radio custom-control-inline">
		                        <input type="radio" name="sort3" id="sort31" value="해변" class="custom-control-input">
		                        <label class="custom-control-label" for="sort31">해변</label>
		                    </div>
		                    <div class="custom-control custom-radio custom-control-inline">
		                        <input type="radio" name="sort3" id="sort32" value="산" class="custom-control-input">
		                        <label class="custom-control-label" for="sort32">산</label>
		                    </div>
		                    <div class="custom-control custom-radio custom-control-inline">
		                        <input type="radio" name="sort3" id="sort33" value="도심" class="custom-control-input">
		                        <label class="custom-control-label" for="sort33">도심</label>
		                    </div>
	                	</div>
		            </div>
		           	<div class="form-group row">
		                <label for="sName" class="col-sm-3 text-right control-label col-form-label">숙소명</label>
		                <div class="col-sm-9">
		                    <input type="text" name="sName" class="form-control" id="sName" placeholder="숙소명을 입력하세요.">
		                </div>
		            </div>
				    <div class="form-group row">
				     <label for="address" class="col-md-3 text-right control-label col-form-label">주소</label>
				      <div class="input-group col-sm-9">
				        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
				        <div class="input-group-append">
				          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-info">
				        </div>
				      </div>
				      <span class="col-md-3"></span>
				      <div class="input-group col-sm-9">
				      	<input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
				      </div>
				      <span class="col-md-3"></span>
				      <div class="input-group col-sm-9">
				        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
				        <div class="input-group-append">
				          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
				        </div>
				      </div>
				    </div>
		            <div class="form-group row">
		            	<label for="sContent" class="col-md-3 text-right control-label col-form-label">숙소 설명</label>
		                <div class="col-sm-9">
		                    <textarea class="form-control" name="sContent" placeholder="상세설명을 입력하세요"></textarea>
		                </div>
		          	</div>
		            <div class="form-group row">
		            	<label for="residence" class="col-md-3 text-right control-label col-form-label">지역 구분</label>
		                <div class="input-group col-sm-9">
						    <select name="residence">
						      <option value="Gang">강원도</option>
						      <option value="Chung">충청도</option>
						      <option value="Gyeong">경상도</option>
						      <option value="Jeol">전라도</option>
						    </select>
		                </div>
		          	</div>
		            <div class="form-group row">
		            	<label for="guestMax" class="col-md-3 text-right control-label col-form-label">최대인원</label>
		                <div class="col-sm-9">
		                    <input type="number" name="guestMax" id="guestMax" class="form-control">
		                </div>
		          	</div> 	
		            <div class="form-group row">
		            	<label for="price" class="col-md-3 text-right control-label col-form-label">가격</label>
		                <div class="col-sm-9">
		                    <input type="number" name="price" id="price" class="form-control">
		                </div>
		          	</div>
		            <div class="form-group row">
		                <label class="col-md-3 text-right control-label col-form-label">숙소 사진</label>
		                <div class="col-md-9">
		                    <div class="custom-file">
		                        <input type="file" class="fName1" name="fName1" id="validatedCustomFile" required>
	                    		<input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm" />
		                    </div>
	                        <div id="fileBox"></div>
		                </div>
		            </div>
		        </div>
		        <hr>
		        <p class="card-title text-center control-label col-form-label" style="font-size:20px;font-weight:bold;">- 숙소 옵션 -</p>
	        	<div class="form-group row">
	            	<label for="bed" class="col-md-3 text-right control-label col-form-label">침대</label>
	                <div class="col-sm-8">
	                    <input type="number" name="bed" id="bed" class="form-control">
	                </div>
	          	</div>
	        	<div class="form-group row">
	            	<label for="toilet" class="col-md-3 text-right control-label col-form-label">화장실</label>
	                <div class="col-sm-8">
	                    <input type="number" name="toilet" id="toilet" class="form-control">
	                </div>
	          	</div>
	            <div class="form-group row">
	                <label class="col-md-3 text-right control-label col-form-label">기타 시설</label>
	                <div class="col-md-9">
	                    <div class="custom-control custom-checkbox mr-sm-2">
	                        <input type="checkbox" name="facility" id="wifi" class="custom-control-input" value="wifi">
	                        <label class="custom-control-label" for="wifi">Wi-Fi</label>
	                    </div>
	                    <div class="custom-control custom-checkbox mr-sm-2">
	                        <input type="checkbox" name="facility" id="ac" class="custom-control-input" value="ac">
	                        <label class="custom-control-label" for="ac">에어컨</label>
	                    </div>
	                    <div class="custom-control custom-checkbox mr-sm-2">
	                        <input type="checkbox" name="facility" id="parking" class="custom-control-input" value="parking">
	                        <label class="custom-control-label" for="parking">주차장</label>
	                    </div>
	                    <div class="custom-control custom-checkbox mr-sm-2">
	                        <input type="checkbox" name="facility" id="pet" class="custom-control-input" value="pet">
	                        <label class="custom-control-label" for="pet">반려동물 동반</label>
	                    </div>
	                    <div class="custom-control custom-checkbox mr-sm-2">
	                        <input type="checkbox" name="facility" id="kitchen" class="custom-control-input" value="kitchen">
	                        <label class="custom-control-label" for="kitchen">부엌</label>
	                    </div>
	                    <div class="custom-control custom-checkbox mr-sm-2">
	                        <input type="checkbox" name="facility" id="washing" class="custom-control-input" value="washing">
	                        <label class="custom-control-label" for="washing">세탁기</label>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="text-center">
                <input type="button" class="btn btn-primary mr-2" value="등록하기" onclick="fCheck()" />
                <button type="button" class="btn btn-warning" onclick="StayDatail.st?sIdx=${vo.sIdx}">돌아가기</button>
	        </div>
	        <input type="hidden" name="sort" />
    		<input type="hidden" name="address" />
		</form>
	</div>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>