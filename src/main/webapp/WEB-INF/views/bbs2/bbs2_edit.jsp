<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="./resources/js/summernote-ko-KR.js"></script>
<script src="./resources/js/bbs2.js"></script>
<title>글수정</title>

<script>
$(document).ready(function() {
	  $('#bbs2_cont').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
</head>
<body>
<h2 style="text-align: center;">글 수정</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="bbs2_edit_ok" onsubmit="return write_check();" enctype="multipart/form-data">
	<input type="hidden" name="bbs2_no" value="${b2.bbs_no}"/>
    <input type="hidden" name="page" value="${page}"/>
		<input type="text" name="bbs2_title" id="bbs2_title" style="width: 40%;" placeholder="제목" value="${b2.bbs_title}"/><br>
		<input type="text" name="bbs2_name" id="bbs2_name" style="width: 20%;" placeholder="작성자" value="${b2.bbs_name}"/><br>
		<input type="password" name="bbs2_pwd" id="bbs2_pwd" style="width:20%" placeholder="비밀번호" /><br>
		<input type="text" name="bbs2_category" id="bbs2_category" style="width:40%" placeholder="카테고리" value="${b2.bbs_category}"/><br>
		<br><br> 
		<textarea id="bbs2_cont" name="bbs2_cont">${b2.bbs_cont}</textarea>
		<input type="file" name="bbs2_file" /><p>${b2.bbs_file}</p>
		<input type="submit" value="글수정" style="float: right;" />
     <input type="button" value="목록" onclick="location='bbs2_list?page=${page}';" />
	</form>
</div>

</body>
</html>