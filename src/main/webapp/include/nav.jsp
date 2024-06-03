<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<div class="main_menu_iner">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                    <a class="navbar-brand" href="http://localhost:9090/javaclassJ14/Main"><img src="images/logoMain.png" alt="logo" style="width:160px;height:150px;object-fit:contain;object-position:center center;display:block;margin-top:-30px;margin-bottom:-30px;"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse main-menu-item justify-content-center"
                        id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="Introduce.st">Introduce</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="StayList.st" id="navbarDropdown_1"
                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    Stay
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                    <a class="dropdown-item" href="StayList.st">Stay List</a>
                                    <a class="dropdown-item" href="StayPromotion.st">Stay Promotion</a>
                                    <a class="dropdown-item" href="StayComment.st">Stay Comment</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="BlogList.bl" id="navbarDropdown"
                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    Blog
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="BlogList.bl">Travelog</a>
                                    <a class="dropdown-item" href="BlogJournalList.bl">Journal</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Service.ad">Service</a>
                            </li>
                            <c:if test="${sMid == null}">
                            <li class="nav-item"><a class="nav-link" href="MemberJoin.mem">Join</a></li>
                            </c:if>
                            <c:if test="${sMid != null}">
                            <li class="nav-item"><a class="nav-link" href="MemberLogout.mem">Logout</a></li>
                            </c:if>
                        </ul>
                    </div>
                    <c:if test="${sMid == null}"><a href="MemberLogin.mem" class="btn_1 d-none d-lg-block"><i class="fa-solid fa-door-open"></i> LOGIN</a></c:if>
                    <c:if test="${sMid == 'admin'}"><a class="btn_1 d-none d-lg-block" href="AdminMain.ad">관리자메뉴</a></c:if>
                    <c:if test="${sMid != null && sMid != 'admin'}">
	                    <li class="nav-item dropdown">
	                    	<a class="btn_1 d-none d-lg-block dropdown-toggle" data-toggle="dropdown">${sNickName} 님</a>
		                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		                        <a class="dropdown-item" href="MemberMain.mem"><i class="ti-user m-r-5 m-l-5"></i> 마이페이지</a>
		                        <a class="dropdown-item" href="MemberMessage.mem"><i class="fa-solid fa-message"></i> 메시지 보내기</a>
		                        <a class="dropdown-item" href="MemberWishList.mem"><i class="fa-solid fa-heart"></i> 위시리스트</a>
				      		</div>
	                    </li>
                   	</c:if>
                </nav>
            </div>
        </div>
    </div>
</div>
</header>
