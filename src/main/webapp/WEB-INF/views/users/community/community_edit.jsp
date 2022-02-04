<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<jsp:include page="../../include/header.jsp" />
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="<c:url value='/js/summernote-ko-KR.js'/>"></script>

<script src="<c:url value='/js/community.js'/>"></script>


<body id="board_content">

	<br>
	<br>
	<div id="wrap">
	
			<div>

				<br>

				<hr>

				<br>
				<br>
				<figure class="text-end">
					<blockquote class="blockquote">
						<h4>게시물을 수정하실 수 있습니다.</h4>
					</blockquote>
					<figcaption class="blockquote-footer">
						 이미지 등의 요소들은 <cite title="Source Title">버튼</cite>을 눌러 삽입해주세요.
					</figcaption>
				</figure>
				<br>

				<div style="width: 100%; margin: auto;">
				
				<!--  <form action="<c:url value='/user/community/delete'/>" method="post">  -->
				<form method="post" enctype="multipart/form-data" id="contentUploadForm"> 
				<input type="hidden" id="content_id" value="${c.content_id }" name="content_id"/>
				<input type="hidden" id="content_no" value="${c.content_no }" name="content_no"/>
						<div class="content_title_wrap">
							<div class="mb-3">
								<label for="content_title" class="form-label"
									style="display: inline;">제목 &nbsp;: &nbsp;</label> <input
									type="text" class="form-control" id="content_title"
									value="${c.content_title }">
							</div>
							<div class="mb-3">
								<label for="content_writer" class="form-label"
									style="display: inline;">글쓴이 &nbsp; : &nbsp;</label> <input
									type="text" class="form-control" id="content_name"
									value="${c.content_name }" readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="content_local" class="form-label"
									style="display: inline;">장소(구단위) &nbsp; : &nbsp;</label> 
									<select id="content_local" name="content_local" class="form-select form-control" aria-label="Default select example" style="display: inline; width:300px;">
  										<option value="all">전체</option>
  										<c:forEach items="${l}" var="local">
  											<option value="${local}" ${c.content_local == local ? 'selected' : ''}>${local}</option>
  										</c:forEach>
									</select>
							</div>
						</div>
						<br> <br>
			
						<textarea id="summernote" name="content_cont">${c.content_cont }</textarea><br>
						<div class="input-group mb-3">
  							<label class="input-group-text" for="content_file">썸네일 업로드(지정하지 않으시면 기본 이미지가 세팅됩니다.)</label>
  							<input type="file" class="form-control" id="content_file" name="content_file" value="<%=request.getContextPath()%>${c.content_file }">
						</div>
						
							
							<a class="btn btn-primary" href="<c:url value='/user/community/list?page=${paging.page}&counterPerPage=${paging.counterPerPage}'/>">목록</a>
							<input id="content_edit_Btn" type="button" value="글 수정하기"
							style="float: right;"  class="btn btn-dark"/>
						</form>
						
						<form method="post" action="<c:url value='/user/community/delete'/>">
						<input type="hidden" id="content_no" value="${c.content_no }" name="content_no"/>
						<button id="delete_content" class="btn btn-primary" type="submit" onclick="return confirm('정말로 삭제하시겠습니까?');">글 삭제</button>
						</form>
				</div>

			</div>
	
		</div>

</body>
</html>