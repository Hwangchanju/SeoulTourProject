<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 별마당 도서관 </title>
<link rel="stylesheet" type="text/css" href="./resources/css/travel/travel_detail.css">
<link rel="stylesheet" type="text/css" href="./resources/css/travel/map_css/map_별마당도서관.css">
</head>
<body>
<br/>
 <div id="wrap">
 	<div id="title01">별마당도서관</div>
 	<br/>
 	<div id="title02">서울 강남구</div>
 	<br/>
 	<div id="title03">사진</div>
 	<br/>
 	
 	<div class="section">
  		<input type="radio" name="slide" id="slide01" checked />
 		<input type="radio" name="slide" id="slide02" />
 		<input type="radio" name="slide" id="slide03" />
 	
 		<div class="slidewrap">
  			<ul class="slidelist">
 				<li>
 					<a class="slidebutton">
 						<label for="slide03" class="left"></label>
 						<img src="./resources/images/travel/district/별마당_2.jpg">
 						<label for="slide02" class="right"></label>
 					</a>
 				</li>
 			
 				<li>
 					<a class="slidebutton">
 						<label for="slide01" class="left"></label>
 						<img src="./resources/images/travel/district/별마당_3.jpg">
 						<label for="slide03" class="right"></label>
 					</a>
 				</li>
 			
 				<li>
 					<a class="slidebutton">
 						<label for="slide02" class="left"></label>
 						<img src="./resources/images/travel/district/별마당_4.jpg">
 						<label for="slide01" class="right"></label>
 					</a>
 				</li>
 			</ul>
 		</div>
 	</div>
 	
 	<p class="info">정보</p>
  	<p class="underline"></p>
  	<p class="cont">별마당 도서관은 코엑스 센트럴플라자 중심에 총 2,800㎡ 복층으로 구성되어 있다. 13m 높이 서가의 은은한 불빛이 공간 전체를 부드럽게 감싸는 편안한 서재를 컨셉으로 하여 다양한 테이블과 노트북 작업이 가능하도록 콘센트가 마련되어 있다. 특히 1층은 지하 1층의 선큰 공간을 조망하면서 여유롭게 독서 가능한 독립적인 공간으로 구성되어 있다. 별마당 도서관에는 총 5만 여권의 장서를 갖추고 있으며, 1층은 문학/인문학, 지하 1층은 취미/실용 관련 서적이 구비되어 있고 외국 원서 코너, 유명인의 서재 코너, 아이패드로 볼 수 있는 E-Book, 특히 해외 잡지까지 총 4백 여종의 잡지를 모아놓은 잡지 특화 코너도 마련되어 있다.</p>
 	
 	<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1629632981241" class="root_daum_roughmap root_daum_roughmap_landing"><p>지도</p></div>
<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1629632981241",
		"key" : "273hk",
		"mapWidth" : "800",
		"mapHeight" : "400"
	}).render();
</script>
 	
 	
 	<div class="detail_info">
   <ul>
    <li><strong>전화번호</strong><span>02-6002-3031</span></li>
    <li><strong>홈페이지</strong><span><a href="https://www.starfield.co.kr/starfieldLibrary">https://www.starfield.co.kr/starfieldLibrary</a></span></li>
    <li><strong>주소</strong><span>서울특별시 강남구 영동대로 513</span></li>
    <li><strong>휴일</strong><span>연중무휴</span></li>
    <li><strong>요금</strong><span>무료</span></li>
    <li><strong>시간</strong><span>10:30 ~ 22:00</span></li>
    <li><strong>주차</strong><span>주차가능</span></li>
   </ul>
  </div>
 	
 </div>
</body>
</html>

<jsp:include page="../include/footer.jsp" />