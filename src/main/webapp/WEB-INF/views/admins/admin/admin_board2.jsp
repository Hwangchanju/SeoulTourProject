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
<link href="<c:url value='/css/board.css'/>" rel="stylesheet"
	type="text/css" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>


<script>

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


function dis(){
	if($('#keyword_dropdown').css('display')=="none"){
		$('#keyword_dropdown').show();
	}else{
		$('#keyword_dropdown').hide();
	}
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
			<li><a href="<c:url value='/admin/admin_board'/>"
				class="nav-link text-white active" style="font-size: 20px;"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
  <path
							d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
  <path
							d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
</svg>&nbsp;&nbsp; 게시판 관리
			</a></li>
			<li><a href="<c:url value='/admin/admin_community'/>"
				class="nav-link text-white" style="font-size: 20px;"> <svg
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
		<button class="btn btn-primary"
				onclick="location.href='<c:url value='/bbs_write'/>';"
				style="margin: 100px 190px 50px 0px; float:right;">글쓰기</button>
		<form method="get" action="bbs_list">
			<div style="float: left;">
				<div class="sort-element">
					<br> <br>
					<ul class="sort-menu" style="list-style-type: none;">

						<li class="active"><a href="<c:url value='/bbs2_list'/>"
							title="목록 항목 선택됨"><b>인기</b></a> <span style="color: gray;">
								&nbsp;| &nbsp;</span></li>
						<li><a href="<c:url value='/bbs_list'/>">코스</a> &nbsp; &nbsp;</li>

						<li>
							<button type="button" class="btn btn-secondary" onclick="dis()">키워드
								검색</button>
						</li>
					</ul>
				</div>
			</div>
			<div>
				<div class="h-example-divider"></div>

				<div class="p-3 mb-3"
					style="margin-top: 10px;  ">
					<div class="container">

						<div>
							<div style="width: 100%; margin: auto; display:none; margin-left: 120px;" id="keyword_dropdown">
								<br>
								<div style="float: left; width: 10%">
									<select name="find_field" id="condition" class="form-control"
										aria-label="Default select example">
										<option value="bbs_title"
											<c:if test="${find_field == 'bbs_title'}"> ${'selected'}</c:if>>제목</option>
										<option value="bbs_cont"
											<c:if test="${find_field == 'bbs_cont'}"> ${'selected'}</c:if>>내용</option>
									</select>
								</div>
								<div style="float: left; width: 50%;">
									<input type="text" name="find_name" id="find_name" size="65"
										placeholder="키워드" class="form-control"
										style="margin-bottom: 20px;">
								</div>
								<div>
									<input type="submit" class="btn btn-secondary" id="srchKeyword"
										style="display: inline; width: 10%;" value="검색" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div style="clear:both;"> </div>
			<c:if test="${blist== null }">
				<p>사용자가 없습니다.</p>
			</c:if>

			<c:if test="${blist != null }">
				<table id="member_list">
					<tr>
						<th>아이디</th>
						<th>제목</th>
						<th>조회수</th>
						<th>등록일자</th>
						<th></th>
						<th></th>
					</tr>

					<c:forEach items="${blist }" var="l">
						<tr>
							<td>${l.bbs_name}</td>
							<td> <a href="bbs2_cont?bbs2_no=${l.bbs_no}&page=${page}&state=cont">${l.bbs_title }</a></td>
							<td>${l.bbs_hit }</td>
							<td>${l.bbs_date}</td>
							<td><input type="button" class="btn btn-secondary"
								value="수정"
								onclick="location='bbs2_cont?bbs2_no=${l.bbs_no}&page=${page}&state=edit';" />

							</td>
							<td><input type="button" class="btn btn-danger" value="삭제"
								onclick="location='bbs2_cont?bbs2_no=${l.bbs_no}&page=${page}&state=del';" /></td>
						</tr>

					</c:forEach>
				</table>
			</c:if>


			<!-- 버튼 -->
			<div style="width: 971px; margin-left: 350px;">
				<%-- 검색 전 페이징(쪽나누기) --%>
				<c:if test="${(empty find_field) && (empty find_name)}">
					<c:if test="${page <= 1}">
     &#171;&nbsp;
    </c:if>
					<c:if test="${page >1}">
						<a href="bbs_list?page=${page-1}">&#171;</a>&nbsp;
    </c:if>

					<%-- 쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a==page}"><${a}></c:if>

						<c:if test="${a != page}">
							<a href="bbs_list?page=${a}">${a}</a>&nbsp;
     </c:if>
					</c:forEach>

					<c:if test="${page >= maxpage}">&#187;</c:if>

					<c:if test="${page < maxpage}">
						<a href="bbs_list?page=${page+1}">&#187;</a>
					</c:if>
				</c:if>

				<%-- 검색 후 페이징  --%>
				<c:if test="${(!empty find_field) && (!empty find_name)}">
					<c:if test="${page <= 1}">
     &#171;&nbsp;
    </c:if>
					<c:if test="${page >1}">
						<a
							href="bbs_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">&#171;</a>&nbsp;
    </c:if>

					<%-- 쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a==page}"><${a}></c:if>

						<c:if test="${a != page}">
							<a
								href="bbs_list?page=${a}&find_field=${find_field}&find_name=${find_name}">${a}</a>&nbsp;
     </c:if>
					</c:forEach>

					<c:if test="${page >= maxpage}">&#187;</c:if>

					<c:if test="${page < maxpage}">
						<a
							href="bbs_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">&#187;</a>
					</c:if>
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>