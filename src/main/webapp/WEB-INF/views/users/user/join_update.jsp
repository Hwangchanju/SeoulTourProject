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
		style="font-family: 'Y_Spotlight'; font-size:18px; margin-top: -30px; height:880px;">
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
			
				<li class="nav-item"><a href="<c:url value='/user/mypage/list?page=1&counterPerPage=9'/>" class="nav-link link-dark""
					aria-current="page"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-fill" viewBox="0 0 16 16">
  <path d="M9.828 3h3.982a2 2 0 0 1 1.992 2.181l-.637 7A2 2 0 0 1 13.174 14H2.825a2 2 0 0 1-1.991-1.819l-.637-7a1.99 1.99 0 0 1 .342-1.31L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3zm-8.322.12C1.72 3.042 1.95 3 2.19 3h5.396l-.707-.707A1 1 0 0 0 6.172 2H2.5a1 1 0 0 0-1 .981l.006.139z"/>
</svg>
						<use xlink:href="#home"></use>
						</svg>  내가 쓴 후기
				</a></li>
				<li><a href="<c:url value='/user/mypage/join_update'/>" class="nav-link active" > <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-unlock-fill" viewBox="0 0 16 16">
  <path d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2z"/>
</svg>
						<use xlink:href="#speedometer2"></use>
						</svg>  회원정보 수정
				</a></li>
			</ul>
			<hr>

		</div>
	</div>

	
	<br><br>
	
	<div class="join_update_wrap" style="width:60%; line-height:15px;">
	

      <div class="col-12">
        <h3 class="mb-3" style="text-align:center; 	border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: #999; line-height: 30px; padding:12px;"><b>회원정보 수정 페이지</b></h3>
        <form class="needs-validation" action="<c:url value='/user/mypage/join_update'/>" method="post">
          <div class="row g-3">
            <div class="col-12">
              <label for="user_id" class="form-label">아이디</label>
              <input type="text" size="25"name="user_id" id="user_id" readonly="readonly" value="${f.user_id }" class="form-control" />
        
            </div>
	<br>
            <div class="col-12">
              <label for="lastName" class="form-label">비밀번호</label> &nbsp;&nbsp;<span id="pw_validate_update"></span>
              <input type="password" size="25" name="user_pwd" id="user_pw_update" class="form-control"/>

            </div>
	<br>
	   <div class="col-12">
              <label for="lastName" class="form-label">비밀번호 재확인</label>&nbsp;&nbsp;<span id="pw_check_validate_update"></span>
             <input type="password" size="25" name="user_pw_check" id="user_pw_check_update" class="form-control" />

            </div>
	<br>
	
	   <div class="col-12">
              <label for="lastName" class="form-label">이름</label> &nbsp;&nbsp;<span id="name_validate_update"></span>
              <input type="text" size="25" name="user_name" id="user_name_update" value="${f.user_name }" class="form-control"/>

            </div>
	<br>
	   <div class="col-12">
              <label for="lastName" class="form-label">우편번호</label> &nbsp;&nbsp;<span id="zip_validate_update"></span>
              <div class="input-group">
             <input type="text" size="25" name="user_zip" id="user_zip_update" readonly="readonly" value="${f.user_zip}" class="form-control"/>
             <input type="button" class="btn btn-secondary" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control">
            </div></div>
            
            	<br>

            <div class="col-md-6">
              <label for="address" class="form-label">주소</label> &nbsp;&nbsp;<span id="addr_validate_update"></span>
             <input type="text" size="25" name="user_addr" id="user_addr_update" readonly="readonly" value="${f.user_addr }" class="form-control" /> 
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>
         

            <div class="col-md-6">
              <label for="address2" class="form-label">상세주소</label> &nbsp;&nbsp;<span id="addr2_validate_update"></span>
              <input type="text" size="25" name="user_addr2" id="user_addr2_update" value="${f.user_addr2 }"  class="form-control" />
            </div>


		<div class="col-12">
              <label for="username" class="form-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이메일</font></font></label>&nbsp;&nbsp;<span id="email_validate_update"></span>
              <div class="input-group has-validation">
              <input class="form-control" type="text" size="15"
								name="user_mail_id" id="user_mail_id_update" style="width: 38%;"
								value="${f.user_mail_id }" />
                <span class="input-group-text"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">@</font></font></span>
                <input class="form-control" type="text" size="12"
								name="user_mail_domain" id="user_mail_domain_update"
								style="width: 30%;" class="input_box" readonly="readonly"
								value="${f.user_mail_domain }" />
								<select class="form-select" name="mail_list"
								id="mail_list_update" class="form-select"
								aria-label="Default select example">
									<option value="none">=== 선택 ===</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="google.com">google.com</option>
									<option value="직접입력">직접입력</option>
							</select><br>
              </div>
            </div>
            
            
            
           <div class="col-12">
              <label for="lastName" class="form-label">핸드폰 번호</label> &nbsp;&nbsp;<span id="phone_validate_update"></span>
              <input class="form-control" type="text" pattern="(010)-\d{3,4}-\d{4}" size="25" name="user_phone" id="user_phone_update" value="${f.user_phone }" class="form-control" />

            </div>
	<br>
	
	 
            <div class="col-md-3">
              <label for="lastName" class="form-label">회원 탈퇴</label><span id="phone_validate_update"></span>
              <input class="form-control" type="button" class="btn btn-secondary"
								data-bs-toggle="modal" data-bs-target="#login_del" value="회원탈퇴" />

            </div>
	<br>
	


          </div>

          <hr class="my-4">
 	 <div class="col-16">
          <button class="btn btn-primary btn-lg update_btn" type="submit" id="join_update_btn" style="width:50%;">회원정보 수정하기</button>
           <button class="btn btn-primary btn-lg update_btn" type="reset" style="width:49%;">취소하기</button>
           </div>
        </form>
      </div>
    </div>
    	<%@ include file="./login_del.jsp"%>
    	
</body>
</html>