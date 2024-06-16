<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1.0">
	<title>Member Comment List</title>
	<%@ include file = "../../include/bs4.jsp"%>
	<link href="${ctp}/setting/css/admin/style.min.css" rel="stylesheet">
	<link href="${ctp}/setting/css/admin/multicheck.css" rel="stylesheet">
	<style>
		/* Style the tab */
		.tab {
		  overflow: hidden;
		  border: 1px solid #ccc;
		  background-color: #f1f1f1;
		}
		
		/* Style the buttons inside the tab */
		.tab button {
		  background-color: inherit;
		  float: left;
		  border: none;
		  outline: none;
		  cursor: pointer;
		  padding: 14px 16px;
		  transition: 0.3s;
		  font-size: 17px;
		}
		
		/* Change background color of buttons on hover */
		.tab button:hover {
		  background-color: #ddd;
		}
		
		/* Create an active/current tablink class */
		.tab button.active {
		  background-color: #ccc;
		}
		
		/* Style the tab content */
		.tabcontent {
		  display: none;
		  padding: 6px 12px;
		  border: 1px solid #ccc;
		  border-top: none;
		}
		
		#sidebarnav li:last-child {
		    margin-top: 90%;
		    font-size: 0.7em;
		}
		
		.tabcontent.active {
		    display: block; /* 활성 탭 컨텐츠만 보임 */
		}
	</style>
	<script>
		function openTab(evt, tabName) {
		    // 모든 탭 컨텐츠를 숨김
		    var i, tabcontent, tablinks;
		    tabcontent = document.getElementsByClassName("tabcontent");
		    for (i = 0; i < tabcontent.length; i++) {
		        tabcontent[i].style.display = "none";  
		        tabcontent[i].classList.remove("active");
		    }
	
		    // 모든 탭 링크에서 "active" 클래스를 제거
		    tablinks = document.getElementsByClassName("tablinks");
		    for (i = 0; i < tablinks.length; i++) {
		        tablinks[i].className = tablinks[i].className.replace(" active", "");
		    }
	
		    // 현재 탭에 "active" 클래스를 추가하고 컨텐츠를 보여줌
		    document.getElementById(tabName).style.display = "block";
		    document.getElementById(tabName).classList.add("active");
		    evt.currentTarget.className += " active";
		}
		
	  	function blogDeleteCheck(tIdx, tPhoto) {
	  		let ans = confirm("선택하신 게시글을 삭제하시겠습니까?");
	  		if(!ans) return false;
	  		else {
		  		$.ajax({
		  			url : "BlogDeleteCheck.bl",
		  			type : "post",
		  			data : {
		  				tIdx : tIdx,
		  				tPhoto : tPhoto
		  			},
		  			success:function(res) {
		  				if(res != 0) {
			  				alert("자료가 삭제되었습니다.");
			  				location.reload();
		  				}
		  				else alert("삭제 실패~");
		  			},
		  			error : function() {
		  				alert("전송오류!");
		  			}
		  		});
	  		}
	  	}
	</script>
</head>
<body>
<%@ include file = "../../include/header.jsp"%>
<%@ include file = "../../include/nav.jsp"%>
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
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberUpdate.mem" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">내 정보 수정</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberBookingList.mem" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">예약 내역</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberCommentList.mem" aria-expanded="false"><i class="mdi mdi-chart-bubble"></i><span class="hide-menu">작성한 게시글</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberWishList.mem" aria-expanded="false"><i class="mdi mdi-border-inside"></i><span class="hide-menu">위시리스트</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberComplaint.mem" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu">문의/신고 글</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="MemberDelete.mem" aria-expanded="false"><i class="mdi mdi-blur-linear"></i><span class="hide-menu" style="color:orange;">회원탈퇴</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>
		<div class="page-wrapper">
            <div class="card">
                <div class="card-body">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="card-title m-b-0">작성한 게시글</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb" style="color:white;">
                                    <li class="breadcrumb-item"><a href="${ctp}/Main">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"><a href="MemberMain.mem">마이 페이지</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">작성한 게시글</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
                
                <div class="tab">
				  <button class="tablinks" onclick="openCity(event, 'travelog')">여행블로그</button>
				  <button class="tablinks" onclick="openCity(event, 'review')">댓글</button>
				</div>
				<div id="review" class="tabcontent">
				  <h3>Paris</h3>
				  <p>Paris is the capital of France.</p> 
				</div>
				
				<div id="travelog" class="tabcontent">
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
                                <th scope="col">자료제목</th>
                                <th scope="col">작성일</th>
                                <th scope="col">조회수</th>
                                <th scope="col">좋아요</th>
                                <th scope="col">비고</th>
                            </tr>
                        </thead>
                        <tbody class="customtable">
                        	<c:forEach var="vo" items="${vos}" varStatus="st">
                            <tr>
                                <th>
                                    <label class="customcheckbox">
                                        <input type="checkbox" class="listCheckbox" />
                                        <span class="checkmark"></span>
                                    </label>
                                </th>
                                <td><a href="BlogDetail.bl?tIdx=${vo.tIdx}">${vo.title}</a></td>
                                <td>${vo.date_diff == 0 ? fn:substring(vo.tDate,11,19) : fn:substring(vo.tDate,0,16)}</td>
                                <td>${vo.viewCnt}</td>
                                <td>${vo.likedCnt}</td>
                                <td><a href="javascript:BlogDeleteCheck('${vo.tIdx}','${vo.tPhoto}')" class="badge badge-danger">삭제</a><td>
                            </tr>
                            </c:forEach>
                        </tbody>
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
							<c:if test="${pag > 1}"><li class="page-item"><a class="page-link" href="${ctp}/BlogList.bl?part=${part}&pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
							<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link" href="${ctp}/BlogList.bl?part=${part}&pag=${(curBlock*blockSize+1)-blockSize}&pageSize=${pageSize}"><i class="ti-angle-left"></i></a></li></c:if>  <!-- (curBlock-1)*blockSize +1 -->
							<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
								<c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link" href="${ctp}/BlogList.bl?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
								<c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link" href="${ctp}/BlogList.bl?part=${part}&pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
							</c:forEach>
							<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link" href="${ctp}/BlogList.bl?part=${part}&pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}"><i class="ti-angle-right"></i></a></li></c:if>
							<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link" href="${ctp}/BlogList.bl?part=${part}&pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
                            </ul>
                        </nav>
                    </table>
				</div>          
        	</div>
        	</div>
		</div>
	</div>
</div>
<p><br/></p>
<%@ include file = "../../include/footer.jsp"%>
<!-- <script src="js/admin/jquery-ui.min.js"></script> -->
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