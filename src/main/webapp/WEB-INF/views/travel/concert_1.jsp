<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  </title>
<link rel="stylesheet" type="text/css" href="./resources/css/travel/travel_detail.css">
<link rel="stylesheet" type="text/css" href="./resources/css/travel/map_css/map_토요명품공연.css">
</head>
<body>
<br/>
 <div id="wrap">
  <div id="title01">토요명품공연</div>
  <br/>
  <div id="title02">서울 서초구 | 2021.01.09 ~ 2021.12.18</div>
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
 					<img src="./resources/images/travel/concert/토요명품공연_2.jpg">
 					<label for="slide02" class="right"></label>
 				</a>
 			</li>
 			
 			<li>
 				<a class="slidebutton">
 					<label for="slide01" class="left"></label>
 					<img src="./resources/images/travel/concert/토요명품공연_3.jpg">
 					<label for="slide03" class="right"></label>
 				</a>
 			</li>
 			
 			<li>
 				<a class="slidebutton">
 					<label for="slide02" class="left"></label>
 					<img src="./resources/images/travel/concert/토요명품공연_4.jpg">
 					<label for="slide01" class="right"></label>
 				</a>
 			</li>
 		</ul>
 	</div>
  </div>
  
  
  <div>
   <p class="info">정보</p>
   <p class="underline"></p>
   <p class="cont">전통춤과 음악, 노래를 골고루 감상할 수 있는 다채로운 토요상설 무대가 펼쳐진다.
	애호가를 위한 악·가·무 종합프로그램, 청소년, 초보자를 위한 해설이 있는 프로그램, 전문가의 해설이 있는 유네스코 지정
 	인류무형문화유산 프로그램 등 맞춤형 프로그램들로 마련되어 있다.</p>
  </div>
  
  <!-- * 카카오맵 - 지도 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1628091274050" class="root_daum_roughmap root_daum_roughmap_landing"><p>지도</p></div>
<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1628091274050",
		"key" : "26v3m",
		"mapWidth" : "800",
		"mapHeight" : "400"
	}).render();
</script>
 
 <div class="detail_info">
  <ul>
   <li><strong>시작일</strong><span>2021.01.09</span></li>
   <li><strong>종료일</strong><span>2021.12.18</span></li>
   <li><strong>전화번호</strong><span>	02-580-3300</span></li>
   <li><strong>홈페이지</strong><span>	<a href="http://www.gugak.go.kr">http://www.gugak.go.kr</a></span></li>
   <li><strong>주소</strong><span>서울 서초구 남부순환로 2364</span></li>
   <li><strong>장소</strong><span>국립국악원 우면당</span></li>
   <li><strong>요금</strong><span>A석 20,000원 B석 10,000원</span><input type="button" id="book" value="예매" onclick="location='ticketing';" /></li>
   <li><strong>시간</strong><span>매주 토요일 오후 3시</span></li>
  </ul>
 </div>
 
 </div>
</body>
</html>

<jsp:include page="../include/footer.jsp" />