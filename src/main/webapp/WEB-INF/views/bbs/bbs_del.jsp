<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 삭제</title>
<script src="./resources/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/bbs.css" />
<script>
function del_check(){
	if($.trim($("#del_pwd").val())==""){
		alert("비밀번호를 입력하세요!");
		$('#del_pwd').val('').focus();
		return false;
	}
}
</script>
</head>
<body>
<div id="bDel_wrap">
<h2 class="bDel_title">자료실 삭제</h2>
<form method="post" action="bbs_del_ok" onsubmit="return del_check();">
<input type="hidden" name="bbs_no" value="${b.bbs_no}"/>
<input type="hidden" name="page" value="${page}"/>

<table id="bDel_t">
<tr>
<th>비밀번호</th>
<td><input type="password" name="del_pwd" id="del_pwd" size="14" /></td>
</tr>
</table>

<div id="bDel_menu">
<input type="submit" value="삭제"/>
<input type="button" value="취소" onclick="location='bbs_list?page=${page}"/>
</div>

</form>
</div>
</body>
</html>