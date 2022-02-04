<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울 구석구석 </title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bbs.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/slide/css/swiper.min.css'/>"/>
<link href="<c:url value='/css/board.css'/>" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<c:url value='/resources/slide/css/swiper.min.css'/>">
<script src="<c:url value='/js/jquery.js'/>"></script>

<script src="<c:url value='/resources/js/modal_login_2.js'/>"></script>
<script src="<c:url value='/resources/slide/JS/swiper.min.js'/>"></script> 
</head>
<body>
<script>

$(function(){
    $("#modal_open_btn").click(function(){
    	$("#log-in-modal").fadeIn("fast");
    });
    
    $("#modal_close_btn").click(function(){
    	$("#log-in-modal").hide();
    });
	

     //스크롤 위치를 계속 확인해서
     // 모달창  위치를 변경해줌.
      $(window).scroll(function(){

        var aa =Math.max(0,(($(window).height()-$(this).outerHeight())/2) + $(window).scrollTop());
        
        $("#log-in-modal").css('top',aa+'px');

      });
     
     
      $('#log-in-modal').click(function(e){
    	 if(!$('.modal_content').has(e.target).length){
    		 $('#log-in-modal').fadeOut("fast");
    	 }
     })
     
 	var msg = '${msg}';
  	if(msg =="auth_fail"){
  		alert('로그인을 먼저 해주세요!');
  	}
});
</script>
<header>
<%--로그인 / 마이페이지 --%>
<div id="login"><c:set var = "session_id" value = "${session_id }"/>
			<c:if test="${session_id == null}">
			<a id="modal_open_btn" style="cursor:pointer;">로그인</a> 
			<a style="cursor:pointer;" onclick="location.href='<c:url value='/user/joinForm'/>';">회원가입</a>
			</c:if>
			<c:if test="${session_id != null }">
				<a href="<c:url value='/user/logout'/>" onclick="return confirm('로그아웃 되셨습니다.');">로그아웃</a>
				<c:if test="${fn:contains(session_id, 'admin') }">
				<a href="<c:url value='/admin/mypage?page=1&counterPerPage=10'/>">관리자페이지</a>
				</c:if>
				<c:if test="${!fn:contains(session_id, 'admin') }">
				<a href="<c:url value='/user/mypage/list?page=1&counterPerPage=9'/>">마이페이지</a>
				</c:if>
			</c:if>
		</div>
		<div class="clear"></div>
<%--회사 로고 --%>
<div id="logo"><a href="<c:url value='/main'/>"><img src="<c:url value='/resources/images/logoColor.png'/>" width="350" height="250" alt="logo" /></a></div>

<%--메뉴바 --%>
<nav>
<ul class="main" style="vertical-align: center; margin:auto;">
	<li><a href="<c:url value='/travel'/>">여행</a></li>
	<li><a>홈</a>
	<ul class="sub">
		<li><a href="<c:url value='/bbs2_list'/>">인기</a></li>
		<li><a href="<c:url value='/bbs_list'/>">코스</a></li>
		<li><a href="<c:url value='/admin/exhibition/exhibition/1'/>">축제</a></li>
	</ul></li>
	<li id="community_list_btn"><a href="<c:url value='/user/community/list?page=1'/>" >커뮤니티</a></li>
</ul>
</nav>
</header>
</body>
</html>
<%@ include file="../users/user/login_modal.jsp"%>