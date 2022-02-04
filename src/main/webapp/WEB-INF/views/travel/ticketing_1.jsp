<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/travel/ticketing.css">
<title> 공연정보 </title>
</head>
<body>
 <div id="wrap">
 <h1>2021 토요 명품 공연</h1>
  <img src="./resources/images/travel/concert/토요명품공연.jpg" />
  <ul>
   <li><p class="l">공연제목</p>
   <p class="r">토요명품공연</p></li>
   <li><p class="l">공연기간</p>
   <p class="r">21.01.09(토) - 21.12.18(토)</p></li>
   <li><p class="l">공연일</p>
   <p class="r">sdfhkjskhf</p></li>
   <li><p class="l">공연장소</p>
   <p class="r">우면당</p></li>
   <li><p class="l">관람시간</p>
   <p class="r">70분</p></li>
   <li><p class="l">가격</p>
   <p class="r">A석 20,000원 B석 10,000원</p></li>
   <li><p class="l">관람등급</p>
   <p class="r">8세 이상</p></li>
   <li><input type="button" id="book" value="예매" onclick="location='success';" /></li>
  </ul>
  
  <div class="clear"></div>
  <br/><br/>
 </div>
 <div id="detail_info">
 <ul><li><h3>공연 상세 내용</h3></li></ul>
 <img src="./resources/images/travel/concert/토요명품공연_상세.jpg" />
 </div>
</body>
</html>

<jsp:include page="../include/footer.jsp" />