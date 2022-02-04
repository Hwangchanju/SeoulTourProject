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


<script>
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder : '내용을 입력해주세요.',
		minHeight : 370,
		maxHeight : null,
		focus : true,
		lang : 'ko-KR'
	/*
	 * callbacks : { onImageUpload : function(files, editor, welEditable) { for
	 * (var i = files.length - 1; i >= 0; i--) { sendFile(files[i], this); } } }
	 */
	});
});

</script>
<body id="board_content">

	<br>
	<br>
	<div id="wrap">
	
			<div>

				<br>

				<hr>

				<br>
				<br>
				<figure>
					<blockquote class="blockquote">
						<h4>게시물을 작성해주세요.</h4>
					</blockquote>
					<figcaption class="blockquote-footer">
						 이미지 등의 요소들은 <cite title="Source Title">버튼</cite> 을 눌러 삽입해주세요. / 게시물 썸네일은 하단에서 지정하실 수 있습니다.
					</figcaption>
				</figure>
				<br>

				<div style="width: 100%; margin: auto;">
				
				<form method="post" enctype="multipart/form-data" id="contentUploadForm"> 
				<input type="hidden" id="content_id" value="${p.user_id }"/>
						<div class="content_title_wrap">
							<div class="mb-3">
								<label for="content_title" class="form-label"
									style="display: inline;">제목 &nbsp;: &nbsp;</label> <input
									type="text" class="form-control" id="content_title"
									placeholder="제목을 입력해주세요.">
							</div>
							<div class="mb-3">
								<label for="content_writer" class="form-label"
									style="display: inline;">글쓴이 &nbsp; : &nbsp;</label> <input
									type="text" class="form-control" id="content_name"
									value="${p.user_name }" readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="content_local" class="form-label"
									style="display: inline;">장소(구단위) &nbsp; : &nbsp;</label> 
									<select id="content_local" name="content_local" class="form-select form-control" aria-label="Default select example" style="display: inline; width:300px;">
  										<option selected value="전체">전체</option>
  										<c:forEach items="${l}" var="local">
  											<option value="${local}">${local}</option>
  										</c:forEach>
									</select>
							</div>
						</div>
						<br> <br>
						<div id="summernote"></div>
						<div class="input-group mb-3">
  							<label class="input-group-text" for="content_file">썸네일 업로드(지정하지 않으시면 기본 이미지가 세팅됩니다.)</label>
  							<input type="file" class="form-control" id="content_file" name="content_file">
						</div>
						
						<!--<textarea id="summernote" name="content_cont"></textarea><br> -->
						
						<br>
							<button id="edit" class="btn btn-primary" type="button">수정하기</button>
							<button id="save" class="btn btn-primary" type="button">미리보기</button>
							
							<input id="content_write_Btn" type="button" value="글 작성"
							style="float: right;"  class="btn btn-secondary"/>
						</form>
				</div>

			</div>

	</div>


</body>
</html>