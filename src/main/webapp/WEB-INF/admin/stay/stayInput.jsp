<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>StayInput</title>
    <%@ include file = "/include/adminHeader.jsp" %>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  <!-- CDN 쓰는 이유는 어차피 웹은 인터넷이 없으면 무의미 -->
  	<script src="${ctp}/js/woo.js"></script>
    <!-- Custom CSS -->
    <link href="${ctp}/setting/css/admin/fullcalendar.min.css" rel="stylesheet" />
    <link href="${ctp}/setting/css/admin/calendar.css" rel="stylesheet" />
    <link href="${ctp}/setting/css/admin/style.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="card">
        <div class="card-body">
            <h5 class="card-title">숙소 등록하기</h5>
            <div class="form-group row">
                <label class="col-md-3 m-t-15">숙소유형</label>
                <div class="col-md-9">
                    <select class="select2 form-control m-t-15" multiple="multiple" style="width:100%; height:36px;">
                        <option>선택</option>
                        <optgroup label="숙소유형">
                            <option value="주택">주택</option>
                            <option value="아파트">아파트</option>
                        </optgroup>
                        <optgroup label="사용공간">
                            <option value="전체">집전체</option>
                            <option value="방">방</option>
                            <option value="공용">공용숙소</option>
                        </optgroup>
                        <optgroup label="주변환경">
                            <option value="해변">해변</option>
                            <option value="산">산</option>
                            <option value="아이">아이동반</option>
                            <option value="한옥">한옥</option>
                            <option value="도심">도심</option>
                        </optgroup>
                    </select>
                </div>
            </div>
           	<div class="form-group row">
                <label for="sName" class="col-sm-3 text-right control-label col-form-label">숙소명</label>
                <div class="col-sm-9">
                    <input type="text" name="sName" class="form-control" id="sName" placeholder="숙소명을 입력하세요.">
                </div>
            </div>
		    <div class="form-group row">
		      <label for="address">주소</label>
		      <div class="input-group mb-1">
		        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">  <!-- postcode : 내가쓰는것 // sample6_postcode : 다음api -->
		        <div class="input-group-append">
		          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">  <!-- 다음api에서 찾는 함수 -->
		        </div>
		      </div>
		      <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
		      <div class="input-group mb-1">
		        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
		        <div class="input-group-append">
		          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
		        </div>
		      </div>
		    </div>
            <div class="form-group row">
            	<label for="cono1" class="col-md-3 text-right control-label col-form-label">Message</label>
                <div class="col-sm-9">
                    <textarea class="form-control" placeholder="상세설명을 입력하세요"></textarea>
                </div>
          	</div>
            <div class="form-group row">
            	<label for="guestCapacity" class="col-md-3 text-right control-label col-form-label">최대인원</label>
                <div class="col-sm-9">
                    <input type="number" name="guestCapacity" id="guestCapacity" class="form-control">
                </div>
          	</div> 	
            <div class="form-group row">
            	<label for="price" class="col-md-3 text-right control-label col-form-label">가격</label>
                <div class="col-sm-9">
                    <input type="number" name="price" id="price" class="form-control">
                </div>
          	</div>
            <div class="form-group row">
                <label class="col-md-3">Checkboxes</label>
                <div class="col-md-9">
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="customControlAutosizing1">
                        <label class="custom-control-label" for="customControlAutosizing1">First One</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="customControlAutosizing2">
                        <label class="custom-control-label" for="customControlAutosizing2">Second One</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="customControlAutosizing3">
                        <label class="custom-control-label" for="customControlAutosizing3">Third One</label>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3">File Upload</label>
                <div class="col-md-9">
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="validatedCustomFile" required>
                        <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
                        <div class="invalid-feedback">Example invalid custom file feedback</div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="container">
        	<div class="form-group row">
            	<label for="bedroom" class="col-md-3 text-right control-label col-form-label">최대인원</label>
                <div class="col-sm-9">
                    <input type="number" name=bedroom id="bedroom" class="form-control">
                </div>
          	</div>
        	<div class="form-group row">
            	<label for="bed" class="col-md-3 text-right control-label col-form-label">최대인원</label>
                <div class="col-sm-9">
                    <input type="number" name="bed" id="bed" class="form-control">
                </div>
          	</div>
        	<div class="form-group row">
            	<label for="toilet" class="col-md-3 text-right control-label col-form-label">최대인원</label>
                <div class="col-sm-9">
                    <input type="number" name="toilet" id="toilet" class="form-control">
                </div>
          	</div>
        	<div class="form-group row">
                <label class="col-md-3">wifi</label>
                <div class="col-md-9">
                    <div class="custom-control custom-radio">
                    	<label class="custom-control-label" for="customControlValidation1"> Y
                        	<input type="radio" class="custom-control-input" id="customControlValidation1" name="radio-stacked">
                       	</label>
                       	<label class="custom-control-label" for="customControlValidation2"> N
                        	<input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked" selected>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="border-top">
            <div class="card-body">
                <button type="button" class="btn btn-primary">등록하기</button>
                <button type="button" class="btn btn-warning">돌아가기</button>
            </div>
        </div>
    </div>
</div>
<input type="hidden" name="residence" />
<p><br/></p>
</body>
</html>