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
	<!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin5">
		    <nav class="navbar top-navbar navbar-expand-md navbar-dark">
		        <div class="navbar-header" data-logobg="skin5">
		            <!-- This is for the sidebar toggle which is visible on mobile only -->
		            <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
		            <!-- ============================================================== -->
		            <!-- Logo -->
		            <!-- ============================================================== -->
		            <a class="navbar-brand" href="index.html">
		                <!-- Logo icon -->
		                <b class="logo-icon p-l-10">
		                    <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
		                    <!-- Dark Logo icon -->
		                    <img src="assets/images/logo-icon.png" alt="homepage" class="light-logo" />
		                   
		                </b>
		                <!--End Logo icon -->
		                 <!-- Logo text -->
		                <span class="logo-text">
		                     <!-- dark Logo text -->
		                     <img src="assets/images/logo-text.png" alt="homepage" class="light-logo" />
		                    
		                </span>
		                <!-- Logo icon -->
		                <!-- <b class="logo-icon"> -->
		                    <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
		                    <!-- Dark Logo icon -->
		                    <!-- <img src="assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->
		                    
		                <!-- </b> -->
		                <!--End Logo icon -->
		            </a>
		            <!-- ============================================================== -->
		            <!-- End Logo -->
		            <!-- ============================================================== -->
		            <!-- ============================================================== -->
		            <!-- Toggle which is visible on mobile only -->
		            <!-- ============================================================== -->
		            <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
		        </div>
		        <!-- ============================================================== -->
		        <!-- End Logo -->
		        <!-- ============================================================== -->
		        <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
		            <!-- ============================================================== -->
		            <!-- toggle and nav items -->
		            <!-- ============================================================== -->
		            <ul class="navbar-nav float-left mr-auto">
		                <li class="nav-item d-none d-md-block"><a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>
		                <!-- ============================================================== -->
		                <!-- create new -->
		                <!-- ============================================================== -->
		                <li class="nav-item dropdown">
		                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                     <span class="d-none d-md-block">Create New <i class="fa fa-angle-down"></i></span>
		                     <span class="d-block d-md-none"><i class="fa fa-plus"></i></span>   
		                    </a>
		                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		                        <a class="dropdown-item" href="#">Action</a>
		                        <a class="dropdown-item" href="#">Another action</a>
		                        <div class="dropdown-divider"></div>
		                        <a class="dropdown-item" href="#">Something else here</a>
		                    </div>
		                </li>
		                <!-- ============================================================== -->
		                <!-- Search -->
		                <!-- ============================================================== -->
		                <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
		                    <form class="app-search position-absolute">
		                        <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>
		                    </form>
		                </li>
		            </ul>
		            <!-- ============================================================== -->
		            <!-- Right side toggle and nav items -->
		            <!-- ============================================================== -->
		            <ul class="navbar-nav float-right">
		                <!-- ============================================================== -->
		                <!-- Comment -->
		                <!-- ============================================================== -->
		                <li class="nav-item dropdown">
		                    <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-bell font-24"></i>
		                    </a>
		                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		                        <a class="dropdown-item" href="#">Action</a>
		                        <a class="dropdown-item" href="#">Another action</a>
		                        <div class="dropdown-divider"></div>
		                        <a class="dropdown-item" href="#">Something else here</a>
		                    </div>
		                </li>
		                <!-- ============================================================== -->
		                <!-- End Comment -->
		                <!-- ============================================================== -->
		
		                <!-- ============================================================== -->
		                <!-- User profile and search -->
		                <!-- ============================================================== -->
		                <li class="nav-item dropdown">
		                    <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/users/1.jpg" alt="user" class="rounded-circle" width="31"></a>
		                    <div class="dropdown-menu dropdown-menu-right user-dd animated">
		                        <a class="dropdown-item" href="javascript:void(0)"><i class="ti-user m-r-5 m-l-5"></i> My Profile</a>
		                        <a class="dropdown-item" href="javascript:void(0)"><i class="ti-wallet m-r-5 m-l-5"></i> My Balance</a>
		                        <a class="dropdown-item" href="javascript:void(0)"><i class="ti-email m-r-5 m-l-5"></i> Inbox</a>
		                        <div class="dropdown-divider"></div>
		                        <a class="dropdown-item" href="javascript:void(0)"><i class="ti-settings m-r-5 m-l-5"></i> Account Setting</a>
		                        <div class="dropdown-divider"></div>
		                        <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-power-off m-r-5 m-l-5"></i> Logout</a>
		                        <div class="dropdown-divider"></div>
		                        <div class="p-l-30 p-10"><a href="javascript:void(0)" class="btn btn-sm btn-success btn-rounded">View Profile</a></div>
		                    </div>
		                </li>
		                <!-- ============================================================== -->
		                <!-- User profile and search -->
		                <!-- ============================================================== -->
		            </ul>
		        </div>
		    </nav>
		</header>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<aside class="left-sidebar" data-sidebarbg="skin5">
		    <!-- Sidebar scroll-->
		    <div class="scroll-sidebar">
		        <!-- Sidebar navigation-->
		        <nav class="sidebar-nav">
		            <ul id="sidebarnav" class="p-t-30">
		                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${ctp}/Main" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">메인 페이지로</span></a></li>
		                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="charts.html" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">회원관리</span></a></li>
		                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="widgets.html" aria-expanded="false"><i class="mdi mdi-chart-bubble"></i><span class="hide-menu">예약관리</span></a></li>
		                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="tables.html" aria-expanded="false"><i class="mdi mdi-border-inside"></i><span class="hide-menu">여행글관리</span></a></li>
		                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="grid.html" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu">문의 관리</span></a></li>
		                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">숙소관리 </span></a>
		                    <ul aria-expanded="false" class="collapse  first-level">
		                        <li class="sidebar-item"><a href="StayInput.ad" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu"> StayInput </span></a></li>
		                        <li class="sidebar-item"><a href="StayList.ad" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> StayList </span></a></li>
		                    </ul>
		                </li>
		                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="pages-buttons.html" aria-expanded="false"><i class="mdi mdi-relative-scale"></i><span class="hide-menu">리뷰관리</span></a></li>
		                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-alert"></i><span class="hide-menu">Errors </span></a>
		                    <ul aria-expanded="false" class="collapse  first-level">
		                        <li class="sidebar-item"><a href="error-403.html" class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span class="hide-menu"> Error 403 </span></a></li>
		                        <li class="sidebar-item"><a href="error-404.html" class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span class="hide-menu"> Error 404 </span></a></li>
		                        <li class="sidebar-item"><a href="error-405.html" class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span class="hide-menu"> Error 405 </span></a></li>
		                        <li class="sidebar-item"><a href="error-500.html" class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span class="hide-menu"> Error 500 </span></a></li>
		                    </ul>
		                </li>
		            </ul>
		        </nav>
		        <!-- End Sidebar navigation -->
		    </div>
		    <!-- End Sidebar scroll-->
		</aside>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
<div class="container">
	<form action="${ctp}/admin/stayRegister" method="post" enctype="multipart/form-data">
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
        	<div class="form-group row">
            	<label for="bedroom" class="col-md-3 text-right control-label col-form-label">침실</label>
                <div class="col-sm-9">
                    <input type="number" name=bedroom id="bedroom" class="form-control">
                </div>
          	</div>
        	<div class="form-group row">
            	<label for="bed" class="col-md-3 text-right control-label col-form-label">침대</label>
                <div class="col-sm-9">
                    <input type="number" name="bed" id="bed" class="form-control">
                </div>
          	</div>
        	<div class="form-group row">
            	<label for="toilet" class="col-md-3 text-right control-label col-form-label">화장실</label>
                <div class="col-sm-9">
                    <input type="number" name="toilet" id="toilet" class="form-control">
                </div>
          	</div>
        	<div class="form-group row">
                <label class="col-md-3 text-right control-label col-form-label">Wi-Fi</label>
                <div class="col-md-9">
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" name="wifi" id="wifiYes" value="Y" class="custom-control-input">
                        <label class="custom-control-label" for="wifiYes">Y</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" name="wifi" id="wifiNo" value="N" class="custom-control-input">
                        <label class="custom-control-label" for="wifiNo">N</label>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-3 text-right control-label col-form-label">기타 시설</label>
                <div class="col-md-9">
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" name="a/c" class="custom-control-input" id="a/c">
                        <label class="custom-control-label" for="a/c">에어컨</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" name="parking" class="custom-control-input" id="parking">
                        <label class="custom-control-label" for="parking">주차장</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" name="pet" class="custom-control-input" id="pet">
                        <label class="custom-control-label" for="pet">반려동물</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" name="kitchen" class="custom-control-input" id="kitchen">
                        <label class="custom-control-label" for="kitchen">부엌</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" name="washingMachine" class="custom-control-input" id="washingMachine">
                        <label class="custom-control-label" for="washingMachine">세탁기</label>
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
	<input type="hidden" name="residence" />
	</form>
</div>
<p><br/></p>
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="${ctp}/js/admin/jquery.min.js"></script>
	<script src="${ctp}/js/admin/jquery.ui.touch-punch-improved.js"></script>
	<script src="${ctp}/js/admin/jquery-ui.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="${ctp}/js/admin/popper.min.js"></script>
	<script src="${ctp}/js/admin/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script src="${ctp}/js/admin/perfect-scrollbar.jquery.min.js"></script>
	<script src="${ctp}/js/admin/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="${ctp}/js/admin/waves.js"></script>
	<!--Menu sidebar -->
	<script src="${ctp}/js/admin/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="${ctp}/js/admin/custom.min.js"></script>
	<!-- this page js -->
	<script src="${ctp}/js/admin/moment.min.js"></script>
	<script src="${ctp}/js/admin/fullcalendar.min.js"></script>
	<script src="${ctp}/js/admin/cal-init.js"></script>
</body>
</html>