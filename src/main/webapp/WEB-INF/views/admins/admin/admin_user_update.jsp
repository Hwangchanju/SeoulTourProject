<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin.css'/>" />
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/join_update.js'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var domain = '${f.user_mail_domain}';

	$(document).ready(function() {
		$('#mail_list_update').val(domain).prop("selected", true);
	});
</script>
<script src="<c:url value='/js/join_update.js'/>"></script>
<body>
	
	<div class="join_update_wrap">
	

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
	
	


          </div>

          <hr class="my-4">
 	 <div class="col-16">
          <button class="btn btn-primary btn-lg update_btn" type="submit" id="join_update_btn" style="width:50%;">회원정보 수정하기</button>
           <button class="btn btn-primary btn-lg update_btn" type="reset" style="width:49%;">취소하기</button>
           </div>
        </form>
      </div>
    </div>



</body>
</html>