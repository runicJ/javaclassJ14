<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MemberMain</title>
	<%@ include file = "/include/bs4.jsp" %>
	<link href="${ctp}/setting/css/admin/style.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
		
		#sidebarnav li:last-child {
		    margin-top: 140%;
		    font-size: 0.7em;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container">	
    <!-- 로딩될 때 쓰는거 -->
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
     </div>
         <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">My Page</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb" style="background-color:white;">
                                    <li class="breadcrumb-item" style="background-color:white;"><a href="${ctp}/Main">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page" style="background-color:white;">My Page</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <p><br></p>
           <div class="row w3-light-grey">
  <div class="w3-row-padding">
    <div class="w3-third">
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
          <img src="${ctp}/images/member/${vo.photo}" style="width:100%" alt="Avatar">
          <div class="w3-display-bottomleft w3-container w3-text-black">
            <h2 style="font-weight:bold;background-color:#eee;">${vo.name}</h2>
          </div>
        </div>
        <div class="w3-container">
        <hr>
			<p><b><i class="fa-solid fa-user w3-text-teal"></i> ${vo.nickName}</b></p>
          <p><i class="fa fa-phone w3-large w3-text-teal"></i> ${vo.tel}</p>
          <p><i class="fa-solid fa-envelope w3-text-teal"></i> ${empty vo.email ? "미입력" : vo.email}</p>
          <p><i class="fa-solid fa-house-chimney w3-text-teal"></i> ${empty vo.residence ? "미상" : vo.residence}</p>
          <p><i class="fa-solid fa-pen-to-square w3-large w3-text-teal"></i> ${vo.content}</p>
          <p><i class="fa-solid fa-calendar-days w3-large w3-text-teal"></i> ${fn:substring(vo.startDate,0,10)} 가입</p>
          <p><b><i class="fa-solid fa-circle-info w3-large w3-text-teal"></i> ${vo.userInfo}</b></p>
          <hr>
          <p class="w3-large"><i class="fa fa-asterisk fa-fw w3-text-teal"></i>비고</p>
        </div>
      </div>
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
      <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>작성한 게시글</h2>
        <c:forEach var="tVo" items="${tVos}">
        <div class="w3-container">
          <h5 class="w3-opacity"><b><a href="BlogDetail.bl?tIdx=${tVo.tIdx}">${tVo.title}</a></b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>${tVo.date_diff <= 0 ? fn:substring(tVo.tDate,0,10) : fn:substring(tVo.tDate,0,16)}<span class="w3-tag w3-teal w3-round"><c:if test="${tVo.hour_diff <= 24}"><img src="${ctp}/images/new.gif" /></c:if></span>| ${tVo.sort} | (View : ${tVo.viewCnt})</h6>
          <p>
            <c:if test="${fn:length(tVo.tContent) >= 35}">${fn:substring(tVo.tContent,0,35)}...</c:if>
           	<c:if test="${fn:length(tVo.tContent) < 35}">${tVo.tContent}</c:if>
          </p>
          <hr>
        </div>
        </c:forEach>
      </div>
    </div>
    <div class="w3-twothird">
      <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>작성한 리뷰</h2>
        <c:forEach var="rVo" items="${rVos}">
        <div class="w3-container">
          <h5 class="w3-opacity"><b>
          	<c:if test="${rVo.part == 'travelog'}"><a href="BlogDetail.bl?tIdx=${rVo.rIdx}">Travelog</a></c:if>
          	<c:if test="${rVo.part == 'stay'}"><a href="StayDetail.bl?sIdx=${rVo.rIdx}">Stay | ${rVo.purpose} |</a></c:if>
          </b><i class="fa fa-calendar fa-fw"></i> ${fn:substring(rVo.rDate,0,10)}</h5>
          <p>
            <c:if test="${fn:length(rVo.rContent) >= 20}">${fn:substring(rVo.rContent,0,20)}...</c:if>
           	<c:if test="${fn:length(rVo.rContent) < 20}">${rVo.rContent}</c:if>
          </p>
          <hr>
        </div>
        </c:forEach>
      </div>
    </div>
  </div>              
</div>
</div>
</div>
<p><br/></p>
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
<jsp:include page="/include/footer.jsp" />
</body>
</html>