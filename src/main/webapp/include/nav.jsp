<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<div class="main_menu_iner">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                    <a class="navbar-brand" href="${ctp}/Main"><img src="images/logoMain.png" alt="logo" style="width:160px;height:150px;object-fit:contain;object-position:center center;display:block;margin-top:-30px;margin-bottom:-30px;"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse main-menu-item justify-content-center" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="Introduce.st">Introduce</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="StayList.st" id="navbarDropdown1" 
                                role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Stays</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                                    <a class="dropdown-item" href="StayList.st">Stay List</a>
                                    <a class="dropdown-item" href="StayList.st">Stay Promotion</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ActivityBooking.ad" id="navbarDropdown2" 
                                role="button" aria-haspopup="true" aria-expanded="false">Activities</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="BlogList.bl" id="navbarDropdown3"
                                    role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Travelog</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown3">
                                    <a class="dropdown-item" href="BlogList.bl">Blog List</a>
                                    <a class="dropdown-item" href="BlogJournal.bl">Travel Journal</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="Service.ad" id="navbarDropdown4"
                                    role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Service</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown4">
                                    <a class="dropdown-item" href="FAQList.ad">자주하는 질문</a>
                                    <a class="dropdown-item" href="Complaint.ad">1:1문의</a>
                                </div>
                            </li>
                            <c:if test="${sMid == null}">
                            <li class="nav-item"><a class="nav-link" href="MemberAgreeJoin.mem">Join us</a></li>
                            </c:if>
                            <c:if test="${sMid != null}">
                            <li class="nav-item"><a class="nav-link" href="MemberLogout.mem">Logout</a></li>
                            </c:if>
                        </ul>
                    </div>
                    <c:if test="${sMid == null}"><a href="MemberLogin.mem" class="btn_1 d-none d-lg-block"><i class="fa-solid fa-door-open"></i> LOGIN</a></c:if>
                    <c:if test="${sMid == 'admin'}"><a class="btn_1 d-none d-lg-block" href="AdminMain.ad">관리자메뉴</a></c:if>
                    <c:if test="${sMid != null && sMid != 'admin'}">
	                    <li class="nav-item dropdown" style="list-style-type:none;">
	                    	<a class="btn_1 d-none d-lg-block dropdown-toggle" data-toggle="dropdown" style="font-size=14px;">
                            <img src="images/member/${sPhoto}" alt="user" class="rounded-circle" height="30" width="30">
	                    	${sNickName} 님</a>
		                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		                        <a class="dropdown-item" href="MemberUpdate.mem"><i class="ti-user m-r-5 m-l-5"></i> 마이페이지</a>
		                        <a class="dropdown-item" href="MemberMessage.mem"><i class="fa-solid fa-message"></i> 메시지 보내기</a>
		                        <a class="dropdown-item" href="MemberWish.mem"><i class="fa-solid fa-heart"></i> 위시리스트</a>
				      		</div>
	                    </li>
                   	</c:if>
                </nav>
            </div>
        </div>
    </div>
</div>
</header>
