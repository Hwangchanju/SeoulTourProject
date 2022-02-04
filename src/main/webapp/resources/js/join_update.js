/**
 * 
 */

// 우편검색 창(카카오 API)
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("user_addr2_update").value = extraAddr;

			} else {
				document.getElementById("user_addr2_update").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('user_zip_update').value = data.zonecode;
			document.getElementById("user_addr_update").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("user_addr2_update").focus();
		}
	}).open();
}

// -------------------------------------------------------//

$(function() {

	// ----------------회원가입 수정 폼 jQuery----------------------//

	const getIdCheck = RegExp(/^[a-zA-Z0-9]{6,14}$/); // 정규표현식에 맞다면 true/
														// 아니라면// false
	const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/); // 패스워드
	const getName = RegExp(/^[가-힣]+$/); // 이름 정규표현식
	const getEmail = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/); // 이메일
	const getPhone = RegExp(/^\d{3}-\d{3,4}-\d{4}$/);

	/* 회원가입 유효성 검증 */
	let checkId = false;
	let checkIdDu = false;
	let checkPw = false;
	let checkPw2 = false;
	let checkName = false;
	let checkmailId = false;
	let checkmailDomain = false;
	let checkPhone = false;
	let checkZip = false;
	let checkAddr2 = false;

	// 이메일 도메인 목록 제이쿼리
	$('#mail_list_update').change(
			function() {
				var num = $('#mail_list_update option:selected').val();// 선택한
																		// 목록 항목
																		// 번호
				if (num == "none") {// 목록이 선택되지 않았을때 실행
					return true;
				}
				if (num == "직접입력") {
					$('#user_mail_domain_update').val('');
					$('#user_mail_domain_update').attr('readonly', false);// 쓰기
																			// 가능
					$('#user_mail_domain_update').focus();// 입력박스로 포커스 이동
				} else {// 목록에서 멜주소를 선택한 경우
					$('#user_mail_domain_update').val(
							$('#mail_list_update option:selected').val());
					// 목록 옵션 value값이 멜도메인 입력박스로 입력
					$('#user_mail_domain_update').attr('readonly', true);// 읽기만
																			// 가능
				}

			});

	// 비번 입력값 유효성
	$('#user_pw_update').on(
			'keyup',
			function() {
				if ($('#user_pw_update').val() === "") {
					$('#pw_validate_update').text('비밀번호를 입력하세요.').css('color',
							'red');
					$('#user_pw_update').focus();
					console.log("비번 입력값 없음");
					checkPw = false;
				} else if (!getPwCheck.test($('#user_pw_update').val())
						|| $('#user_pw_update').val().length < 8) {
					// 정규 표현식에 안 맞거나, 길이가 8자리 이하인 경우
					$('#pw_validate_update').text('특수문자 포함 9자 이상 입력하세요.').css(
							'color', 'red');
					$('#user_pw_update').focus();
					console.log("비번 입력 유효성 실패");
					checkPw = false;
				} else {
					$('#pw_validate_update').text("");
					console.log("비번 입력 확인");
					checkPw = true;
				}
			});

	// 비번 확인란 유효성
	$('#user_pw_check_update').on(
			'keyup',
			function() {
				if ($('#user_pw_check_update').val() === "") {
					$('#pw_check_validate_update').text('비밀번호를 재확인해주세요.').css(
							'color', 'red');
					console.log("비번 재확인 입력값 없음");
					checkPw2 = false;
				} else if ($('#user_pw_update').val() != $(
						'#user_pw_check_update').val()) {
					$('#pw_check_validate_update').text('비밀번호가 다릅니다.').css(
							'color', 'red');
					$('#user_pw_check_update').focus();
					console.log("비번 재확인 유효성 실패");
					checkPw2 = false;
				} else {
					$('#pw_check_validate_update').text("");
					console.log("비번 재확인 입력 확인");
					checkPw2 = true;
				}
			});

	// 이름 검증
	$('#user_name_update').on(
			'keyup',
			function() {
				if ($('#user_name_update').val() === "") {
					$('#name_validate_update').text('이름을 입력하세요.').css('color',
							'red');
					console.log("이름 입력값 없음");
					$('#user_name_update').focus();
					checkName = false;
				} else if (!getName.test($('#user_name_update').val())) {
					$('#name_validate_update').text('이름은 한글로 입력하세요.').css(
							'color', 'red');
					console.log("이름 입력 유효성 실패");
					checkName = false;
				} else {
					$('#name_validate_update').text("");
					console.log("이름 입력 확인");
					checkName = true;
				}
			});

	// 이메일 검증
	$('#user_mail_id_update').on(
			'keyup',
			function() {
				if ($('#user_mail_id_update').val() === "") {
					$('#email_validate_update').text('이메일을 입력하세요.').css(
							'color', 'red');
					$('#user_mail_id_update').focus();
					console.log("이메일 입력값 없음");
					checkmailId = false;
				} else {
					$('#email_validate_update').text("");
					console.log("이메일 입력 확인");
					checkmailId = true;
				}
			});

	$('#join_modal_btn_update').on(
			'click',
			function() {
				if ($('#user_mail_domain_update').val() === "") {
					$('#email_validate_update').text('이메일 도메인을 선택하세요.').css(
							'color', 'red');
					console.log("아이디 도메인 입력값 없음");
					checkmailDomain = false;
				} else {
					$('#email_validate_update').text("");
					console.log("이메일도메인 입력 확인");
					checkmailDomain = true;
				}
			});

	// 휴대폰 검증
	$('#user_phone_update').on(
			'keyup',
			function() {
				if ($('#user_phone_update').val() === "") {
					$('#user_phone_update').focus();
					console.log("휴대폰 입력값 없음");
					checkPhone = false;
				} else if (!getPhone.test($('#user_phone_update').val())) {
					$('#phone_validate_update').text('휴대폰 형식을 맞춰 적어주세요.').css(
							'color', 'red');
					$('#user_phone_update').focus();
					console.log("휴대폰 입력 유효성 실패");
					checkPhone = false;
				} else {
					$('#phone_validate_update').text('');
					console.log("휴대폰 입력 확인");
					checkPhone = true;
				}
			});

	// 우편번호 검증
	$('#user_zip_update').on(
			'keyup',
			function() {
				if ($('#user_zip_update').val() === "") {
					$('#zip_validate_update').text('우편번호를 검색해주세요.').css(
							'color', 'red');
					console.log("우편번호 입력값 없음");
					checkZip = false;
				} else {
					$('#zip_validate_update').text("");
					console.log("우편번호 입력 확인");
					checkZip = true;
				}
			});

	// 나머지 주소 검증
	$('#user_addr2_update').on(
			'keyup',
			function() {
				if ($('#user_addr2_update').val() === "") {
					$('#addr2_validate_update').text('나머지 주소를 입력해주세요.').css(
							'color', 'red');
					$('#user_addr2_update').focus();
					console.log("상세주소 입력값 없음");
					checkAddr2 = false;
				} else {
					$('#addr2_validate_update').text("");
					console.log("상세주소 입력 확인");
					checkAddr2 = true;
				}
			});

	// 회원가입 버튼 이벤트 처리
	$('#join_update_btn').click(
			function() {

				// 이름 입력 유효성 검증
				if ($('#user_name_update').val() === "") {
					$('#name_validate_update').text('이름을 입력하세요.').css('color',
							'red');
					console.log("이름 입력값 없음");
					$('#user_name_update').focus();
					checkName = false;
				} else if (!getName.test($('#user_name_update').val())) {
					$('#name_validate_update').text('이름은 한글로 입력하세요.').css(
							'color', 'red');
					console.log("이름 입력 유효성 실패");
					checkName = false;
				} else {
					$('#name_validate_update').text("");
					console.log("이름 입력 확인");
					checkName = true;
				}

				// 이메일 입력 유효성 검증
				if ($('#user_mail_id_update').val() === "") {
					$('#email_validate_update').text('이메일을 입력하세요.').css(
							'color', 'red');
					$('#user_mail_id_update').focus();
					console.log("이메일 입력값 없음");
					checkmailId = false;
				} else {
					$('#email_validate_update').text("");
					console.log("이메일 입력 확인");
					checkmailId = true;
				}

				// 이메일 도메인 유효성 검증
				if ($('#user_mail_domain_update').val() === "") {
					$('#email_validate_update').text('이메일 도메인을 선택하세요.').css(
							'color', 'red');
					console.log("아이디 도메인 입력값 없음");
					checkmailDomain = false;
				} else {
					$('#email_validate_update').text("");
					console.log("이메일도메인 입력 확인");
					checkmailDomain = true;
				}

				// 휴대폰 유효성 검증
				if ($('#user_phone_update').val() === "") {
					$('#user_phone_update').focus();
					console.log("휴대폰 입력값 없음");
					checkPhone = false;
				} else if (!getPhone.test($('#user_phone_update').val())) {
					$('#phone_validate_update').text('휴대폰 형식을 맞춰 적어주세요.').css(
							'color', 'red');
					$('#user_phone_update').focus();
					console.log("휴대폰 입력 유효성 실패");
					checkPhone = false;
				} else {
					$('#phone_validate_update').text('');
					console.log("휴대폰 입력 확인");
					checkPhone = true;
				}

				// 우편번호
				if ($('#user_zip_update').val() === "") {
					$('#zip_validate_update').text('우편번호를 검색해주세요.').css(
							'color', 'red');
					console.log("우편번호 입력값 없음");
					checkZip = false;
				} else {
					$('#zip_validate_update').text("");
					console.log("우편번호 입력 확인");
					checkZip = true;
				}

				// 상세주소
				if ($('#user_addr2_update').val() === "") {
					$('#addr2_validate_update').text('나머지 주소를 입력해주세요.').css(
							'color', 'red');
					$('#user_addr2_update').focus();
					console.log("상세주소 입력값 없음");
					checkAddr2 = false;
				} else {
					$('#addr2_validate_update').text("");
				}

			});
	
	
	// 탈퇴 사유 셀렉트 박스
	// 이메일 도메인 목록 제이쿼리
	$('#login_delcont_list').change(function() {
		var num = $('#login_delcont_list option:selected').val();// 선택한 목록 항목 번호
		if (num == "none") {// 목록이 선택되지 않았을때 실행
			return true;
		}
		if (num == "직접입력") {
			$('#user_delcont').val('');
			$('#user_delcont').attr('readonly', false);// 쓰기 가능
			$('#user_delcont').focus();// 입력박스로 포커스 이동
		} else {// 목록에서 멜주소를 선택한 경우
			$('#user_delcont').val($('#login_delcont_list option:selected').val());
			// 목록 옵션 value값이 멜도메인 입력박스로 입력
			$('#user_delcont').attr('readonly', true);// 읽기만 가능
		}

	});

});
