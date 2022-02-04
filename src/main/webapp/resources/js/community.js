/**
 * community js

 */



/*
 * function sendFile(file, el) { var form_data = new FormData(); //ajax로 폼 전송을
 * 가능하게 해주는 FormData 객체 -> 보통은 Ajax로 폼(form 태그) 전송을 할 일이 거의 없으나, 이미지를 ajax로 업로드할
 * 때 필요합니다.(이미지는 base64, buffer, 2진 data 형식으로 서버로 전송해도 됩니다.)
 * form_data.append('file', file); $.ajax({ data: form_data, type: "POST", url:
 * '/project/user/community/write_image', cache: false, contentType: false,
 * enctype: 'multipart/form-data', processData: false, success: function(url,
 * result) { if(result =='success'){ console.log('통신 성공!');
 * $(el).summernote('editor.insertImage', url); } else if(result == 'error'){
 * console.log('통신 실패!'); } else{ console.log('저장 실패!'); }
 *  } }); }
 * 
 */



$(document).ready(function() {
	$('#summernote').summernote({
		placeholder : '내용을 입력해주세요.',
		minHeight : 370,
		maxHeight : null,
		focus : true,
		lang : 'ko-KR'
	/*
	 * callbacks : { onImageUpload : function(files, editor, welEditable) { for
	 * (var i = files.length - 1; i >= 0; i--) { sendFile(files[i], this); } } }
	 */
	});
});


$(document).ready(function() {
	$('#edit').on('click', function() {
		$('#summernote').summernote({
			focus : true
		});
	});

	$('#save').on('click', function() {
		var markup = $('#summernote').summernote('code');
		console.log(markup);
		$('#summernote').summernote('destroy');
	});

});

$(function() {
	let checkTitle = false;
	let checkContent = false;

	$('#content_write_Btn')
			.click(
					function() {

						if ($('#content_title').val() === "") {
							$('#content_title').attr('placeholder',
									'제목은 필수값입니다.').css('color', 'blue');
							$('#content_title').focus();
							console.log('제목 없음');
							checkTitle = false;
						} else if ($('.note-editable').text() == "") {
							console.log('내용 없음');
							checkContent = false;
						} else {
							checkTitle = true;
							checkContent = true;
						}

						if (checkTitle && checkContent) {

							var data = new FormData(); // ajax로 폼 전송을 가능하게 해주는
														// FormData 객체 -> 보통은
														// Ajax로 폼(form 태그) 전송을
														// 할 일이 거의 없으나, 이미지를
														// ajax로 업로드할 때
														// 필요합니다.(이미지는 base64,
														// buffer, 2진 data 형식으로
														// 서버로 전송해도 됩니다.)

							const content_title = $('#content_title').val();
							const content_id = $('#content_id').val();
							const content_name = $('#content_name').val();
							var content_local = $(
									'#content_local option:selected').val();
							var markup = $('#summernote').summernote('code');
							const content_file = $('input[name=content_file]')[0].files[0];

							console.log("content : " + markup);

							data.append('content_title', content_title);
							data.append('content_id', content_id);
							data.append('content_name', content_name);
							data.append('content_local', content_local);
							data.append('content_cont', markup);
							data.append('content_file', content_file);

							$
									.ajax({
										url : "/project/user/community/write",
										type : "post",
										data : data,
										enctype : 'multipart/form-data',
										processData : false,
										contentType : false,
										cache : false,
										success : function(result) {
											console.log('통신 성공!');
											if (result == 1) {
												alert('게시물 업로드에 성공하셨습니다.');
												location.href = "/project/user/community/list?page=1";
											} else {
												alert('게시물 업로드에 실패했습니다. 다시 시도해 주세요.');
											}
										},
										error : function() {
											console.log('통신 실패!');

										}
									});
						} else {
							alert('필수값을 반드시 입력해주세요.');
						}

					});

});

$(function() {
	let checkContent = false;

	$('#content_edit_Btn')
			.click(
					function() {
						if ($('.note-editable').text() == "") {
							console.log('내용 없음');
							checkContent = false;
						} else {
							checkContent = true;
						}

						if (checkContent) {

							var data = new FormData(); // ajax로 폼 전송을 가능하게 해주는
														// FormData 객체 -> 보통은
														// Ajax로 폼(form 태그) 전송을
														// 할 일이 거의 없으나, 이미지를
														// ajax로 업로드할 때
														// 필요합니다.(이미지는 base64,
														// buffer, 2진 data 형식으로
														// 서버로 전송해도 됩니다.)

							const content_no = $('#content_no').val();
							const content_title = $('#content_title').val();
							const content_id = $('#content_id').val();
							const content_name = $('#content_name').val();
							var content_local = $(
									'#content_local option:selected').val();
							var markup = $('#summernote').summernote('code');
							const content_file = $('input[name=content_file]')[0].files[0];

							console.log("content : " + markup);

							data.append('content_no', content_no);
							data.append('content_title', content_title);
							data.append('content_id', content_id);
							data.append('content_name', content_name);
							data.append('content_local', content_local);
							data.append('content_cont', markup);
							data.append('content_file', content_file);

							$
									.ajax({
										url : "/project/user/community/edit",
										type : "post",
										data : data,
										enctype : 'multipart/form-data',
										processData : false,
										contentType : false,
										cache : false,
										success : function(result) {
											console.log('통신 성공!');
											if (result == 1) {
												alert('게시물 수정에 성공하셨습니다.');
												location.href = "/project/user/community/content/"
														+ content_no;
											} else {
												alert('게시물 수정에 실패했습니다. 다시 시도해 주세요.');
											}
										},
										error : function() {
											console.log('통신 실패!');

										}
									});

						} else {
							alert('내용을 반드시 입력해주세요.');
						}

					});

});

