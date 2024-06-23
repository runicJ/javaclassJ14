<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1.0">
	<title>Member Wish</title>
	<%@ include file = "/include/bs4.jsp"%>
	<link href="${ctp}/setting/css/admin/style.min.css" rel="stylesheet">
	<style>
		* {
		  box-sizing: border-box;
		}
		
		body {
		  background-color: #f1f1f1;
		  padding: 20px;
		  font-family: Arial;
		}
		
		/* Center website */
		.main {
		  max-width: 1000px;
		  margin: auto;
		}
		
		h1 {
		  font-size: 50px;
		  word-break: break-all;
		}
		
		.row {
		  margin: 8px -16px;
		}
		
		/* Add padding BETWEEN each column (if you want) */
		.row,
		.row > .column {
		  padding: 8px;
		}
		
		/* Create three equal columns that floats next to each other */
		.column {
		  float: left;
		  width: 33.33%;
		  display: none; /* Hide columns by default */
		}
		
		/* Clear floats after rows */
		.row:after {
		  content: "";
		  display: table;
		  clear: both;
		}
		
		/* Content */
		.content {
		  background-color: white;
		  padding: 10px;
		}
		
		/* The "show" class is added to the filtered elements */
		.show {
		  display: block;
		}
		
		/* Style the buttons */
		.btn {
		  border: none;
		  outline: none;
		  padding: 12px 16px;
		  background-color: white;
		  cursor: pointer;
		}
		
		/* Add a grey background color on mouse-over */
		.btn:hover {
		  background-color: #ddd;
		}
		
		/* Add a dark background color to the active button */
		.btn.active {
		  background-color: #666;
		   color: white;
		}
		
		 .edit-group {
	        display: flex;
	        align-items: center;
	        margin-bottom: 10px;
    	}

	    .edit-group input[type="text"] {
	        border: none;
	        font-size: 1.1em;
	        font-weight: bold;
	        padding: 5px;
	        width: 100%;
	        max-width: 400px;
	        background-color: #f1f1f1;
	    }
	
	    .edit-group input[type="text"]:focus {
	        outline: none;
	        border-bottom: 1px solid #3498db;
	    }
	
	    .edit-group i {
	        cursor: pointer;
	        margin-left: 10px;
	        font-size: 1em;
	        color: #666;
	    }

	    .edit-group i:hover {
	        color: #3498db;
	    }
	</style>
	<script>
		'use strict';
		
	    function updateGroup() {
	        const input = document.querySelector('.edit-group input[type="text"]');
	        input.removeAttribute('readonly');
	        input.focus();
	        input.addEventListener('blur', function() {
            input.setAttribute('readonly', true);
	        });
	    }
		
	</script>
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
            <div class="container-fluid main">
				<h1>MY Wish Stay</h1>
				<hr>		
				<div class="edit-group">
				    <h2><input type="text" value="언젠가는..." readonly /><i class="fa-regular fa-pen-to-square" onclick="updateGroup();"></i></h2>
				</div>	
				<div id="myBtnContainer">
				  <button class="btn active" onclick="filterSelection('all')"> 전체</button>
				  <button class="btn" onclick="filterSelection('Gang')"> 강원도</button>
				  <button class="btn" onclick="filterSelection('Chung')"> 충청도</button>
				  <button class="btn" onclick="filterSelection('Jeol')"> 전라도</button>
				  <button class="btn" onclick="filterSelection('Gyeong')"> 경상도</button>
				</div>
				<div class="row">
					<c:forEach var="wishVo" items="${wishVos}">
				  	<div class="column ${wishVo.residence}">
				    	<div class="content">
				      		<img src="${ctp}/images/stay/${fn:split(wishVo.sPhoto, '/')[0]}" alt="${wishVo.sName}" style="width:100%;height:200px;">
				      		<hr>
				      		<h4><a href="StayDetail.st?sIdx=${wishVo.sIdx}" style="overflow: hidden;text-overflow: ellipsis;">${wishVo.sName}</a></h4>
				      		<p>￦<fmt:formatNumber value="${wishVo.price}" pattern="#,##0" /><span style="font-size:13px;"> /박 </span></p>
				      		<h5><i class="fa fa-map-marker" style="width:30px"></i>대한민국, ${wishVo.residence == 'Chung' ? '충청도' : wishVo.residence == 'Gang' ? '강원도' : wishVo.residence == 'Jeol' ? '전라도' : '경상도'}</h5>
    						&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-check"></i> &nbsp;${wishVo.sort}
				    	</div>
			  		</div>
			  		</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp"%>
<script>
filterSelection("all") // Execute the function and show all columns
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  // Add the "show" class (display:block) to the filtered elements, and remove the "show" class from the elements that are not selected
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

// Show filtered elements
function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {
      element.className += " " + arr2[i];
    }
  }
}

// Hide elements that are not selected
function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);
    }
  }
  element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>
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