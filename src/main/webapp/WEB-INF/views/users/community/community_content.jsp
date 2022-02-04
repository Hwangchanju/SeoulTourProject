<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<jsp:include page="../../include/header.jsp" />

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="<c:url value='/resources/js/community.js'/>"></script>

<script>

$(document).ready(function(){
   //var markup = '${c.content_cont}';
   //$('#summernote').summernote('code', markup);
   //$('#summernote').summernote('destroy');

});


function editFunc(no) {

   var replyId = "reply_id" + no;
   var replyNo = "reply_no" + no;
   var replyCont = "content_cont" + no;

   const id = $('#' + replyId).val();
   const reNo = $('#' + replyNo).val();
   const cont = $('#' + replyCont).val();

   console.log(id + "/" + no + "/" + cont);

   const replyData = {
      content_id : id,
      content_no : reNo,
      content_cont : cont
   };

   $.ajax({
      url : "/project/user/community/editReply",
      type : "post",
      data : JSON.stringify(replyData),
      dataType : "text",
      headers : {
         "Content-Type" : "application/json"
      },
      success : function(result) {
         var obj = JSON.parse(result);
         console.log("통신 성공!" + obj.content_ref);
         location.href = "/project/user/community/content/"
               + obj.content_ref;
      },
      error : function() {
         console.log("통신 실패");
      }
   });
}

function editFormOpen(no) {
   var reply_cont = "reply_cont" + no;
   var reply_edit_btn = "reply_edit_btn" + no;
   var replyForm_edit_btn = "replyForm_edit_btn" + no;

   $('.' + reply_cont).attr('readonly', false);
   $('#' + reply_edit_btn).show();
   $('#' + replyForm_edit_btn).hide();
}

function reReplyinsert(no, id) {
   // var reRepliesList = "reReplies_list"+no;
   var replyListOne = "reply_list_one" + no;
   var reReplyForm = "re_reply_form" + no;
   var submitBtn = $('#' + reReplyForm).find("input[type='submit']");

   var reId = id;
   if ('${session_id}' != reId) {
      console.log(reId + " 가 열림 / " + no + "/ id : " + reReplyForm);
      // $("#"+replyListOne).append($('#re_reply_form'));
      $(submitBtn).attr('disabled', false);
      $('#' + reReplyForm).show();
   }
}

function click_confirm(no) {
   var reReplyContentForm = "reReply_content_form" + no;
   if ($('#' + reReplyContentForm).val() == "") {
      alert('대댓글을 작성해주세요!');
      return false;
   } else {
      return true;
   }
}



</script>

<body id="board_content">
<c:set var = "session_id" value = "${session_id }"/>
   <br>
   <br>
   <div id="wrap">

      <div>

         <br>

         <hr>


         <div id="content_range"></div>

         <br> <br>
         <form action="<c:url value='/user/community/edit'/>" method="get">
            <input type="hidden" id="content_no" value="${c.content_no }"
               name="content_no" /> <input type="hidden" name="page"
               value="${paging.page}"> <input type="hidden"
               name="counterPerPage" value="${paging.counterPerPage}">
            <figure>
               <blockquote class="blockquote">
                  <h3 style="font-weight:bold;">${c.content_title}</h3>
               </blockquote>
               <figcaption class="blockquote-footer" style="font-weight:bold; margin-left:20px;">
                  <cite title="Source Title" >글쓴이  :  ${c.content_id } &nbsp; / </cite>
                  &nbsp; <cite title="Source Title">장소 :  ${c.content_local } </cite>
               </figcaption>
            </figure>
            <br>

            <div style="width: 100%; margin: auto;">
               <br> <br>
               <!--  <div id="summernote"></div> -->
               <div
                  style="width: 971px; overflow: hidden; word-break: break-all; margin: auto;">
                  ${c.content_cont}</div>
               <c:if test="${session_id == c.content_id }">
                  <input type="submit" id="editBtn" class="btn btn-primary"
                     value="수정하기" />
                  <div style="clear: both;"></div>
               </c:if>
               <c:if test="${fn:contains(session_id, 'admin') }">
                  <a href="<c:url value='/admin/admin_community?page=${paging.page}&counterPerPage=10'/>" class="btn btn-primary" style="float: right; margin: 5px;">관리자페이지</a>
               </c:if>
               <a class="btn btn-primary"
                  href="<c:url value='/user/community/list?page=${paging.page}&counterPerPage=8'/>"
                  style="float: right; margin: 5px;">목록</a>
            </div>
         </form>
         <c:if test="${session_id == c.content_id || u=='0'}">
            <form method="post" action="<c:url value='/user/community/delete'/>">
               <input type="hidden" id="content_no" value="${c.content_no }"
                  name="content_no" />
               <button id="delete_content" class="btn btn-danger" type="submit"
                  onclick="return confirm('정말로 삭제하시겠습니까?');"
                  style="float: right; margin: 5px;">글 삭제</button>
            </form>
         </c:if>
         <div>

            <br>


         </div>

      </div>
      <div style="clear: both;"></div>
      <div>

         <!-- 댓글 -->
         <c:if test="${replies != null }">
            <c:forEach items="${replies }" var="r">
               <div class="form-floating" id="reply_list_one${r.content_no }">
                  <label for="floatingTextarea2">댓글 > <span>${r.content_id}</span>&nbsp;
                     / <span> <c:if test="${r.newCont == true }">
                           <fmt:formatDate value="${r.content_regdate }"
                              pattern="HH:MM(a)" />
                        </c:if> <c:if test="${r.newCont != true }">
                           <fmt:formatDate value="${r.content_regdate }"
                              pattern="yyyy년 MM월 dd일" />
                        </c:if></span></label>
                  <textarea class="form-control reply_cont${r.content_no }"
                     id="content_cont${r.content_no }"
                     style="height: auto; margin-bottom: 10px;" name="content_cont"
                     readonly
                     onclick="reReplyinsert(${r.content_no}, '${r.content_id }');">${r.content_cont }</textarea>
                  <c:if test="${session_id == r.content_id || u=='0' }">

                     <button id="replyForm_edit_btn${r.content_no }"
                        class="btn btn-light"
                        style="float: right; border: 0.5px dotted gray"
                        onclick="editFormOpen(${r.content_no});">댓글 수정</button>

                     <button id="reply_edit_btn${r.content_no }"
                        class="btn btn-secondary" style="float: right; display: none;"
                        onclick="editFunc(${r.content_no});">댓글 수정</button>



                     <form action="<c:url value='/user/community/delete'/>"
                        method="post">
                        <input type="hidden" value="${r.content_id }" name="content_id"
                           id="reply_id${r.content_no }" /> <input type="hidden"
                           value="${r.content_no }" name="content_no"
                           id="reply_no${r.content_no }" /> <input type="submit"
                           id="reply_delete_btn" class="btn btn-light"
                           style="float: right; margin-right: 10px; border: 0.5px dotted gray"
                           value="답글 삭제" />
                     </form>
                  </c:if>

                  <div style="clear: both;"></div>
                  <br>
                  <!-- 댓글의 댓글 리스트-->
                  <c:if test="${reReplies != null}">
                     <div id="reReplies_list${r.content_no }">
                        <c:forEach items="${reReplies }" var="rre">
                           <c:if test="${rre.content_level == r.content_no}">
                              <svg
                                 style="float: left; margin-left: 80px; vertical-align: top;"
                                 xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-arrow-return-right"
                                 viewBox="0 0 16 16">
  <path fill-rule="evenodd"
                                    d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z" />
</svg>
                              <div class="form-floating" style="float: left;">
                                 <label style="margin-left: 10px;">${rre.content_id }
                                    > ${rre.content_regdate }</label>
                                 <textarea class="reply_cont${rre.content_no} form-control"
                                    id="content_cont${rre.content_no}"
                                    style="height: auto; margin-bottom: 10px; width: 800px;"
                                    name="content_cont" readonly
                                    onclick="reReplyinsert(${r.content_no}, '${rre.content_id }');">${rre.content_cont }</textarea>
                              </div>

                              <c:if test="${session_id == rre.content_id || u=='0' }">
                                 <button id="replyForm_edit_btn${rre.content_no }"
                                    class="btn btn-light"
                                    style="margin: 20px 0px 5px 5px; float: left; border: 0.5px dotted gray; height: 30px;"
                                    onclick="editFormOpen(${rre.content_no});">
                                    <svg style="vertical-align: top;"
                                       xmlns="http://www.w3.org/2000/svg" width="43" height="16"
                                       fill="currentColor" class="bi bi-scissors"
                                       viewBox="0 0 16 16">
  <path
                                          d="M3.5 3.5c-.614-.884-.074-1.962.858-2.5L8 7.226 11.642 1c.932.538 1.472 1.616.858 2.5L8.81 8.61l1.556 2.661a2.5 2.5 0 1 1-.794.637L8 9.73l-1.572 2.177a2.5 2.5 0 1 1-.794-.637L7.19 8.61 3.5 3.5zm2.5 10a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0zm7 0a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0z" />
</svg>
                                 </button>


                                 <button id="reply_edit_btn${rre.content_no }"
                                    class="btn btn-secondary"
                                    style="margin: 20px 0px 5px 5px; vertical-align: top; float: left; display: none; width: 70px; height: 30px;"
                                    onclick="editFunc(${rre.content_no});">수정</button>

                                 <form action="<c:url value='/user/community/delete'/>"
                                    method="post">
                                    <input type="hidden" value="${rre.content_id }"
                                       name="content_id" id="reply_id${rre.content_no }" /> <input
                                       type="hidden" value="${rre.content_no }" name="content_no"
                                       id="reply_no${rre.content_no }" /> <input type="submit"
                                       id="reply_delete_btn" class="btn btn-light"
                                       style="margin:5px 0px 5px 5px; vertical-align:center; float:left; border:0.5px dotted gray; width:70px; height:30px; background-image: url('<c:url value="/images/icon/trash-fill.svg"/>'); background-size :auto;  background-repeat: no-repeat; background-position: center;"
                                       value="" />
                                 </form>

                                 <div style="clear: both;"></div>
                              </c:if>
                           </c:if>
                        </c:forEach>


                     </div>
                  </c:if>





               </div>

               <div id="re_reply_form${r.content_no }"
                  style="display: none; margin-left: 80px;">
                  <svg style="float: left; margin-right: 10px;"
                     xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                     fill="currentColor" class="bi bi-arrow-return-right"
                     viewBox="0 0 16 16">
  <path fill-rule="evenodd"
                        d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z" />
</svg>
                  <form action="<c:url value='/user/community/reReply'/>"
                     method="post" onsubmit="return click_confirm(${r.content_no});">
                     <input type="hidden" name="content_id" value="${session_id }" />
                     <input type="hidden" name="content_ref" value="${r.content_ref }" />
                     <input type="hidden" name="content_level"
                        value="${r.content_no }" /> <input type="hidden"
                        name="content_title" value="댓글의 댓글" /> <input type="hidden"
                        name="page" value="${paging.page}"> <input type="hidden"
                        name="counterPerPage" value="${paging.counterPerPage}">
                     <label>대댓글> <span>${session_id }</span>
                     </label><br>
                     <textarea class="form-control"
                        style="width: 800px; margin-left: 20px; display: inline;"
                        name="content_cont" placeholder="@${r.content_id} 대댓글을 달아주세요."
                        id="reReply_content_form${r.content_no }"></textarea>
                     <input type="submit" value="등록" class="btn btn-light"
                        style="float: right; border: 0.5px dotted gray; margin-top: 20px;"
                        disabled="disabled" />
                  </form>
               </div>
               <br>
            </c:forEach>
            <!-- 대댓글 폼 -->


         </c:if>


         <!-- 댓글 폼 -->
         <c:if test="${session_id != c.content_id }">
            <form action="<c:url value='/user/community/reply'/>" method="post">
               <div class="form-floating">
                  <br>
                  <hr style="margin-bottom: 5px;">
                  <input type="hidden" id="content_ref" value="${c.content_no }"
                     name="content_ref" /> <input type="hidden" id="content_id"
                     value="${session_id }" name="content_id" /> <input type="hidden"
                     id="content_title" value="댓글" name="content_title" /> <input
                     type="hidden" id="reply_step" value="1" name="reply_step" /> <input
                     type="hidden" name="page" value="${paging.page}"> <input
                     type="hidden" name="counterPerPage"
                     value="${paging.counterPerPage}"> <label>댓글 > <span>${session_id }</span></label><br>
                  <textarea class="form-control" placeholder="댓글을 달아주세요."
                     id="content_cont"
                     style="height: 100px; width: 865px; float: left; margin-bottom: -20px;"
                     name="content_cont"></textarea>
                  <input type="submit" class="btn btn-primary" value="답변 달기"
                     style="margin-left: 10px; float: left;" />
               </div>
            </form>
         </c:if>
      </div>
   </div>


</body>

</html>