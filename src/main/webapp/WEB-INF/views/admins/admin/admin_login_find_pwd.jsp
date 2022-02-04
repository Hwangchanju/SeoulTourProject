<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/login.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/main.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/swiper.min.css'/>" />
<link href="<c:url value='/css/board.css'/>" rel="stylesheet"
	type="text/css" />

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>


<script>
	const getEmail = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/); // 이메일 정규표현식


	function setDisplayPhone(){
		if($('input:radio[id=more_phone]').is(':checked')){
			$('#admin_name2').val('');
			$('#admin_id2').val('');
			$('#admin_mail_id').val('');
			
			$('.email_identify').hide();
			$('.phone_identify').show();
		}
	}
	
	function setDisplayEmail(){
		if($('input:radio[id=more_email]').is(':checked')){
			$('#admin_name1').val('');
			$('#admin_id1').val('');
			$('#admin_phone').val('');
			$('.phone_identify').hide();
			$('.email_identify').show();
		}
	}
	
</script>
<body class="login_wrap align-middle text-center text-white bg-dark">
	<div id="find">
		<div style="text-align: center;" id="logo">
			<img src="<c:url value='/images/logoColor.png'/>" alt="로고" width="420px"
				height="250px" style="margin-left: 20px;" /> <br> <br>

			<div class="find_btn_idPwd">
				<input type="button" value="아이디 찾기" onclick="location='<c:url value='/admin/findId'/>';" /> 
				<input type="button" value="비밀번호 찾기"   style="font-weight: bold;" onclick="location='<c:url value='/admin/findPw'/>';" />
			</div>

			<form action="<c:url value='/admin/findPw'/>" method="post">
				<div>
					<br> <label> <input type="radio" name="find_how"
						value="phone" id="more_phone" checked="checked"
						onclick="return setDisplayPhone();" style="margin-left: 20px;" />회원정보에
						등록한 전화번호로 인증
					</label>

					<div class="phone_identify" id="identify_board">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
							</div>
							<input type="text" class="form-control" aria-label="Default"
								aria-describedby="inputGroup-sizing-default" name="admin_name"
								size="20" id="admin_name1">
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
							</div>
							<input type="text" class="form-control" aria-label="Default"
								aria-describedby="inputGroup-sizing-default" name="admin_id"
								size="20" id="admin_id1">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">휴대폰
									번호</span>
							</div>
							<input type="text" class="form-control" aria-label="Default"
								aria-describedby="inputGroup-sizing-default" name="admin_phone"
								size="30" placeholder="하이픈(-)형식으로  11자리의 전화번호를 입력해주세요" id="admin_phone">
						</div>
					</div>

				</div>
				<br>
				<hr>
				<br>
				<div>
					<label> <input type="radio" name="find_how" value="email"
						id="more_email" onclick="return setDisplayEmail();" />회원정보에 등록한
						이메일로 인증
					</label>
					<div class="email_identify" style="display: none;"
						id="identify_board">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
							</div>
							<input type="text" class="form-control" aria-label="Default"
								aria-describedby="inputGroup-sizing-default" name="admin_name"
								size="20" id="admin_name2">
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
							</div>
							<input type="text" class="form-control" aria-label="Default"
								aria-describedby="inputGroup-sizing-default" name="user_id"
								size="20" id="admin_id2">
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
							</div>
							<input type="text" class="form-control" aria-label="Username"
								aria-describedby="basic-addon1" name="admin_mail_id" size="15" id="admin_mail_id">
							<div>
								<span class="input-group-text" id="basic-addon1">@</span>
							</div>
							<input type="text" class="form-control" placeholder="example.com"
								aria-label="Username" aria-describedby="basic-addon1"
								name="admin_mail_domain" size="15" >

						</div>
					</div>
				</div>

				<br>
				<br> <input type="submit" value="비밀번호 찾기" class="find_btn" />
			</form>
		</div>
	</div>
</body>
</html>