<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>서울 구석구석 </title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bbs.css'/>" />
<link href="<c:url value='/css/board.css'/>" rel="stylesheet" type="text/css" />

<!-- Bootstrap core JavaScript -->
<link rel="stylesheet" href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>">
<script src="<c:url value='/vendor/bootstrap/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
</head>
<body>
<header>
<%--로그인 / 마이페이지 --%>
<div id="login">
			<c:if test="${session_id == null}">
			<a class="nav-link js-scroll-trigger" data-toggle="modal" data-target="#log-in-modal" style="cursor:pointer;">로그인</a> 
			<a class="nav-link js-scroll-trigger" data-toggle="modal" data-target="#sign-up-modal" style="cursor:pointer;">회원가입</a>
			</c:if>
			<c:if test="${session_id != null }">
				<a href="<c:url value='/user/logout'/>" onclick="return confirm('로그아웃 되셨습니다.');">로그아웃</a><br>
				<a href="<c:url value='/user/mypage'/>">마이페이지</a>
			</c:if>
		</div>
		<div class="clear"></div>
<%--회사 로고 --%>
<div id="logo"><a href="main"><img src="<c:url value='/resources/images/logo.png'/>" width="350" height="250" alt="logo" /></a></div>

<%--메뉴바 --%>
<nav>
<ul class="main">
	<li><a href="#">여행</a></li>
	<li><a>홈</a>
	<ul class="sub">
		<li><a href="#">인기</a></li>
		<li><a href="bbs_list">코스</a></li>
		<li><a href="#">축제</a></li>
	</ul></li>
	<li><a href="<c:url value='/user/community/list'/>">커뮤니티</a></li>
</ul>
</nav>
</header>
</body>
</html>
<%@ include file="../users/user/login_modal.jsp"%>