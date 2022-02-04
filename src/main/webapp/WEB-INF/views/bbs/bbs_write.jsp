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
<script src="./resources/js/bbs.js"></script>
<title>글쓰기</title>

<script>
$(document).ready(function() {
	  $('#bbs_cont').summernote({
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
<h2 style="text-align: center;">글 작성</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="bbs_write_ok" onsubmit="return write_check();" enctype="multipart/form-data">
		<input type="text" name="bbs_title" id="bbs_title" style="width: 40%;" placeholder="제목"/><br>
		<input type="text" name="bbs_name" id="bbs_name" style="width: 20%;" placeholder="작성자"/><br>
		<input type="password" name="bbs_pwd" id="bbs_pwd" style="width:20%" placeholder="비밀번호" />
		<br><br> 
		<textarea id="bbs_cont" name="bbs_cont"></textarea>
		<input type="file" name="bbs_file" />
		<input type="submit" value="글저장" style="float: right;" />
	</form>
</div>

</body>
</html>