<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../include/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	var findid = '${f.admin_id}';
	var userName = '${f.admin_name}'
	var findpw = '${f.admin_pwd}';

	$(document).ready(function() {
		$("#findId").text(findid);
		$('#userName').text(userName);
	});
	
	$(document).ready(function() {
		$("#findPw").text(findpw);
		$('#userName').text(userName);
	});
</script>
</head>
<body class="login_wrap text-center text-white bg-dark">

	<div id="find_complete" class="align-middle">
		<div class="find_info" style="text-align: center; vertical-align: middle;">
			<br> <br>

			<c:if test="${f!= null}">
			<div class="join_check" style="margin:auto;">
			<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" fill="currentColor" class="bi bi-patch-check" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10.354 6.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7 8.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
  <path d="m10.273 2.513-.921-.944.715-.698.622.637.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636a2.89 2.89 0 0 1 4.134 0l-.715.698a1.89 1.89 0 0 0-2.704 0l-.92.944-1.32-.016a1.89 1.89 0 0 0-1.911 1.912l.016 1.318-.944.921a1.89 1.89 0 0 0 0 2.704l.944.92-.016 1.32a1.89 1.89 0 0 0 1.912 1.911l1.318-.016.921.944a1.89 1.89 0 0 0 2.704 0l.92-.944 1.32.016a1.89 1.89 0 0 0 1.911-1.912l-.016-1.318.944-.921a1.89 1.89 0 0 0 0-2.704l-.944-.92.016-1.32a1.89 1.89 0 0 0-1.912-1.911l-1.318.016z"/>
</svg></div>
					<br>
					
					<c:if test="${f.admin_pwd != null }">
					<p>
						<b><span id="userName"></span></b>님의 임시 비밀번호는 <b><span id="findPw">
						</span></b>입니다.<br>
						마이페이지에서 비밀번호를 수정해주세요.
					</p>
					
					</c:if>
					<c:if test="${f.admin_pwd == null }">
					<p>
						<b><span id="userName"></span></b>님의 아이디는 <b><span id="findId">
						</span></b>입니다.
					</p>
					</c:if>
			</c:if>

				<c:if test="${f == null }">
				<div class="join_check">
					<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg></div>
						<p>
					<b> 해당 아이디가 없습니다. 회원가입을 먼저 해주세요.</b>
					</p>
				</c:if>

		
			<br>
		</div>
		<div class="find_complete_btn">
			<div class="btns" style="text-align: center;">
				<a class="nav-link js-scroll-trigger" href="<c:url value='/'/>"> 사용자 관리 홈으로 가기</a>
			</div>
			&nbsp;
			<div class="btns" style="text-align: center;">
				<a class="nav-link js-scroll-trigger" href="<c:url value='/admin/findPw'/>">비번 찾기</a>
			</div>
			&nbsp;
			<div class="btns" style="text-align: center;">
				<a class="nav-link js-scroll-trigger" data-toggle="modal" data-target="#admin_login_modal" style="cursor:pointer;">로그인</a> 
			</div>
		</div>

	</div>
<%@ include file="admin_login_modal.jsp"%>
</body>
</html>