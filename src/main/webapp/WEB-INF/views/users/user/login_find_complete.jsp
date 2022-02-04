<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../include/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script>
	var findid = '${f.user_id}';
	var userName = '${f.user_name}'

	$(document).ready(function() {
		$("#findId").text(findid);
		$('#userName').text(userName);
	});
	
	$(document).ready(function() {
		$('#userName').text(userName);
	});
	

</script>
</head>
<body class="login_wrap">
	<hr style="width:1200px; margin:auto;">
	<div id="find_complete">
		<div class="find_info" style="text-align: center;">
			<br> <br>

			<c:if test="${f!= null}">
			<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
</svg>
					<br>
					
					<c:if test="${f.user_pwd != null }">
					<p style="font-size:22px;">
						<b><span id="userName"></span></b>님의 임시 비밀번호를 이메일로 보내드렸습니다.<br>
						확인하시고 마이페이지에서 비밀번호를 수정해주세요.
					</p>
					
					</c:if>
					<c:if test="${f.user_pwd == null }">
					<p style="font-size:25px;">
						<b><span id="userName"></span></b>님의 아이디는 <b><span id="findId">
						</span></b>입니다.
					</p>
					</c:if>
			</c:if>
<br>
				<c:if test="${f == null }">
				<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg>
						<p style="font-size:25px;">
					<b> 해당 정보가 없습니다. 회원가입을 먼저 해주세요.</b>
					</p>
				</c:if>

		
			<br>
		</div>
		<div class="find_complete_btn" style="margin-top:20px;">
			<div class="btns" style="text-align: center;">
				<a class="nav-link js-scroll-trigger" href="<c:url value='/main'/>">홈으로 가기</a>
			</div>
			&nbsp;
			<div class="btns" style="text-align: center;">
				<a class="nav-link js-scroll-trigger" href="<c:url value='/user/findPw'/>">비번 찾기</a>
			</div>
			&nbsp;
		</div>

	</div>
</body>
</html>