<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1.0">
	<title>Insert</title>
  <%@ include file = "../../include/bs4.jsp"%>
  <link href="${ctp}/setting/css/admin/style.min.css" rel="stylesheet">
</head>
<body>
<%@ include file = "../../include/header.jsp"%>
<%@ include file = "../../include/nav.jsp"%>
<p><br></p>
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
	                	<h4 class="page-title">문의/신고 글</h4>
	                	<div class="ml-auto text-right">
	                    	<nav aria-label="breadcrumb">
		                        <ol class="breadcrumb">
		                            <li class="breadcrumb-item" style="background-color:white;"><a href="${ctp}/Main">Home</a></li>
		                            <li class="breadcrumb-item active" aria-current="page" style="background-color:white;">마이페이지</li>
		                            <li class="breadcrumb-item active" aria-current="page" style="background-color:white;">위시리스트</li>
		                        </ol>
	                    	</nav>
	                	</div>
	            	</div>
	        	</div>
	    	</div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="thead-light">
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox m-b-5">
                                                        <input type="checkbox" id="mainCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <th scope="col">문의유형</th>
                                                <th scope="col">제목</th>
                                                <th scope="col">내용</th>
                                                <th scope="col">상태</th>
                                            </tr>
                                        </thead>
                                        <tbody class="customtable">
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>문의</td>
                                                <td>연락처 중복</td>
                                                <td>누군가 제 연락처를 사용하고 있어요.</td>
                                                <td>답변대기</td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>신고</td>
                                                <td>부적절한 광고</td>
                                                <td>불법 도박성 광고가 성행하고 있습니다. 확인 부탁요.</td>
                                                <td>답변대기</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<p><br/></p>
<%@ include file = "../../include/footer.jsp"%>
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