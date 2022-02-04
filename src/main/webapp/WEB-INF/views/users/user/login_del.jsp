<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="<c:url value='/js/join_update.js'/>"></script>
<div class="modal fade" id="login_del" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="modal">
				<div class="modal-window">
					<div class="title">
						<div class="close-area" data-bs-dismiss="modal">×</div>
						<br> <br>
						<div style="text-align: center;" id="login_title">
							<img src="<c:url value='/images/logoColor.png'/>" alt="로고" width="70%"
								height="200px" style="margin-left: 20px; margin-bottom: 20px;" />
							<h5>탈퇴를 원하시면 아래 폼을 완성해주세요.</h5>
						</div>
					</div>

					<div>
					<form action="<c:url value='/user/user_del'/>" method="post">
						<div class="content">
							<div>
								<ul>
									<li style="text-align: left;"><b>아이디 &nbsp;&nbsp; /
											&nbsp;</b> <input type="text" size="30" id="user_id" name="user_id"/></li>
									<hr />
									<li style="text-align: left;"><b>회원이름 &nbsp;&nbsp; /
											&nbsp;</b> <input type="text" size="30" id="user_name" name="user_name"/></li>
									<hr />
									<li style="text-align: left;"><b>비밀번호 &nbsp; / &nbsp;</b>
										<input type="password" size="30" id="user_pwd" name="user_pwd"  /></li>
									<hr />
									
									<li style="text-align: left;"><b>탈퇴사유 &nbsp;&nbsp; /
											&nbsp;</b>
											<select id="login_delcont_list">
 												 <option value="none">== 탈퇴사유 선택 ==</option>
 												 <option value="원하는 정보의 부재">원하는 정보의 부재</option>
												 <option value="이용 빈도수가 적음">이용 빈도수가 적음</option>
												 <option value="직접입력">직접입력 </option>
											</select>
											<input type="text" size="30" id="user_delcont" name="user_delcont" readonly="readonly"/></li>
									<hr />
								</ul>
							</div>
						</div>
						<div class="modal_btn">
							<input type="submit" id="login_del_btn" value="탈퇴하기" onclick="confirm('정말 탈퇴하시겠습니까?');"/>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
