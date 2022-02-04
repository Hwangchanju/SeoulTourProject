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
				document.getElementById("user_addr2").value = extraAddr;

			} else {
				document.getElementById("user_addr2").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('user_zip').value = data.zonecode;
			document.getElementById("user_addr").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("user_addr2").focus();
		}
	}).open();
}


//-------------------------------------------------------//


$(function() {
	$("#login_PW").keydown(function(key) {
		if (key.keyCode == 13) { // 사용자가 누른 키가 13번이면 실행(엔티 : 13번 키)
			$("#login_modal_btn").click();
		}
	});

	// 로그인 버튼 클릭 이벤트
	$('#login_modal_btn').click(function() {
		const id = $('#login_ID').val();
		const pw = $('#login_PW').val();
		const userLogin = {
			user_id : id,
			user_pwd : pw
		};
		// 비동기 통신 시작
		$.ajax({
			url : "/project/user/login",
			type : "POST",
			data : JSON.stringify(userLogin),
			dataType : "text",
			headers : { // 요청헤더 정보
				"Content-Type" : "application/json"
			},
			success : function(result) {
				console.log("통신 성공! : " + result);
				if (result == "Id_Fail") {
					alert('해당 아이디가 존재하지 않습니다.');
					$('#login_PW').val("");
					$('#login_ID').focus();
				} else if (result == "Pw_Fail") {
					alert('비밀번호를 다시 입력해주세요.');
					$('#login_PW').val("");
					$('#login_PW').focus();
				} else if (result == "Login_Success") {
					console.log('로그인 성공');
					location.href = "/project/main";
				}
			},
			error : function() {
				console.log("통신 실패");
			}
		}); // ajax 끝
	}); // 로그인 버튼 클릭 이벤트 끝
	
	

	// 관리자 로그인 버튼 클릭 이벤트
	$('#admin_login_modal_btn').click(function() {
		const id = 'admin_'+$('#admin_login_ID').val();
		const pw = $('#admin_login_PW').val();
		const adminLogin = {
			admin_id : id,
			admin_pwd : pw
		};
		// 비동기 통신 시작
		$.ajax({
			url : "/project/admin/login",
			type : "POST",
			data : JSON.stringify(adminLogin),
			dataType : "text",
			headers : { // 요청헤더 정보
				"Content-Type" : "application/json"
			},
			success : function(result) {
				console.log("통신 성공! : " + result);
				if (result == "Id_Fail") {
					alert('해당 아이디가 존재하지 않습니다.');
					$('#login_PW').val("");
					$('#login_ID').focus();
				} else if (result == "Pw_Fail") {
					alert('비밀번호를 다시 입력해주세요.');
					$('#login_PW').val("");
					$('#login_PW').focus();
				} else if (result == "Admin_Login_Success") {
					console.log('로그인 성공');
					location.href = "/project/admin/mypage";
				}
			},
			error : function() {
				console.log("통신 실패");
			}
		}); // ajax 끝
	}); // 로그인 버튼 클릭 이벤트 끝
	
	
	
	// ----------------회원가입 폼 jQuery----------------------//
	
	
	const getIdCheck = RegExp(/^[a-zA-Z0-9]{6,14}$/); // 정규표현식에 맞다면 true/ 아니라면// false
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
	$('#mail_list').change(function() {
		var num = $('#mail_list option:selected').val();// 선택한 목록 항목 번호
		if (num == "none") {// 목록이 선택되지 않았을때 실행
			return true;
		}
		if (num == "직접입력") {
			$('#user_mail_domain').val('');
			$('#user_mail_domain').attr('readonly', false);// 쓰기 가능
			$('#user_mail_domain').focus();// 입력박스로 포커스 이동
		} else {// 목록에서 멜주소를 선택한 경우
			$('#user_mail_domain').val($('#mail_list option:selected').val());
			// 목록 옵션 value값이 멜도메인 입력박스로 입력
			$('#user_mail_domain').attr('readonly', true);// 읽기만 가능
		}

	});

	// 아이디 입력값 유효성 
	$('#user_id').on('keyup', function(){
		if($('#user_id').val()===""){ // 작성 X
			$('#id_validate').text('아이디를 입력하세요.').css('color','red');
			$('#user_id').focus();
			console.log("아이디 값 없음");
			checkId = false;
		} else if(!getIdCheck.test($('#user_id').val())){
			$('#id_validate').text('영문자, 숫자를 조합해 6-14 사이로 입력하세요.').css('color', 'red');
			$('#user_id').focus();
			checkId = false;
			console.log("아이디 유효성 실패");
		} else{
			$('#id_validate').text("");
			console.log("아이디 입력 확인");
			checkId = true;
		}
	});
	
	// 아이디 중복 체크 유효성
	$('#user_id_check').click(function(){
		const id = $('#user_id').val();
		
		$.ajax({
			url : "/project/user/checkId",
			type : "POST",
			headers : {
				"Content-type" : "application/json"
			},
			data : id,
			dataType : "text",
			success : function(result) {
				console.log("통신 성공! :" + result);
				if(result == "Id_OK"){
					$('#user_id_check').val("확인성공").css({'color':'blue','border':'1px solid blue'});
					checkIdDu = true;
				}else{
					$('#user_id_check').val("중복").css('color','red');
					checkIdDu=false;
				}
			},
			error : function(){
				console.log("통신 실패!");
			}
		});
	});
	

	
	// 비번 입력값 유효성
	$('#user_pw').on('keyup',function(){
		if($('#user_pw').val()===""){
			$('#pw_validate').text('비밀번호를 입력하세요.').css('color','red');
			$('#user_pw').focus();
			console.log("비번 입력값 없음");
			checkPw = false;
		} else if(!getPwCheck.test($('#user_pw').val()) || $('#user_pw').val().length <8){
				// 정규 표현식에 안 맞거나, 길이가 8자리 이하인 경우
				$('#pw_validate').text('특수문자 포함 9자 이상 입력하세요.').css('color','red');
				$('#user_pw').focus();
				console.log("비번 입력 유효성 실패");
				checkPw = false;
		}else {
			$('#pw_validate').text("");
			console.log("비번 입력 확인");
			checkPw = true;
		}
	});
	
	// 비번 확인란 유효성
	$('#user_pw_check').on('keyup', function(){
		if($('#user_pw_check').val()===""){
			$('#pw_check_validate').text('비밀번호를 재확인해주세요.').css('color','red');
			console.log("비번 재확인 입력값 없음");
			checkPw2 = false;
		}else if($('#user_pw').val() != $('#user_pw_check').val()){
			$('#pw_check_validate').text('비밀번호가 다릅니다.').css('color','red');
			$('#user_pw_check').focus();
			console.log("비번 재확인 유효성 실패");
			checkPw2 = false;
		}else{
			$('#pw_check_validate').text("");
			console.log("비번 재확인 입력 확인");
			checkPw2 = true;
		}
	});
	
	// 이름 검증
	$('#user_name').on('keyup',function(){
		if($('#user_name').val()===""){
			$('#name_validate').text('이름을 입력하세요.').css('color','red');
			console.log("이름 입력값 없음");
			$('#user_name').focus();
			checkName = false;	
		}else if(!getName.test($('#user_name').val())){
			$('#name_validate').text('이름은 한글로 입력하세요.').css('color','red');
			console.log("이름 입력 유효성 실패");
			checkName = false;
		}else{
			$('#name_validate').text("");
			console.log("이름 입력 확인");
			checkName = true;
		}
	});
	
	
	// 이메일 검증
	$('#user_mail_id').on('keyup', function(){
		if($('#user_mail_id').val()===""){
			$('#email_validate').text('이메일을 입력하세요.').css('color','red');
			$('#user_mail_id').focus();
			console.log("이메일 입력값 없음");
			checkmailId = false;
		}else{
			$('#email_validate').text("");
			console.log("이메일 입력 확인");
			checkmailId= true;
		}
	});
	
	
	$('#join_modal_btn').on('click',function(){
		if($('#user_mail_domain').val()===""){
				$('#email_validate').text('이메일 도메인을 선택하세요.').css('color','red');
				console.log("아이디 도메인 입력값 없음");
				checkmailDomain = false;
		}else{
			$('#email_validate').text("");
			console.log("이메일도메인 입력 확인");
			checkmailDomain = true;
		}
	});
	
	
	// 휴대폰 검증
	$('#user_phone').on('keyup',function(){
		if($('#user_phone').val()===""){
			$('#user_phone').focus();
			console.log("휴대폰 입력값 없음");
			checkPhone = false;
		}else if(!getPhone.test($('#user_phone').val())){
			$('#phone_validate').text('휴대폰 형식을 맞춰 적어주세요.').css('color','red');
			$('#user_phone').focus();
			console.log("휴대폰 입력 유효성 실패");
			checkPhone = false;
		}else{
			$('#phone_validate').text('');
			console.log("휴대폰 입력 확인");
			checkPhone = true;
		}
	});
	
	

	
	// 관리자 아이디 중복 체크 유효성
	$('#admin_id_check').click(function(){
		const id = $('#admin_id').val();
		
		$.ajax({
			url : "/project/admin/checkId",
			type : "POST",
			headers : {
				"Content-type" : "application/json"
			},
			data : id,
			dataType : "text",
			success : function(result) {
				console.log("통신 성공! :" + result);
				if(result == "Id_OK"){
					$('#admin_id_check').val("확인성공").css('color','blue');
					checkIdDu = true;
				}else{
					$('#admin_id_check').val("중복").css('color','red');
					checkIdDu=false;
				}
			},
			error : function(){
				console.log("통신 실패!");
			}
		});
	});
	
	
	// 회원가입 버튼 이벤트 처리
	$('#join_modal_btn').click(
			function() {
				
				
				// 아이디 입력 유효성 검증
				if ($('#user_id').val() === "") { // 작성 X
					$('#id_validate').text('아이디를 입력하세요.').css('color', 'red');
					$('#user_id').focus();
					console.log("아이디 값 없음");
					checkId = false;
				} else if (!getIdCheck.test($('#user_id').val())) {
					$('#id_validate').text('영문자, 숫자를 조합해 6-14 사이로 입력하세요.').css(
							'color', 'red');
					$('#user_id').focus();
					checkId = false;
					console.log("아이디 유효성 실패");
				} else {
					$('#id_validate').text("");
					console.log("아이디 입력 확인");
					checkId = true;
				}

				
				// 비번 입력 유효성 검증
				if ($('#user_pw').val() === "") {
					$('#pw_validate').text('비밀번호를 입력하세요.').css('color', 'red');
					$('#user_pw').focus();
					console.log("비번 입력값 없음");
					checkPw = false;
				} else if (!getPwCheck.test($('#user_pw').val())
						|| $('#user_pw').val().length < 8) {
					// 정규 표현식에 안 맞거나, 길이가 8자리 이하인 경우
					$('#pw_validate').text('특수문자 포함 9자 이상 입력하세요.').css('color',
							'red');
					$('#user_pw').focus();
					console.log("비번 입력 유효성 실패");
					checkPw = false;
				} else {
					$('#pw_validate').text("");
					console.log("비번 입력 확인");
					checkPw = true;
				}

				
				// 이름 입력 유효성 검증
				if ($('#user_name').val() === "") {
					$('#name_validate').text('이름을 입력하세요.').css('color', 'red');
					console.log("이름 입력값 없음");
					$('#user_name').focus();
					checkName = false;
				} else if (!getName.test($('#user_name').val())) {
					$('#name_validate').text('이름은 한글로 입력하세요.').css('color',
							'red');
					console.log("이름 입력 유효성 실패");
					checkName = false;
				} else {
					$('#name_validate').text("");
					console.log("이름 입력 확인");
					checkName = true;
				}

				
				// 이메일 입력 유효성 검증
				if ($('#user_mail_id').val() === "") {
					$('#email_validate').text('이메일을 입력하세요.')
							.css('color', 'red');
					$('#user_mail_id').focus();
					console.log("이메일 입력값 없음");
					checkmailId = false;
				} else {
					$('#email_validate').text("");
					console.log("이메일 입력 확인");
					checkmailId = true;
				}

				
				// 이메일 도메인 유효성 검증
				if ($('#user_mail_domain').val() === "") {
					$('#email_validate').text('이메일 도메인을 선택하세요.').css('color',
							'red');
					console.log("아이디 도메인 입력값 없음");
					checkmailDomain = false;
				} else {
					$('#email_validate').text("");
					console.log("이메일도메인 입력 확인");
					checkmailDomain = true;
				}

				
				// 휴대폰 유효성 검증
				if ($('#user_phone').val() === "") {
					$('#user_phone').focus();
					console.log("휴대폰 입력값 없음");
					checkPhone = false;
				} else if (!getPhone.test($('#user_phone').val())) {
					$('#phone_validate').text('휴대폰 형식을 맞춰 적어주세요.').css('color',
							'red');
					$('#user_phone').focus();
					console.log("휴대폰 입력 유효성 실패");
					checkPhone = false;
				} else {
					$('#phone_validate').text('');
					console.log("휴대폰 입력 확인");
					checkPhone = true;
				}

				
				// 우편번호
				if ($('#user_zip').val() === "") {
					$('#zip_validate').text('우편번호를 검색해주세요.')
							.css('color', 'red');
					console.log("우편번호 입력값 없음");
					checkZip = false;
				} else {
					$('#zip_validate').text("");
					console.log("우편번호 입력 확인");
					checkZip = true;
				}

				
				// 상세주소
				if ($('#user_addr2').val() === "") {
					$('#addr2_validate').text('나머지 주소를 입력해주세요.').css('color',
							'red');
					$('#user_addr2').focus();
					console.log("상세주소 입력값 없음");
					checkAddr2 = false;
				} else {
					$('#addr2_validate').text("");
					console.log("상세주소 입력 확인");
					checkAddr2 = true;
				}

				
				
				
				if (checkId && checkIdDu && checkPw && checkPw2 && checkName
						&& checkmailId && checkmailDomain && checkPhone && checkZip && checkAddr2) {
					const id = $('#user_id').val();
					const pw = $('#user_pw').val();
					const name = $('#user_name').val();
					const zip = $('#user_zip').val();
					const addr = $('#user_addr').val();
					const addr2 = $('#user_addr2').val();
					const email_id = $('#user_mail_id').val();
					const email_domain = $('#user_mail_domain').val();
					const phone = $('#user_phone').val() != "" ? $(
							'#user_phone').val() : null;
					const user = {
						user_id : id,
						user_pwd : pw,
						user_name : name,
						user_zip : zip,
						user_addr : addr,
						user_addr2 : addr2,
						user_phone : phone,
						user_mail_id : email_id,
						user_mail_domain : email_domain
					};

					// ajax
					$.ajax({
						url : "/project/user/join",
						type : "POST",
						data : JSON.stringify(user),
						dataType : "text",
						headers : {
							"Content-Type" : "application/json"
						},
						success : function(result) {
							console.log('통신 성공! ' + result);
							if (result == "Join_Success") {
								alert('회원가입에 성공하였습니다.');
								location.href = "/project/main";
							} else {
								alert('회원가입에 실패하였습니다. 기존 회원인지 확인해주세요!');
								history.go(-1);
							}
						},
						error : function() {
							console.log('통신 실패!');
						}
					});

				} else {
					alert('입력 정보를 다시 확인하세요.');
				}
			});
	
		// 관리자 회원가입 버튼 이벤트 처리
	$('#admin_join_modal_btn').click(
			function() {

				// 아이디 입력 유효성 검증
				if ($('#user_id').val() === "") { // 작성 X
					$('#id_validate').text('아이디를 입력하세요.').css('color', 'red');
					$('#user_id').focus();
					console.log("아이디 값 없음");
					checkId = false;
				} else if (!getIdCheck.test($('#user_id').val())) {
					$('#id_validate').text('영문자, 숫자를 조합해 6-14 사이로 입력하세요.').css(
							'color', 'red');
					$('#user_id').focus();
					checkId = false;
					console.log("아이디 유효성 실패");
				} else {
					$('#id_validate').text("");
					console.log("아이디 입력 확인");
					checkId = true;
				}

				
				// 비번 입력 유효성 검증
				if ($('#user_pw').val() === "") {
					$('#pw_validate').text('비밀번호를 입력하세요.').css('color', 'red');
					$('#user_pw').focus();
					console.log("비번 입력값 없음");
					checkPw = false;
				} else if (!getPwCheck.test($('#user_pw').val())
						|| $('#user_pw').val().length < 8) {
					// 정규 표현식에 안 맞거나, 길이가 8자리 이하인 경우
					$('#pw_validate').text('특수문자 포함 9자 이상 입력하세요.').css('color',
							'red');
					$('#user_pw').focus();
					console.log("비번 입력 유효성 실패");
					checkPw = false;
				} else {
					$('#pw_validate').text("");
					console.log("비번 입력 확인");
					checkPw = true;
				}

				
				// 이름 입력 유효성 검증
				if ($('#user_name').val() === "") {
					$('#name_validate').text('이름을 입력하세요.').css('color', 'red');
					console.log("이름 입력값 없음");
					$('#user_name').focus();
					checkName = false;
				} else if (!getName.test($('#user_name').val())) {
					$('#name_validate').text('이름은 한글로 입력하세요.').css('color',
							'red');
					console.log("이름 입력 유효성 실패");
					checkName = false;
				} else {
					$('#name_validate').text("");
					console.log("이름 입력 확인");
					checkName = true;
				}

				// 우편번호 검증
					if($('#user_zip').val()===""){
						$('#zip_validate').text('우편번호를 검색해주세요.').css('color','red');
						console.log("우편번호 입력값 없음");
						checkZip = false;
					} else{
						$('#zip_validate').text("");
						console.log("우편번호 입력 확인");
						checkZip = true;
					}
				
				
				// 나머지 주소 검증
					if($('#user_addr2').val()===""){
						$('#addr2_validate').text('나머지 주소를 입력해주세요.').css('color','red');
						$('#user_addr2').focus();
						console.log("상세주소 입력값 없음");
						checkAddr2 = false;
					}else{
						$('#addr2_validate').text("");
						console.log("상세주소 입력 확인");
						checkAddr2 = true;
					}
					
					
					// 이메일 입력 유효성 검증
					if ($('#user_mail_id').val() === "") {
						$('#email_validate').text('이메일을 입력하세요.')
								.css('color', 'red');
						$('#user_mail_id').focus();
						console.log("이메일 입력값 없음");
						checkmailId = false;
					} else {
						$('#email_validate').text("");
						console.log("이메일 입력 확인");
						checkmailId = true;
					}

					
					// 이메일 도메인 유효성 검증
					if ($('#user_mail_domain').val() === "") {
						$('#email_validate').text('이메일 도메인을 선택하세요.').css('color',
								'red');
						console.log("아이디 도메인 입력값 없음");
						checkmailDomain = false;
					} else {
						$('#email_validate').text("");
						console.log("이메일도메인 입력 확인");
						checkmailDomain = true;
					}
				
				if (checkId && checkIdDu && checkPw && checkPw2 && checkName
						&& checkmailId && checkmailDomain && checkPhone && checkZip && checkAddr2) {
					const id = 'admin_'+$('#admin_id').val();
					const pw = $('#user_pw').val();
					const name = $('#user_name').val();
					const zip = $('#user_zip').val();
					const addr = $('#user_addr').val();
					const addr2 = $('#user_addr2').val();
					const email_id = $('#user_mail_id').val();
					const email_domain = $('#user_mail_domain').val();
					const phone = $('#user_phone').val() != "" ? $(
							'#user_phone').val() : null;
					const admin = {
						admin_id : id,
						admin_pwd : pw,
						admin_name : name,
						admin_zip : zip,
						admin_addr : addr,
						admin_addr2 : addr2,
						admin_phone : phone,
						admin_mail_id : email_id,
						admin_mail_domain : email_domain
					};

					// ajax
					$.ajax({
						url : "/project/admin/join",
						type : "POST",
						data : JSON.stringify(admin),
						dataType : "text",
						headers : {
							"Content-Type" : "application/json"
						},
						success : function(result) {
							console.log('통신 성공! ' + result);
							if (result == "Join_Success") {
								alert('관리자 가입에 성공하였습니다.');
								location.href = "/project/admin/admin_login_form";
							} else {
								alert('관리자 가입에 실패하였습니다.');
							}
						},
						error : function() {
							console.log('통신 실패!');
						}
					});

				} else {
					alert('입력 정보를 다시 확인하세요.');
				}
			});


});





// jQuery 끝
