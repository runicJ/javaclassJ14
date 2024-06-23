<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1.0">
	<title>Insert</title>
  <%@ include file = "/include/bs4.jsp"%>
</head>
<body>
<%@ include file = "/include/header.jsp"%>
<%@ include file = "/include/nav.jsp"%>
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
	                	<h4 class="page-title">위시리스트</h4>
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
                            <div class="card-body">
                                <h5 class="card-title m-b-0">나의 위시리스트</h5>
                            </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="thead-light">
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox m-b-20">
                                                        <input type="checkbox" id="mainCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <th scope="col">Rendering engine</th>
                                                <th scope="col">Browser</th>
                                                <th scope="col">Platform(s)</th>
                                                <th scope="col">Engine version</th>
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
                                                <td>Trident</td>
                                                <td>Internet Explorer 4.0</td>
                                                <td>Win 95+</td>
                                                <td>4</td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 5.0</td>
                                                <td>Win 95+</td>
                                                <td>5</td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 4.0</td>
                                                <td>Win 95+</td>
                                                <td>4</td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 5.0</td>
                                                <td>Win 95+</td>
                                                <td>5</td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 5.5</td>
                                                <td>Win 95+</td>
                                                <td>5.5</td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="customcheckbox">
                                                        <input type="checkbox" class="listCheckbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </th>
                                                <td>Trident</td>
                                                <td>Internet Explorer 6</td>
                                                <td>Win 98+</td>
                                                <td>6</td>
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
<%@ include file = "/include/footer.jsp"%>
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