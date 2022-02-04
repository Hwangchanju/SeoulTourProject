<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>" />
<link href="<c:url value='/css/board.css'/>" rel="stylesheet" type="text/css" />

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<c:url value='/resources/js/modal_login_2.js'/>"></script>


  </head>
  <body class="d-flex h-100 text-center text-white bg-dark">
    
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column"  style=" font-family: 'Y_Spotlight';">
  <header class="mb-auto">
    <div>
      <img src="<c:url value='/images/logoColor.png'/>" alt="사진" width="500px" height="350px;"/>
      <br>

    </div>
  </header>

  <main class="px-3">
   <br>
    <h1>SeoulTour 관리자 메인 페이지 입니다.</h1>
   
    <p class="lead" style="color:white;">사용을 원하시면 로그인을 해주세요.</p>
    <p class="lead">
    <!-- Button trigger modal -->
		<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#admin_login_modal" style="width:100%; margin:auto 0px;">
 					 로그인
		</button>
    </p>
  </main>

<footer style="border:none;">
 
  	<img src="<c:url value='/images/slide1.png'/>" alt="서울 대표 사진" width="100%" height="100%" />
  	</footer>

</div>


<%@ include file="admin_login_modal.jsp" %>
</body>
</html>