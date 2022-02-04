<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>


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

<script src="<c:url value='/js/community.js'/>"></script>
<jsp:include page="../../include/header.jsp" />
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
	
	location.href = "/project/user/community/list?keyword="+ keyword + "&condition=" + condition;
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
<style>
h6 {
	color: black;
	font-weight: bold;
}

p, small {
	color: black;
}

a:hover{
	text-decoration: none;
}

</style>

<body id="board_list">
	<div id="wrap">
		<hr>
		<div >
			<div class="sort-element">
				<br> <br>
				<ul class="sort-menu">

					<li class="active" style="float: left;"><a
						href="<c:url value='/user/community/list'/>">업데이트순</a> <span
						style="color: gray;"> &nbsp;| &nbsp;</span></li>
					<li><a href="#">조회순</a> &nbsp; &nbsp;</li>
					
					
				</ul>
				<div style="clear:both;"></div>
				<button type="button" class="btn btn-secondary" onclick="dis()" style="float:right;">키워드
							검색</button>
				</div>
		</div>
		<div class="clear"></div>
		
		<div style="width:100%;  display: none;"
			id="keyword_dropdown">
			<br>
			<div style="float:right; width: 10%">
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
			<div style="float:right; width: 40%;">
				<input type="text" id="keyword" name="keyword" size="65"
					placeholder="키워드" class="form-control" style="margin-bottom: 20px;">
			</div>
			<div style="clear:both;"></div>
			<div>
				<button type="button"
					class="btn btn-secondary btn-lg btn-block form-control"
					id="srchKeyword" style="width:50%; float:right;">검색</button>
			</div>
			<div style="clear:both;"></div>
		</div>
		
<input type="button" value="글쓰기"
			onclick="location.href='<c:url value='/user/community/write'/>;'"
			style="float: right; margin:20px auto 20px auto; width:110px;" class="btn btn-primary" />
			
<br> <br>
		<c:if test="${mostHit!=null && param.page==1}">
			<!-- 캐러셀 -->

			<div id="carouselExampleCaptions" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a
							href="<c:url value='/user/community/content/${mostHit[0].content_no }${param.page==null? pc.makeURI(1,8):pc.makeURI(param.page,8)}'/>"
							title="페이지 이동"> <img
							src="<%=request.getContextPath()%>${mostHit[0].content_file}"
							class="d-block w-100 " style="height: 500px;" alt="1">
							<div class="carousel-caption d-none d-md-block" style="color:white;">
								<h5 style="color:white;">${mostHit[0].content_title}</h5>
								<p style="color:white;">아이디 : ${mostHit[0].content_id} /&nbsp; 등록일자 :
									${mostHit[0].content_regdate}&nbsp; / 조회수 :
									${mostHit[0].content_hit}</p>
							</div>
						</a>
					</div>
					<div class="carousel-item">
						<a
							href="<c:url value='/user/community/content/${mostHit[1].content_no }${param.page==null? pc.makeURI(1,8):pc.makeURI(param.page,8)}'/>"
							title="페이지 이동"> <img
							src="<%=request.getContextPath()%>${mostHit[1].content_file}"
							class="d-block w-100" style="height: 500px;" alt="1">
							<div class="carousel-caption d-none d-md-block" style="color:white;">
								<h5 style="color:white;">${mostHit[1].content_title}</h5>
								<p style="color:white;">아이디 : ${mostHit[1].content_id} /&nbsp; 등록일자 :
									${mostHit[1].content_regdate}&nbsp; / 조회수 :
									${mostHit[1].content_hit}</p>
							</div>
						</a>
					</div>
					<div class="carousel-item">
						<a
							href="<c:url value='/user/community/content/${mostHit[2].content_no }${param.page==null? pc.makeURI(1,8):pc.makeURI(param.page,8)}'/>"
							title="페이지 이동"> <img
							src="<%=request.getContextPath()%>${mostHit[2].content_file}"
							class="d-block w-100" style="height: 500px;" alt="1">
							<div class="carousel-caption d-none d-md-block" style="color:white;">
								<h5 style="color:white;">${mostHit[2].content_title}</h5>
								<p style="color:white;">아이디 : ${mostHit[2].content_id} /&nbsp; 등록일자 :
									${mostHit[2].content_regdate}&nbsp; / 조회수 :
									${mostHit[2].content_hit}</p>
							</div>
						</a>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>

		</c:if>

<br><br>
		<c:if test="${ articles.size() <=0}">
			<div style="width: 100%; text-align: center;">
				<p>검색 결과가 없습니다.</p>
			</div>
		</c:if>

<div id="community_list">
		<c:if test="${articles.size() >0}">
			<c:forEach items="${articles }" var="a">
				<c:if test="${a.content_step ==0 }">

					<div class="card"
						style="width: 280px; float:left; margin-left:15px; margin-bottom: 70px; height: 350px;">

						<c:if test="${a.content_file==null}">
							<img src="<c:url value='/images/ic01.jpg'/>" alt="썸네일"
								class="rounded float-start" style="height: 200px;" />
						</c:if>
						<c:if test="${a.content_file!=null }">
							<img src="<%=request.getContextPath()%>${a.content_file} "
								alt="썸네일" class="rounded float-start" style="height: 200px;" />
						</c:if>

						<div class="card-body">
							<a
								href="<c:url value='/user/community/content/${a.content_no }${param.page==null? pc.makeURI(1,8):pc.makeURI(param.page,8)}'/>"
								title="페이지 이동" class="card-text">
								<h6 class="card-title">${a.content_title }</h6>
								<p>지역 : ${a.content_local }</p> <small>조회수 : ${a.content_hit }</small>
								<p class="card-text" style="text-align: right;">
									<c:if test="${a.newCont == true }">
										<fmt:formatDate value="${a.content_regdate }"
											pattern="HH:MM(a)" />
									</c:if>
									<c:if test="${a.newCont != true }">
										<fmt:formatDate value="${a.content_regdate }"
											pattern="yyyy년 MM월 dd일" />
									</c:if>
								</p>
							</a>
						</div>
					</div>


				</c:if>
			</c:forEach>

		</c:if>
</div>


		<br> 
		<div class="clear"></div>

		<!-- 버튼 -->
		<div style="width:100%; margin:auto;">
			<c:if test="${pc.prev }">
				<a style="float: left; margin:auto;"
					href="<c:url value='/user/community/list?page=${pc.beginPage -1}&couterPerPage=${pc.paging.counterPerPage}'/>">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
						fill="currentColor" class="bi bi-caret-left-fill"
						viewBox="0 0 16 16">
  <path
							d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z" />
</svg>
				</a>
			</c:if>
			<div class="btn-toolbar" role="toolbar"
				aria-label="Toolbar with button groups" style="float: left; margin:auto;">
				<div class="btn-group me-2" role="group" aria-label="First group"
					style="margin: auto;">
					<c:forEach begin="${pc.beginPage }" var="pageNum"
						end="${pc.endPage }">
						<c:if test="${pc.paging.page == pageNum }">
							<button type="button"
								class="btn btn-outline-primary rounded-circle"
								style="margin-left: 10px;"
								onclick="location.href='<c:url value='/user/community/list${pc.makeURI(pageNum,8)}'/>';">${pageNum }</button>
						</c:if>
						<c:if test="${pc.paging.page != pageNum }">
							<button type="button" class="btn btn-primary rounded-circle"
								style="margin-left: 10px;"
								onclick="location.href='<c:url value='/user/community/list${pc.makeURI(pageNum,8)}'/>';">${pageNum }</button>
						</c:if>
					</c:forEach>

				</div>
			</div>

			<c:if test="${pc.next }">
				<a style="float: left; margin:auto;s"
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