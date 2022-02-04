<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../../include/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>" />
<script src="<c:url value='/js/jquery.js'/>"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<style>
h6 {
	color: black;
	text-align: center;
	font-weight: bold;
}

p {
	color: black;
}
</style>
<body
	style="width:100%; margin-left: auto; margin-right: auto; height: 900px; max-width:1200px;">
	<hr>
	<br>
	<br>
	<div class="sub_list_wrap" style="font-family: 'Y_Spotlight'; font-size:22px;">
		<br>
		<div class="d-flex flex-column flex-shrink-0 p-3"
			style="width: 100%; height: 90%; box-shadow: 0 30px 10px 0 rgba(31, 38, 135, 0.37);">
			<a href="#"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
				&nbsp;&nbsp;&nbsp; <svg xmlns="http://www.w3.org/2000/svg"
					width="20" height="20" fill="currentColor"
					class="bi bi-calendar2-check-fill" viewBox="0 0 16 16">
  <path
						d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zm9.954 3H2.545c-.3 0-.545.224-.545.5v1c0 .276.244.5.545.5h10.91c.3 0 .545-.224.545-.5v-1c0-.276-.244-.5-.546-.5zm-2.6 5.854a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
</svg> <span class="fs-4">&nbsp;&nbsp; <b> 행사/전시</b></span>
			</a>
			<hr>


			<ul class="nav nav-pills flex-column mb-auto">

				<li class="nav-item"><a href="<c:url value='/admin/exhibition/exhibition/1'/>" class="nav-link link-dark"
					aria-current="page"><svg xmlns="http://www.w3.org/2000/svg"
							width="16" height="16" fill="currentColor" class="bi bi-bank2"
							viewBox="0 0 16 16">
  <path
								d="M8.277.084a.5.5 0 0 0-.554 0l-7.5 5A.5.5 0 0 0 .5 6h1.875v7H1.5a.5.5 0 0 0 0 1h13a.5.5 0 1 0 0-1h-.875V6H15.5a.5.5 0 0 0 .277-.916l-7.5-5zM12.375 6v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zM8 4a1 1 0 1 1 0-2 1 1 0 0 1 0 2zM.5 15a.5.5 0 0 0 0 1h15a.5.5 0 1 0 0-1H.5z" />
</svg> &nbsp; 전시 </a></li>
				<li><a href="<c:url value='/admin/exhibition/events/1'/>"
					class="nav-link active"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-binoculars-fill"
							viewBox="0 0 16 16">
  <path
								d="M4.5 1A1.5 1.5 0 0 0 3 2.5V3h4v-.5A1.5 1.5 0 0 0 5.5 1h-1zM7 4v1h2V4h4v.882a.5.5 0 0 0 .276.447l.895.447A1.5 1.5 0 0 1 15 7.118V13H9v-1.5a.5.5 0 0 1 .146-.354l.854-.853V9.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v.793l.854.853A.5.5 0 0 1 7 11.5V13H1V7.118a1.5 1.5 0 0 1 .83-1.342l.894-.447A.5.5 0 0 0 3 4.882V4h4zM1 14v.5A1.5 1.5 0 0 0 2.5 16h3A1.5 1.5 0 0 0 7 14.5V14H1zm8 0v.5a1.5 1.5 0 0 0 1.5 1.5h3a1.5 1.5 0 0 0 1.5-1.5V14H9zm4-11H9v-.5A1.5 1.5 0 0 1 10.5 1h1A1.5 1.5 0 0 1 13 2.5V3z" />
</svg> &nbsp; 축제/행사
				</a></li>
				<li class="nav-item"><a href="<c:url value='/admin/exhibition/culture/1'/>" class="nav-link link-dark"
					aria-current="page"><svg xmlns="http://www.w3.org/2000/svg"
							width="16" height="16" fill="currentColor"
							class="bi bi-tags-fill" viewBox="0 0 16 16">
  <path
								d="M2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2zm3.5 4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
  <path
								d="M1.293 7.793A1 1 0 0 1 1 7.086V2a1 1 0 0 0-1 1v4.586a1 1 0 0 0 .293.707l7 7a1 1 0 0 0 1.414 0l.043-.043-7.457-7.457z" />
</svg> &nbsp; 공연 </a></li>
			</ul>
			<hr>

		</div>
	</div>
	<br>
	<div style="width: 1250px; margin: 50px auto 50px auto;">
		<c:forEach begin="0" end="0" var="i">
			<div class="card"
				style="width: 250px; float: left; margin-left: 10px; margin-bottom: 70px; height: 300px;">
				<img src="https://korean.visitseoul.net/${list_img[i]}"
					class="card-img-top" alt="배경이미지">
				<div class="card-body">
					<a href="https://korean.visitseoul.net/${list_url[i]}"
						class="card-text">
						<h6 class="card-title">${list_title[i]}</h6>
						<p class="card-text" style="text-align: center;">${list_date[i]}</p>
					</a>
				</div>
			</div>
		</c:forEach>
	<div class="clear"></div>
	<div class="btn-group me-2 center" role="group"
		aria-label="First group" style="width: 200px; margin: auto; float:right;">
		<c:forEach begin="1" end="${paging_cnt }" var="p">
			<button type="button" class="btn btn-primary"
				onclick="location.href='<c:url value='/admin/exhibition/events/${p }'/>';">${p }</button>
		</c:forEach>
	</div>
	<div class="clear"></div>

			
	</div>

	
</body>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</html>