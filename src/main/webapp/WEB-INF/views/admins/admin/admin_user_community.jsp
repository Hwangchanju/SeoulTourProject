<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
//엔터키 입력 이벤트 처리
$(function(){
	
$("#keyword").keydown(function(key) {
	if (key.keyCode == 13) { // 사용자가 누른 키가 13번이면 실행(엔티 : 13번 키)
		$("#srchKeyword").click();
	}
});	

$('#srchKeyword').click(function(){
	var condition = $('#condition option:selected').val();
	var keyword = $('#keyword').val();
	
	location.href = "/project/admin/admin_community?keyword="+ keyword + "&condition=" + condition;
	console.log("검색조건 : "+keyword+"/"+condition);
});

});

function dis(){
	if($('#keyword_dropdown').css('display')=="none"){
		$('#keyword_dropdown').show();
	}else{
		$('#keyword_dropdown').hide();
	}
}

const result = "${msg}";
if(result == "delete_success"){
	alert('게시글이 삭제되었습니다.');
}
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
			<li class="nav-item"><a href="<c:url value='/admin/mypage'/>"
				class="nav-link text-white" aria-current="page"
				style="font-size: 20px;"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-person-lines-fill"
						viewBox="0 0 16 16">
  <path
							d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
</svg>&nbsp;&nbsp; 회원 관리
			</a></li>
			<li><a href="<c:url value='/bbs_list'/>"
				class="nav-link text-white" style="font-size: 20px;"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
  <path
							d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
  <path
							d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
</svg>&nbsp;&nbsp; 게시판 관리
			</a></li>
			<li><a href="<c:url value='/admin/admin_community'/>"
				class="nav-link text-white active" style="font-size: 20px;"> <svg
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
	<div class="h-example-divider"></div>

			<div style="float: left;">
				<div class="sort-element">
					<button type="button" class="btn btn-secondary" onclick="dis()"
						style="margin-left: 140px; ">키워드 검색</button>
				</div>
			</div>


			<div class="clear"></div>
			<div style="width: 80%; margin: auto; display: none;"
				id="keyword_dropdown">
				<br>
				<div style="float: left; width: 10%">
					<select name="condition" id="condition" class="form-control"
						aria-label="Default select example">
						<option value="title" ${param.condition == 'title'?'selected':'' }>제목</option>
						<option value="content"
							${param.condition == 'content'?'selected':'' }>내용</option>
						<option value="titleContent"
							${param.condition=='titleContent'?'selected':'' }>제목+내용</option>
						<option value="local" ${param.condition == 'local'?'selected':'' }>지역</option>
					</select>
				</div>
				<div style="float: left; width: 50%;">
					<input type="text" id="keyword" name="keyword" size="65"
						placeholder="키워드" class="form-control"
						style="margin-bottom: 20px;">
				</div>
				<div>
					<button type="button"
						class="btn btn-secondary btn-lg btn-block form-control"
						id="srchKeyword" style="width:10%; height:39px; font-size:18px;">검색</button>
				</div>
			</div>








			<c:if test="${ articles.size() <=0}">
				<div style="width: 100%; text-align: center;">
					<p>검색 결과가 없습니다.</p>
				</div>
			</c:if>

			<c:if test="${articles.size() >0}">
				<table id="member_list" style="margin-top:80px;">
					<tr>
						<th>아이디</th>
						<th>제목</th>
						<th>지역</th>
						<th>등록날짜</th>
						<th>글 삭제</th>
					</tr>

					<c:forEach items="${articles }" var="a">
						<c:if test="${a.content_step ==0 }">
							<tr>
								<td>${a.content_id }</td>
								<td><a
									href="<c:url value='/user/community/content/${a.content_no }${param.page==null? pc.makeURI(1,10):pc.makeURI(param.page,10)}'/>"
									title="페이지 이동">${a.content_title }</a></td>
								<td>${a.content_local }</td>
								<td><c:if test="${a.newCont == true }">
										<fmt:formatDate value="${a.content_regdate }"
											pattern="HH:MM(a)" />
									</c:if> <c:if test="${a.newCont != true }">
										<fmt:formatDate value="${a.content_regdate }"
											pattern="yyyy년 MM월 dd일" />
									</c:if></td>
								<td><form action="<c:url value='/admin/cont_delete'/>" method="post">
										<input type="hidden" name="content_id" value="${a.content_id }">
										<input type="hidden" name="content_no" value="${a.content_no}"/>
										<input type="submit" class="btn btn-danger" value="글 삭제" />
									</form></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</c:if>



			<br>

			<div class="clear"></div>

			<!-- 버튼 -->
			<div style="width: 971px; margin-left: 350px;">
				<c:if test="${pc.prev }">
					<a style="float: left;"
						href="<c:url value='/admin/admin_community?page=${pc.beginPage -1}&couterPerPage=10'/>">
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
									onclick="location.href='<c:url value='/admin/admin_community${pc.makeURI(pageNum,10)}'/>';">${pageNum }</button>
							</c:if>
							<c:if test="${pc.paging.page != pageNum }">
								<button type="button" class="btn btn-primary rounded-circle"
									style="margin-left: 10px;"
									onclick="location.href='<c:url value='/admin/admin_community${pc.makeURI(pageNum,10)}'/>';">${pageNum }</button>
							</c:if>
						</c:forEach>

					</div>
				</div>

				<c:if test="${pc.next }">
					<a style="float: left;"
						href="<c:url value='/user/community/list?page=${pc.endPage+1}&couterPerPage=${pc.paging.counterPerPage}'/>">
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

		<div class="clear"></div>
</body>
</html>