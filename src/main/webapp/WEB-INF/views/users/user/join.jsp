<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울 구석구석</title>
</head>
	

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/modal_login_2.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>" />
<script>
$(function(){
	var kakaoInfoMsg = '${msg}';
	if(kakaoInfoMsg == "kakaoInfo_null"){
		alert('카카오 로그인을 하시려면 회원가입을 먼저 해주세요.');
	}
})
</script>
<body style="text-align:center;">
<!-- 회원가입 Modal -->
<a href="<c:url value='/main'/>"><img src="<c:url value='/images/logoColor.png'/>" alt="로고"
										width="390px" height="280px"
										style="margin: 100px auto 50px auto;" /></a>
										<hr style="width:800px;">
		<div id="sign-up-modal">
				<div class="join_content" >
					<div id="modal">
						<div class="join_window" style="background-color: none;">
							<div class="title" >

								<div id="login_title" >
					
									<p id="thematext1" style="font-size: 30px; margin-top:-10px; text-align:left; margin-left:50px;">회원가입</p>
								</div>
							</div>
							<div>
								<form action="#">
									<div class="content">
										<div>
											<ul>

												<li style="text-align: left;"><b>아이디 &nbsp;&nbsp; /
														&nbsp;</b> <br> <input type="text" size="50"
													name="user_id" id="user_id" /> <input type="button"
													value="중복체크" id="user_id_check"
													style="border: 1px solid red; border-radius: 5px; font-weight: bold; font-size: 15px; color: red;" />
													<br></li>

												<hr style="width:95%; margin-left:-5px;">
												<br>
												<li style="text-align: left;"><b>비밀번호&nbsp; /&nbsp;</b><span
													id="pw_validate"></span> <br>
												<input type="password" size="40" name="user_pwd"
													id="user_pw" /></li>
												<hr style="width:95%; margin-left:-5px;">
												<br>
												<li style="text-align: left;"><b>비번 재확인 /&nbsp;</b> <span
													id="pw_check_validate"></span> <br>
												<input type="password" size="40" name="user_pw_check"
													id="user_pw_check" /></li>
												<hr style="width:95%; margin-left:-5px;">
												<br>
												<li style="text-align: left;"><b>이름 &nbsp;&nbsp; /
														&nbsp;</b> <span id="name_validate"></span> <br>
												<input type="text" size="40" name="user_name" id="user_name" /></li>
												<hr style="width:95%; margin-left:-5px;">
												<br>
												<li style="text-align: left;"><b>우편번호 &nbsp;&nbsp;
														/ &nbsp;</b> <span id="zip_validate"></span> <br>
												<input type="text" size="46" name="user_zip" id="user_zip"
													readonly="readonly" /> <input type="button"
													onclick="execDaumPostcode()" value="우편번호 찾기"
													style="border: 1px solid gray; border-radius: 5px; font-weight: bold;"><br>
												</li>
												<hr style="width:95%; margin-left:-5px;">
												<br>
												<li style="text-align: left;"><b>주소 &nbsp;&nbsp; /
														&nbsp;</b> <span id="addr_validate"></span> <br>
												<input type="text" size="40" name="user_addr" id="user_addr"
													readonly="readonly" /></li>
												<hr style="width:95%; margin-left:-5px;">
												<br>
												<li style="text-align: left;"><b>상세주소 &nbsp;&nbsp;
														/ &nbsp;</b> <span id="addr2_validate"></span> <br>
												<input type="text" size="40" name="user_addr2"
													id="user_addr2" /></li>
											<hr style="width:95%; margin-left:-5px;">
												<br>
												<li style="text-align: left;"><b>이메일 &nbsp;&nbsp;
														/&nbsp;</b> <span id="email_validate"></span> <br>
												<input type="text" size="20" name="user_mail_id"
													id="user_mail_id" value="<c:if test="${kakao_info != null }">${kakao_info.user_mail_id }</c:if>"/>@<input type="text" size="18"
													name="user_mail_domain" id="user_mail_domain"
													class="input_box" readonly="readonly" value="<c:if test="${kakao_info != null }">${kakao_info.user_mail_domain }</c:if>"/> <select
													name="mail_list" id="mail_list" class="form-select"
													aria-label="Default select example">
														<option value="none">===선택===</option>
														<option value="naver.com">naver.com</option>
														<option value="daum.net">daum.net</option>
														<option value="google.com">google.com</option>
														<option value="직접입력">직접입력</option>
												</select></li>
												<hr style="width:95%; margin-left:-5px;">
												<br>
												<li style="text-align: left;"><b>핸드폰번호 &nbsp;
														/&nbsp;</b><span id="phone_validate"></span> <br>
												<input type="text" pattern="(010)-\d{3,4}-\d{4}" size="43"
													placeholder="하이픈(-)형식으로 전화번호를 입력해주세요" name="user_phone"
													id="user_phone" /></li>
												<hr style="width:95%; margin-left:-5px;">
											</ul>
										</div>
									</div>
									<div class="modal_btn">
										<input type="button" id="join_modal_btn" value="회원가입" />
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>