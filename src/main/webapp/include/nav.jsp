<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	//int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");  /* EL로 직접써도 관계없음(세션이니까) */
	//pageContext.setAttribute("level", level);
%>

<div class="main_menu_iner">
    <div class="container">
        <div class="row align-items-center ">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                    <a class="navbar-brand" href="index.jsp"> <img src="img/logo.png" alt="logo"> </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse main-menu-item justify-content-center"
                        id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="packages.jsp">packages</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="blog.jsp" id="navbarDropdown"
                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    Blog
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="blog.jsp">Blog</a>
                                    <a class="dropdown-item" href="single-blog.jsp">Single blog</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="blog.jsp" id="navbarDropdown_1"
                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    pages
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                    <a class="dropdown-item" href="top_place.jsp">top place</a>
                                    <a class="dropdown-item" href="tour_details.jsp">tour details</a>
                                    <a class="dropdown-item" href="elements.jsp">Elements</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp">Contact</a>
                            </li>
                        </ul>
                    </div>
                    <a href="${ctp}/MemberLogin.mem" class="btn_1 d-none d-lg-block"><i class="fa-solid fa-door-open"></i> LOGIN</a>
                </nav>
            </div>
        </div>
    </div>
</div>
</header>
