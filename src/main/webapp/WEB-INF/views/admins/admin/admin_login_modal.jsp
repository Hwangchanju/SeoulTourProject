<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<c:url value='/js/admin.js'/>"></script>

<body>

<div class="modal fade" id="admin_login_modal">
  <div class="modal-dialog">
    <div class="modal-content">
			<div id="modal">
				<div class="a_modal-window">
					<div class="title">
						<div class="close-area" data-bs-dismiss="modal">×</div>
						<br> <br>
						<div style="text-align: center;" id="login_title">
							<img src="<c:url value='/images/logoColor.png'/>" alt="로고" width="70%"
								height="200px" style="margin-left: 20px; margin-bottom: 20px;" />
							<h6 style="color:white;">관리자 로그인이 필요합니다.</h6>
						</div>
					</div>

					<div>

						<div class="content">
							<div>
								<ul style="padding-top:10px;">
									<li style="text-align: left; font-size:15px; font-family: 'Nanum Gothic', sans-serif;"><b>아이디 &nbsp;&nbsp; /
											&nbsp;</b> <input type="text" size="30" id="admin_login_ID" /></li>
									<hr />
									<br>
									<li style="text-align: left; font-size:15px; font-family: 'Nanum Gothic', sans-serif;"><b>비밀번호 &nbsp; / &nbsp;</b>
										<input type="password" size="30" id="admin_login_PW" /></li>
									<hr />
								</ul>
							</div>
						</div>
						<div class="modal_btn">
							<input type="button" id="admin_login_modal_btn" value="로그인" />
						</div>
						<div class="modal_btn">
							<a class="btn form-control tooltipstered" data-bs-toggle="modal"
								href="#admin_sign-up-modal" data-bs-dismiss="modal" > <b>회원가입</b></a>
						</div>
						<div id="id_find">
							<a href="<c:url value='/admin/findId'/>"
								style="color: white;">아이디/비밀번호 찾기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 회원가입 Modal -->
<div class="modal fade" id="admin_sign-up-modal" role="dialog"
	style="overflow-y: auto;">
	<div class="modal-dialog">
		<div class="modal-content" style="font-family: 'Nanum Gothic', sans-serif; font-size:13px;">
			<div id="modal">
				<div class="a_modal-window">
					<div class="title">
						<div class="close-area" data-bs-dismiss="modal">×</div>
						<br> <br>
						<div style="text-align: center;" id="login_title">
							<img src="<c:url value='/images/seoul1.png'/>" alt="로고" width="60%"
								height="150px" style="margin-left: 20px; margin-bottom: 20px;" /><br>
						</div>
					</div>
					<div>
							<div class="content" >
								<div>
									<ul style="padding-top:10px;">

										<li style="text-align: left;"><b>아이디 &nbsp;&nbsp; / &nbsp;</b>
										<br>	 <input type="text" size="45" name="admin_id" id="admin_id" />
											<input type="button" value="중복체크" id="admin_id_check" style="border: 1px solid red; border-radius: 5px; font-weight: bold; font-size: 15px; color: red;" /> <br></li>

										<hr>
										<br>
										<li style="text-align: left;"><b>비밀번호&nbsp; /&nbsp;</b><span id="pw_validate"></span> 
										<br><input type="password" size="40" name="admin_pwd" id="user_pw"/></li>
										<hr>
										<br>
										<li style="text-align: left;"><b>비번 재확인 /&nbsp;</b> <span id="pw_check_validate" ></span> 
										<br><input type="password" size="40" name="admin_pw_check" id="user_pw_check"/></li>
										<hr>
										<br>
										<li style="text-align: left;"><b>이름 &nbsp;&nbsp; / &nbsp;</b> <span id="name_validate"></span> 
										<br><input type="text" size="40" name="admin_name" id="user_name"/></li>
										<hr>
										<br>
										<li style="text-align: left;"><b>우편번호 &nbsp;&nbsp; / &nbsp;</b> <span id="zip_validate"></span> 
										<br><input type="text" size="42" name="admin_zip" id="user_zip" readonly="readonly"/>
										<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="border: 1px solid gray; border-radius: 5px; font-weight: bold;"><br>
										</li>
										<hr>
										<br>
										<li style="text-align: left;"><b>주소 &nbsp;&nbsp; / &nbsp;</b> <span id="addr_validate"></span> 
										<br><input type="text" size="40" name="admin_addr" id="user_addr" readonly="readonly"/></li>
										<hr>
										<br>
										<li style="text-align: left;"><b>상세주소 &nbsp;&nbsp; / &nbsp;</b> <span id="addr2_validate"></span> 
										<br><input type="text" size="40" name="admin_addr2" id="user_addr2"/></li>
										<hr>
										<br>
										<li style="text-align: left;"><b>이메일 &nbsp;&nbsp; /&nbsp;</b> <span id="email_validate"></span> 
										<br><input type="text" size="17" name="admin_mail_id" id="user_mail_id"/>@<input type="text" size="20" name="admin_mail_domain" id="user_mail_domain" class="input_box" readonly="readonly"/>
										<select name="mail_list" id="mail_list" >
											<option value="none">===선택=== </option>
											<option value="naver.com">naver.com</option>
                       						<option value="daum.net">daum.net</option>
                    						<option value="google.com">google.com</option>
                    						<option value="직접입력">직접입력</option>
              							</select></li>
										<hr>
										<br>
										<li style="text-align: left;"><b>핸드폰번호 &nbsp; /&nbsp;</b><span id="phone_validate"></span> 
										<br><input type="text" pattern="(010)-\d{3,4}-\d{4}" size="50" placeholder="하이픈(-)형식으로  11자리의 전화번호를 입력해주세요" name="admin_phone" id="user_phone" /></li>
										<hr>
									</ul>
								</div>
							</div>
							<div class="modal_btn">
								<input type="button" id="admin_join_modal_btn" value="회원가입" />
							</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

</script>

</body>
</html>