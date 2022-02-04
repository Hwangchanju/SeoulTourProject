<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script>
  //카카오로그인
  function kakaoLogin() {

    $.ajax({
        url: '/project/user/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    }); 
    
    $.ajax({
        url: '/project/user/login/getKakaoAuthUrl_email',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']);
      }
  });  


$(function() {
	$("#login_PW").keydown(function(key) {
		if (key.keyCode == 13) { // 사용자가 누른 키가 13번이면 실행(엔티 : 13번 키)
			$("#login_modal_btn").click();
		}
	});
})
</script>

<c:if test="${session_id ==null }">

	<div id="log-in-modal" class="modal-overlay" style="display: none;">
		<div class="modal_content" id="modal">
			<div class="modal-window">
				<div class="title">
					<button type="button" class="close-area" id="modal_close_btn">×</button>
					<br> <br>
					<div style="text-align: center;" id="login_title">
						<img src="<c:url value='/images/logoColor.png'/>" alt="로고"
							width="70%" height="170px"
							style="margin-left: 20px; margin-bottom: 10px;" />
						<h3 id="thematext1" style="font-size: 20px;">환영합니다!</h3>
					</div>
				</div>

				<div>

					<div class="content">
						<div>
							<ul>
								<li style="text-align: left;"><b  style="font-size: 13px;">아이디 &nbsp;&nbsp; /
										&nbsp;</b> <input type="text" size="20" id="login_ID" /></li>
								<hr style="width:280px; margin-left:-10px;"/>
								<br>
								<li style="text-align: left;"><b  style="font-size: 13px;">비밀번호 &nbsp; / &nbsp;</b> <input
									type="password" size="13" id="login_PW" /></li>
								<hr style="width:280px; margin-left:-10px;"/>
							</ul>
						</div>
					</div>
					<div class="modal_btn">
						<input type="button" id="login_modal_btn" value="로그인" />
					</div>
					<div class="modal_btn">
						<svg  style="margin-right:5px; vertical-align: bottom;"xmlns="http://www.w3.org/2000/svg" width="40" height="20"
							fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
  <path
								d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
</svg>
						<input style="width:auto; margin-right:45px;" type="button" id="login_kakao_btn" value="카카오톡으로 로그인" onclick="kakaoLogin();" />
					</div>
					<div id="id_find">
						<a href="<c:url value='/user/findId'/>" style="color: white; ">아이디/비밀번호
							찾기</a> &nbsp;&nbsp;<a  href="<c:url value='/user/joinForm'/>" style="color: white; "> 회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <div class="modal_layer"> </div> -->


</c:if>

