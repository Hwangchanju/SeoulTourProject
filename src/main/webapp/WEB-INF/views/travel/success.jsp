<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  </title>
<link rel="stylesheet" type="text/css" href="./resources/css/travel/success.css">
</head>
<body>
 <div id="wrap">
  <div id="success_cont">
   <p id="success_title01">예매 완료</p>
   <p id="success_title02">예매가 완료 되었습니다.</p>
   <div id="inner_wrap">
    <img id="show_img" src="./resources/images/travel/concert/토요명품공연.jpg" />
    <ul>
     <li><p class="l">예매번호</p>
     <p class="r">random()</p></li>
    
     <li><p class="l">공연</p>
     <p class="r">토요명품공연</p></li>
    
     <li><p class="l">장소</p>
     <p class="r">우면당</p></li>
    
     <li><p class="l">날짜</p>
     <p class="r">21년 mm월 dd일</p></li>
    
     <li><p class="l">인원</p>
     <p class="r">1명</p></li>
    
     <li><p class="l">좌석</p>
     <p class="r">C11</p></li>
    
     <li><p class="l">금액</p>
     <p class="r">20,000원</p></li>
     
     <li>
      <input type="button" class="button" value="예매결과 문자발송" />
      <input type="button" class="button" value="예매취소" />
     </li>
    </ul>
   </div>
   
   <div class="clear"></div>
  </div>
 </div>
</body>
</html>
<jsp:include page="../include/footer.jsp" />