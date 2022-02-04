<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/slide/css/swiper.min.css'/>">
<style>
.swiper-container {
	height:600px;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
#2_img {
	border:1px solid red;
	box-shadow: 0 0 5px #555;
	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
	border-top-left-radius:5px;
	border-top-right-radius:5px;
}
.swiper-button-prev{
background: url('/project/resources/images/travel/left.png') center center / 100% no-repeat;
}
.swiper-button-next{
background: url('/project/resources/images/travel/right.png') center center / 100% no-repeat;
}
.swiper-button-prev::after,
.swiper-button-next::after{
display:none;
}
.swiper-card{
position:absolute;
height:108px;
width:248px;
background-color:white;
border:1px solid #f5f5f5;
border-bottom-right-radius:5px;
border-bottom-left-radius:5px;
top:288px;
}
.swiper-title{
color:black;
font-size:16px;
font-weight:500;
text-align:left;
margin-top:15px;
margin-left:10px;
}
.swiper-local{
color:black;
font-size:16px;
text-align:left;
margin-top:5px;
margin-left:10px;
}
.swiper-hit{
color:black;
font-size:14px;
text-align:left;
margin-top:5px;
margin-left:10px;
}
.swiper-regdate{
color:black;
text-align:right;
margin-top:5px;
margin-right:20px;
}

</style>

<meta charset="UTF-8">
<title>slide test </title>
</head>
<body>
<div class="swiper-container swiper2">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
	<c:forEach var="u" items="${ulist}">
		<div class="swiper-slide">
			<a href="<c:url value='/user/community/content/${u.content_no}?page=1&counterPerPage=8&keyword=&condition=title'/>">
			<img class="2_img" src="<%=request.getContextPath()%>${u.content_file}" width="250" height="180" alt="썸네일" />
			<div class="swiper-card">
			<div class="swiper-title">${u.content_title}</div>
			<div class="swiper-local">지역 : ${u.content_local}</div>
			<div class="swiper-hit">조회수 : ${u.content_hit}</div>
			<div class="swiper-regdate">${fn:substring(u.content_regdate,0,10)}</div>
			</div>
			</a>
		</div>
	</c:forEach>
  </div>
     <!-- If we need pagination -->

  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
 </div>
<script src="<c:url value='/resources/slide/JS/swiper.min.js'/>"></script> 
<script>

	new Swiper('.swiper2', {
		slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 30, // 슬라이드간 간격
		slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,

		loop : true, // 무한 반복

		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
</script>
</body>
</html>