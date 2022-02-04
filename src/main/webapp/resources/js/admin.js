/**
 * admin.js
 */

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

				location.href = "/project/admin/mypage?keyword="
						+ keyword + "&condition=" + condition;
				console.log("검색조건 : " + keyword + "/" + condition);
			});
});

$(function() {
	$("#admin_login_PW").keydown(function(key) {
		if (key.keyCode == 13) { // 사용자가 누른 키가 13번이면 실행(엔티 : 13번 키)
			$("#admin_login_modal_btn").click();
		}
	});
});