<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>




<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin.css'/>" />

<script src="<c:url value='/js/jquery.js'/>"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script src="<c:url value='/js/admin.js'/>"></script>
<script>
function userUpdate(id){
	window.open("<c:url value='/admin/user_update?user_id="+id+"'/>", '회원 정보 수정','width=700,height=800');
}

$(function(){
	var msg = '${msg}';
	if(msg=="delete_success"){
		alert('회원정보를 완전히 삭제했습니다.');
	}
});
</script>
<body style="height: 100%;">
	<header class="p-3 bg-dark text-white"
		style="float: right; width: 100%;">
		<div style="float: right;">
			<div style="width: 100%;">
				<a href="<c:url value='/main'/>" class="home_btn"> 사용자 홈페이지로
					바로가기 </a>
				<button type="button" class="btn btn-outline-light me-2"
					style="margin-right: 10px;"
					onclick="location.href='<c:url value='/admin/logout'/>';">Logout</button>
			</div>
		</div>
	</header>
	<div class="clear"></div>
		<div class="p-3 text-white bg-dark"
		style="width: 20%; height: 1100px; float: left;">
		<a href="/admin/mypage"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none"
			style="margin-top: 100px;"> &nbsp;&nbsp;&nbsp;&nbsp; <svg
				xmlns="http://www.w3.org/2000/svg" width="25" height="25"
				fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
  <path fill-rule="evenodd"
					d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
</svg>&nbsp;&nbsp; <span class="fs-4" style="font-size: 25px;">관리자 목록</span>
		</a>
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="<c:url value='/admin/mypage'/>" class="nav-link text-white active"
				aria-current="page" style="font-size: 20px;"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-person-lines-fill"
						viewBox="0 0 16 16">
  <path
							d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
</svg>&nbsp;&nbsp; 회원 관리
			</a></li>
			<li><a href="<c:url value='/bbs_list'/>" class="nav-link text-white"
				style="font-size: 20px;"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
  <path
							d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
  <path
							d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
</svg>&nbsp;&nbsp; 게시판 관리
			</a></li>
			<li><a href="<c:url value='/admin/admin_community'/>" class="nav-link text-white"
				style="font-size: 20px;"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
							d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z" />
  <path
							d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z" />
  <path fill-rule="evenodd"
							d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z" />
</svg>&nbsp;&nbsp; 사용자 게시물 관리
			</a></li>
		</ul>
		<hr>

	</div>
	<div style="width: 80%; float: right;" id="admin_main">
		<div>
			<div class="h-example-divider"></div>

			<div class="p-3 mb-3"
				style="margin-top: 0px; margin-left:100px;">
				<div class="container">

					<div>
						<div style="width: 100%; margin: auto;" id="keyword_dropdown">
							<br>
							<div style="float: left; width: 10%">
								<select name="condition" id="condition" class="form-control"
									aria-label="Default select example">
									<option value="user_id"
										${param.condition == 'user_id'?'selected':'' }>아이디</option>
									<option value="user_name"
										${param.condition == 'user_name'?'selected':'' }>이름</option>
									<option value="user_email_id"
										${param.condition == 'user_email_id'?'selected':'' }>이메일</option>
									<option value="user_idName"
										${param.condition=='user_idName'?'selected':'' }>아이디+이름</option>

								</select>
							</div>
							<div style="float: left; width: 30%;">
								<input type="text" id="keyword" name="keyword" size="65"
									placeholder="키워드" class="form-control"
									style="margin-bottom: 20px;">
							</div>
							<div>
								<button type="button" class="btn btn-secondary" id="srchKeyword"
									style="display: inline; width: 10%;">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<c:if test="${userList== null }">
			<p>사용자가 없습니다.</p>
		</c:if>

		<c:if test="${userList != null }">
			<table id="member_list" style="margin-top:50px;">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>이용자상태</th>
					<th></th>
					<th>
					</th>
				</tr>

				<c:forEach items="${userList }" var="l">
					<tr>
						<td>${l.user_id }</td>
						<td>${l.user_name }</td>
						<td>${l.user_mail_id }@${l.user_mail_domain }</td>
						<td><c:if test="${l.user_state ==1 }">이용</c:if><c:if test="${l.user_state ==2 }">탈퇴</c:if></td>
						<td> <button type="button" class="btn btn-secondary" onclick="userUpdate('${l.user_id}');" style="margin-left:5px;">회원
							수정</button></td>
						<td><form action="<c:url value='/admin/user_delete'/>" method="post">
							<input type="hidden" name="user_id" value="${l.user_id }">
							<input type="submit" class="btn btn-danger" value="회원 삭제" />
						</form></td>
					</tr>

				</c:forEach>
			</table>
		</c:if>


		<!-- 버튼 -->
		<div style="width: 971px; margin-left: 350px;">
			<c:if test="${pc.prev }">
				<a style="float: left;"
					href="<c:url value='/admin/mypage?page=${pc.beginPage -1}&couterPerPage=${pc.paging.counterPerPage}'/>">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
						fill="currentColor" class="bi bi-caret-left-fill"
						viewBox="0 0 16 16">
  <path
							d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z" />
</svg>
				</a>
			</c:if>
			<div class="btn-toolbar" role="toolbar"
				aria-label="Toolbar with button groups" style="float: left;">
				<div class="btn-group me-2" role="group" aria-label="First group"
					style="margin: auto;">
					<c:forEach begin="${pc.beginPage }" var="pageNum"
						end="${pc.endPage }">
						<c:if test="${pc.paging.page == pageNum }">
							<button type="button"
								class="btn btn-outline-primary rounded-circle"
								style="margin-left: 10px;"
								onclick="location.href='<c:url value='/admin/mypage${pc.makeURI(pageNum,10)}'/>';">${pageNum }</button>
						</c:if>
						<c:if test="${pc.paging.page != pageNum }">
							<button type="button" class="btn btn-primary rounded-circle"
								style="margin-left: 10px;"
								onclick="location.href='<c:url value='/admin/mypage${pc.makeURI(pageNum,10)}'/>';">${pageNum }</button>
						</c:if>
					</c:forEach>

				</div>
			</div>

			<c:if test="${pc.next }">
				<a style="float: left;"
					href="<c:url value='/admin/mypage?page=${pc.endPage+1}&couterPerPage=${pc.paging.counterPerPage}'/>">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
						fill="currentColor" class="bi bi-caret-right-fill"
						viewBox="0 0 16 16">
  <path
							d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z" />
</svg>
				</a>
			</c:if>
		</div>
	</div>
</body>
</html>