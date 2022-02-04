<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/login.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/main.css'/>" />

<link rel="stylesheet"
	href="<c:url value='/resources/slide/css/swiper.min.css'/>" />
<link href="<c:url value='/css/board.css'/>" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="<c:url value='/resources/slide/css/swiper.min.css'/>">
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
<script src="<c:url value='/resources/slide/JS/swiper.min.js'/>"></script>
<script>
	var domain = '${f.user_mail_domain}';

	$(document).ready(function() {
		$('#mail_list_update').val(domain).prop("selected", true);
	});

	$(function() {
		$("#keyword").keydown(function(key) {
			if (key.keyCode == 13) { // 사용자가 누른 키가 13번이면 실행(엔티 : 13번 키)
				$("#srchKeyword").click();
			}
		});

		$('#srchKeyword').click(
				function() {
					var condition = $('#condition option:selected').val();
					var keyword = $('#keyword').val();

					location.href = "/project/user/mypage/list?keyword="
							+ keyword + "&condition=" + condition;
					console.log("검색조건 : " + keyword + "/" + condition);
				});

	});

	function dis() {
		if ($('#keyword_dropdown').css('display') == "none") {
			$('#keyword_dropdown').show();
		} else {
			$('#keyword_dropdown').hide();
		}
	}

	const result = "${msg}";
	if (result == "delete_success") {
		alert('게시글이 삭제되었습니다.');
	}
</script>
<script src="<c:url value='/js/join_update.js'/>"></script>
<body style="max-width: 1200px; width:100%; margin: auto auto 100px auto;">

<jsp:include page="../../include/header.jsp" />

	<hr>
	<br>
	<br>
	<!-- 마이페이지 목록 -->
	<div class="sub_list_wrap"
		style="font-family: 'Y_Spotlight'; font-size: 18px; margin-top: -30px;">
		<br>
		<div class="d-flex flex-column flex-shrink-0 p-3"
			style="width: 100%; height:100%; box-shadow: 0 30px 10px 0 rgba(31, 38, 135, 0.37);">
			<a href="#"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
				&nbsp;&nbsp;&nbsp; <svg xmlns="http://www.w3.org/2000/svg"
					width="16" height="16" fill="currentColor"
					class="bi bi-briefcase-fill" viewBox="0 0 16 16">
  <path
						d="M6.5 1A1.5 1.5 0 0 0 5 2.5V3H1.5A1.5 1.5 0 0 0 0 4.5v1.384l7.614 2.03a1.5 1.5 0 0 0 .772 0L16 5.884V4.5A1.5 1.5 0 0 0 14.5 3H11v-.5A1.5 1.5 0 0 0 9.5 1h-3zm0 1h3a.5.5 0 0 1 .5.5V3H6v-.5a.5.5 0 0 1 .5-.5z" />
  <path
						d="M0 12.5A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5V6.85L8.129 8.947a.5.5 0 0 1-.258 0L0 6.85v5.65z" />
</svg> <span class="fs-4">&nbsp;&nbsp; <b>마이페이지</b></span>
			</a>
			<hr>


			<ul class="nav nav-pills flex-column mb-auto">

				<li class="nav-item"><a href="#" class="nav-link active"
					aria-current="page"> <svg xmlns="http://www.w3.org/2000/svg"
							width="16" height="16" fill="currentColor"
							class="bi bi-folder-fill" viewBox="0 0 16 16">
  <path
								d="M9.828 3h3.982a2 2 0 0 1 1.992 2.181l-.637 7A2 2 0 0 1 13.174 14H2.825a2 2 0 0 1-1.991-1.819l-.637-7a1.99 1.99 0 0 1 .342-1.31L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3zm-8.322.12C1.72 3.042 1.95 3 2.19 3h5.396l-.707-.707A1 1 0 0 0 6.172 2H2.5a1 1 0 0 0-1 .981l.006.139z" />
</svg> <use xlink:href="#home"></use> </svg> 내가 쓴 후기
				</a></li>
				<li><a href="<c:url value='/user/mypage/join_update'/>"
					class="nav-link link-dark"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-unlock-fill" viewBox="0 0 16 16">
  <path
								d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2z" />
</svg> <use xlink:href="#speedometer2"></use> </svg> 회원정보 수정
				</a></li>
			</ul>
			<hr>

		</div>
	</div>


	<div style="width:75%; float: left;">
		<div style="margin-top: -40px;" id="board_list">
			<div class="sort-element">
				<br> <br>
				<ul class="sort-menu">

					<li class="active" style="margin-top: 10px;"><a href="#" title="목록 항목 선택됨" >업데이트순</a> <span
						style="color: gray;"> &nbsp;| &nbsp;</span></li>

					<li>
						<button type="button" class="btn btn-secondary" onclick="dis()">키워드
							검색</button>
					</li>
				</ul>
			</div>
		</div>

		<div class="clear"></div>
		<div
			style="width: 90%; margin: auto; display: none; text-align: center;"
			id="keyword_dropdown">
			<br>
			<div style="float: left; width: 30%">
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
			<div style="float: left; width: 70%;">
				<input type="text" id="keyword" name="keyword" size="65"
					placeholder="키워드" class="form-control" style="margin-bottom: 20px;">
			</div>
			<div>
				<button type="button"
					class="btn btn-secondary btn-lg btn-block form-control"
					id="srchKeyword">검색</button>
			</div>
			<br>
		</div>


		<br>

		<div>

			<c:if test="${ articles.size() <=0}">
				<div style="width: 100%; text-align: center;">
					<p>검색 결과가 없습니다.</p>
				</div>
			</c:if>

			<c:if test="${articles.size() >0}">



				<div id="mypage_list" style="font-family: 'Nanum Gothic', sans-serif; max-height: 700px;">
					<ul style="width:100%; height:100%; float:left; list-style-type: none; max-height: 700px;">
						<c:forEach items="${articles }" var="a" >
							<c:if test="${a.content_step ==0 }">
								<li style="width:30%; margin:5px 0px 5px 10px; float:left; border:0.1px solid #EAEAEA; padding:5px 5px; color:black; height:auto; "><c:if
										test="${a.content_file==null}">
										<img src="<c:url value='/images/ic01.jpg'/>" alt="썸네일" class="rounded" width="100%" height="150px" style="vertical-align: center;"/>
									</c:if> <c:if test="${a.content_file!=null }">
										<img src="<%=request.getContextPath()%>${a.content_file} " alt="썸네일" class="rounded" width="100%"  height="150px" style="vertical-align: center;"/>
									</c:if> <a
									href="<c:url value='/user/community/content/${a.content_no }${param.page==null? pc.makeURI(1,9):pc.makeURI(param.page,9)}'/>"
									title="페이지 이동"
									style="width:100%; outline: none; border: none; color:black; float:left; height:10%;">

										<div style="text-align: right;">
											<small  style="font-size:10px;"><fmt:formatDate value="${a.content_regdate }"
													pattern="yyyy년 MM월 dd일" /></small>
										</div>

										<div>
											<p class="mb-1" style="font-size:15px;"><b>${a.content_title }</b></p>
										</div>
								</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</c:if>


		</div>
		<div class="clear"></div>
		<br><br>

		<!-- 버튼 -->
		<div style="width:75%; float:right; margin-bottom: 50px;">
			<c:if test="${pc.prev }">
				<a style="float: left;"
					href="<c:url value='/user/mypage/list?page=${pc.beginPage -1}&couterPerPage=9'/>">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
						fill="currentColor" class="bi bi-caret-left-fill"
						viewBox="0 0 16 16">
  <path
							d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z" />
</svg>
				</a>
			</c:if>
			<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups"  style="float:left;" >
  					<div class="btn-group me-2" role="group" aria-label="First group" style="margin: 10px auto;">
  					<c:forEach begin="${pc.beginPage }" var="pageNum" end="${pc.endPage }">
  					<c:if test="${pc.paging.page == pageNum }">
  						<button type="button" class="btn btn-outline-primary rounded-circle" style="margin-left:10px;" onclick="location.href='<c:url value='/user/mypage/list${pc.makeURI(pageNum,9)}'/>';">${pageNum }</button>
  					</c:if>
  					<c:if test="${pc.paging.page != pageNum }">
  						<button type="button" class="btn btn-primary rounded-circle" style="margin-left:10px;" onclick="location.href='<c:url value='/user/mypage/list${pc.makeURI(pageNum,9)}'/>';">${pageNum }</button>
  					</c:if>
  					</c:forEach>
    					
  					</div>
  				</div>

			<c:if test="${pc.next }">
				<a style="float: left;"
					href="<c:url value='/user/mypage/list?page=${pc.endPage+1}&couterPerPage=9'/>">
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



	</div>
</body>
</html>