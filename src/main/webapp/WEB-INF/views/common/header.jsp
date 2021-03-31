<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- 타이틀 -->
        <title>SANTA CANDY</title>

        <!-- 폰트 로딩 -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&family=Raleway:wght@300;400;600&display=swap" rel="stylesheet">

        <!-- 돋보기 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

        <!-- 사전 로딩 -->
        <link rel="stylesheet"	href="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
		<script	src="<%=application.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
		<script	src="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
		<script	src="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>


        <!-- css 로딩 -->
        <link href="<%=application.getContextPath() %>/resources/css/header_footer.css" rel="stylesheet" type="text/css"/>

        <!-- FAQ 추가 -->
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,500|Open+Sans">
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            
    </head>
    <body>
        <!-- 헤더 -->
        <div class="header">
            <div class="top-img"></div>
            <div class="login-out">
                <ul>
                    <li>
                        <a href="<%=application.getContextPath()%>/purchaselist">마이페이지</a>
                    </li>
                    <li>
                        <a href="<%=application.getContextPath()%>/signup">회원가입</a>
                    </li>
                    <li>
                        <a href="<%=application.getContextPath()%>/login">로그인</a>
                    </li>
                </ul>
            </div>
            <div class="center-img">
                <a href="<%=application.getContextPath()%>/main">
                    <div class="logo-img"></div>
                </a>
                <a href="<%=application.getContextPath()%>/cart">
                    <div class="shopping-basket	"></div>
                </a>
                <div class="shopping-basket-text-box">
                    <div class="shopping-basket-text">장바구니</div>
                </div>
            </div>
            <div class="down-category">
                <ul>
                    <li>
                        <a href="<%=application.getContextPath()%>/category?cno=1&kind=0">캔들</a>
                    </li>
                    <li>
                        <a href="<%=application.getContextPath()%>/category?cno=2&kind=0">조명</a>
                    </li>
                    <li>
                        <a href="<%=application.getContextPath()%>/category?cno=3&kind=0">트리</a>
                    </li>
                    <li>
                        <a href="<%=application.getContextPath()%>/category?cno=4&kind=0">기타</a>
                    </li>
                </ul>
                <div class="search-box">
                    <div class="input-group rounded">
                        <input
                            type="search"
                            class="form-control rounded"
                            placeholder="Search"
                            aria-label="Search"
                            aria-describedby="search-addon"/>
                        <button type="button" class="btn btn-light">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>