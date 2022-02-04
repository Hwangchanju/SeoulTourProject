<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/slide/css/swiper.min.css'/>">
<style>
.swiper-container {
  width: 100%;
  height:400px;
 }
#1_img{
	width:100%;
	height:400px;
}
h1 {
	color:white;
	position:absolute;
	font-size:40px;
	top:150px;
	left:350px;
	word-spacing:-3px;
}
.slide{
	position:absolute;
	top:200px;
	left:350px;
	color:white;
	font-size:20px;
	font-weight:600;
	word-spacing:-3px;
}
</style>

<meta charset="UTF-8">
<title>slide test </title>
</head>
<body>
<div class="swiper-container swiper1">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
    <!-- Slides -->
    <div class="swiper-slide">
    	<div>
    	<h1>See You in SEOUL</h1>
    	<p class="slide">서울에서 만나요!</p>
    	</div>
    	<img class="1_img" src="<c:url value='/resources/slide/images/slide1.png'/>" alt="">
   </div>
    <div class="swiper-slide">
    <h1>See You in SEOUL</h1>
    	<p class="slide">서울에서 만나요!</p>
    	<img class="1_img" src="<c:url value='/resources//slide/images/slide2.jpeg'/>" alt="">
    </div>
    <div class="swiper-slide">
    	<div>
    	<h1>See You in SEOUL</h1>
    	<p class="slide">서울에서 만나요!</p>
    	</div>
    	<img class="1_img" src="<c:url value='/resources/slide/images/slide3.png'/>" alt="">
    </div>
  </div>
     <!-- If we need pagination -->
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
 </div>
<script src="<c:url value='/resources/slide/JS/swiper.min.js'/>"></script> 
<script>

	new Swiper('.swiper1', {
		//autoplay
		//autoplay: {
			  // delay: 10000,
		//	 },
		// Optional parameters
		direction : 'horizontal',
		loop : true,

		// If we need pagination
		pagination : {
			el : '.swiper-pagination',
		},

		// Navigation arrows
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},

		// And if we need scrollbar
		scrollbar : {
			el : '.swiper-scrollbar',
		},
	});
</script>
</body>
</html>