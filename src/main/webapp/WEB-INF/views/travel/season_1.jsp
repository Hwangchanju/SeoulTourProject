<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 노을 캠핑장 </title>
<link rel="stylesheet" type="text/css" href="./resources/css/travel/travel_detail.css">
<link rel="stylesheet" type="text/css" href="./resources/css/travel/map_css/map_노을캠핑장.css">
</head>
<body>
<br/>
 <div id="wrap">
 	<div id="title01">노을캠핑장</div>
 	<br/>
 	<div id="title02">서울 마포구</div>
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
 						<img src="./resources/images/travel/season/노을캠핑장_2.jpg">
 						<label for="slide02" class="right"></label>
 					</a>
 				</li>
 			
 				<li>
 					<a class="slidebutton">
 						<label for="slide01" class="left"></label>
 						<img src="./resources/images/travel/season/노을캠핑장_3.jpg">
 						<label for="slide03" class="right"></label>
 					</a>
 				</li>
 			
 				<li>
 					<a class="slidebutton">
 						<label for="slide02" class="left"></label>
 						<img src="./resources/images/travel/season/노을캠핑장_4.jpg">
 						<label for="slide01" class="right"></label>
 					</a>
 				</li>
 			</ul>
 		</div>
 	</div>
 
  <p class="info">정보</p>
  <p class="underline"></p>
  <p class="cont">하늘공원 내에 위치한 노을캠핑장은 이름에 걸맞게 노을로 물든 서울의 경관이 돋보이는 곳으로 예약 시작 후 5분 만에 예약이 완료될 정도로 시민들에게 많은 사랑을 받는 곳이다. 자연친화라는 측면에 맞게 공원 내에서는 전기차(유료)로만 이동이 가능하며, 텐트 등 물품대여를 하지 않기 때문에 캠핑장 이용객들은 개인 텐트를 준비해야 한다. 가족단위 캠핑을 권장하기 위한 곳이다. 부대시설로 음수대, 샤워실, 화장실, 테이블, 화덕 등 기본적인 편의시설은 완비된 상태이며, 구역에 따라 전기를 사용할 수 있는 곳과 없는 곳이 나뉘어져 있다.</p>
  
  <!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1629624524296" class="root_daum_roughmap root_daum_roughmap_landing"><p>지도</p></div>
<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1629624524296",
		"key" : "273h6",
		"mapWidth" : "800",
		"mapHeight" : "400"
	}).render();
</script>
  
  <div class="detail_info">
   <ul>
    <li><strong>전화번호</strong><span>02-304-3213</span></li>
    <li><strong>홈페이지</strong><span><a href="https://www.seoul.go.kr/storyw/campingjang/noel.do">https://www.seoul.go.kr/storyw/campingjang/noel.do</a></span></li>
    <li><strong>주소</strong><span>서울특별시 마포구 하늘공원로 108-1</span></li>
    <li><strong>요금</strong><span>10,000원 ~ 13,000원</span></li>
    <li><strong>시간</strong><span>14:00 ~ 익일 12:00</span></li>
    <li><strong>주차</strong><span>주차가능</span></li>
   </ul>
  </div>
</div>
</body>
</html>

<jsp:include page="../include/footer.jsp" />