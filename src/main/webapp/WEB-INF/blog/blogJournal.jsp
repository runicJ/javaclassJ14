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
  	<style>
          .shorts-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .short {
           	width: calc(33.33% - 20px);
            max-width: 300px;
            height: auto;
            position: relative;
            overflow: hidden;
        }

        .short video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .search-bar {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .search-bar form {
            display: flex;
            width: 80%;
            max-width: 800px;
        }

        .search-bar input {
            flex: 1;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 3px 0 0 3px;
            font-size: 16px;
        }

        .search-bar button {
            padding: 15px;
            border: 1px solid #ccc;
            border-left: 0;
            background-color: #fe5c24;
            color: white;
            border-radius: 0 3px 3px 0;
            font-size: 16px;
        }

        @media (max-width: 768px) {
            .short {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .search-bar input {
                width: 80%;
            }
        }
	</style>
	    <script>
        function filterVideos() {
            let input = document.getElementById('searchInput').value.toUpperCase();
            let shorts = document.getElementsByClassName('short');

            for (let i = 0; i < shorts.length; i++) {
                let title = shorts[i].getAttribute('data-title').toUpperCase();
                if (title.indexOf(input) > -1) {
                    shorts[i].style.display = "";
                } else {
                    shorts[i].style.display = "none";
                }
            }
        }
    </script>
</head>
<body>
<%@ include file = "/include/header.jsp"%>
<%@ include file = "/include/nav.jsp"%>
<div class="container mt-5">
    <div class="search-bar text-center">
        <div class="single-footer-widget">
            <h2 class="mb-4">외부 자료 공유(SNS, Shorts 등)</h2>
            <div class="form-wrap mb-3">
                <form target="_blank" action="https://pf.kakao.com/_iExmtG" method="get" class="form-inline">
                    <input class="form-control" name="tKeyword" placeholder="여행 키워드를 입력하세요" required>
                    <button type="submit" class="click-btn btn btn-default text-uppercase" style="height:47px;border-radius: 10px;"><i class="far fa-paper-plane"></i></button>
                </form>
            </div>
            <p>현재 페이지는 가상으로 꾸며놓은 Fake 페이지 입니다.<br> 제가 기획했었던 기능은 작동하지 않습니다.</p>
        </div>
    </div>
    <hr>
	<div class="shorts-container">
        <div class="short" data-title="journal ex1">
            <video controls muted loop>
                <source src="${ctp}/images/j_1.mp4" type="video/mp4">
            </video>
        </div>
        <div class="short" data-title="journal ex2">
            <video controls muted loop>
                <source src="${ctp}/images/j_2.mp4" type="video/mp4">
            </video>
        </div>
        <div class="short" data-title="journal ex3">
            <video controls muted loop>
                <source src="${ctp}/images/j_3.mp4" type="video/mp4">
            </video>
        </div>
        <div class="short" data-title="journal ex4">
            <video controls muted loop>
                <source src="${ctp}/images/j_4.mp4" type="video/mp4">
            </video>
        </div>
        <div class="short" data-title="journal ex5">
            <video controls muted loop>
                <source src="${ctp}/images/j_5.mp4" type="video/mp4">
            </video>
        </div>
        <div class="short" data-title="journal ex6">
            <video controls muted loop>
                <source src="${ctp}/images/j_6.mp4" type="video/mp4">
            </video>
        </div>
    </div>
</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp"%>
</body>
</html>