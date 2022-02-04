<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<title>에디터 추천 인기 여행지</title>
<jsp:include page="../include/header.jsp" />

<div class="list_img">
<h1 class="text">에디터 추천 인기 여행지</h1>
<img src="./resources/images/list_img/best.png"/>
</div>

<div class="clear"></div>
<form method="get" action="bbs2_list">
 <div id="bList_wrap">
  <table id="bList_t">

   <c:if test="${!empty blist}">
    <tr>
    <c:forEach var="b2" items="${blist}" begin="0" end="3" >
     <td>
      <a href="bbs2_cont?bbs2_no=${b2.bbs_no}&page=${page}&state=cont"><img src="./upload2${b2.bbs_file}" width="280" height="206" alt="."/></a>
      <%-- 웹브라우저 주소창에 노출되는 get방식으로 bbs_no,page,state 각 네임피라미터 이름에 번호,페이지 번호,구분값 cont를 담아서 전달 --%>
     </td>
    </c:forEach>
     </tr>
     <tr>
    <c:forEach var="b2" items="${blist}" begin="0" end="3">
     <td>
     <a href="bbs2_cont?bbs2_no=${b2.bbs_no}&page=${page}&state=cont">${b2.bbs_title}</a>
     </td>
     </c:forEach>
     </tr>
    
    <tr>
    <c:forEach var="b2" items="${blist}" begin="4" end="7">
     <td>
      <a href="bbs2_cont?bbs2_no=${b2.bbs_no}&page=${page}&state=cont"><img src="./upload2${b2.bbs_file}" width="280" height="206" alt="."/></a>
      <%-- 웹브라우저 주소창에 노출되는 get방식으로 bbs_no,page,state 각 네임피라미터 이름에 번호,페이지 번호,구분값 cont를 담아서 전달 --%>
     </td>
     </c:forEach>
     </tr>
     <tr>
    <c:forEach var="b2" items="${blist}" begin="4" end="7">
     <td>
     <a href="bbs2_cont?bbs2_no=${b2.bbs_no}&page=${page}&state=cont">${b2.bbs_title}</a>
     </td>
     </c:forEach>
     </tr>
    
   </c:if>
   
   <c:if test="${empty blist}">
    <tr>
     <th colspan="5">자료실 목록이 없습니다.</th>
    </tr>  
   </c:if>
  </table>
  
 
  <div id="bList_paging">
   <%-- 검색 전 페이징(쪽나누기) --%>
   <c:if test="${(empty find_field) && (empty find_name)}">
    <c:if test="${page <= 1}">
     &#171;&nbsp;
    </c:if>
    <c:if test="${page >1}">
     <a href="bbs2_list?page=${page-1}">&#171;</a>&nbsp;
    </c:if>
    
    <%-- 쪽번호 출력부분 --%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     <c:if test="${a==page}"><${a}></c:if>
     
     <c:if test="${a != page}">
      <a href="bbs2_list?page=${a}">${a}</a>&nbsp;
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">&#187;</c:if>
    
    <c:if test="${page < maxpage}">
       <a href="bbs2_list?page=${page+1}">&#187;</a>
    </c:if>
   </c:if>
   
   <%-- 검색 후 페이징  --%>
    <c:if test="${(!empty find_field) && (!empty find_name)}">
    <c:if test="${page <= 1}">
     &#171;&nbsp;
    </c:if>
    <c:if test="${page >1}">
     <a href="bbs2_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">&#171;</a>&nbsp;
    </c:if>
    
    <%-- 쪽번호 출력부분 --%>
    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
     <c:if test="${a==page}"><${a}></c:if>
     
     <c:if test="${a != page}">
      <a href="bbs2_list?page=${a}&find_field=${find_field}&find_name=${find_name}">${a}</a>&nbsp;
     </c:if>
    </c:forEach>
    
    <c:if test="${page >= maxpage}">&#187;</c:if>
    
    <c:if test="${page < maxpage}">
       <a href="bbs2_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">&#187;</a>
    </c:if>
   </c:if>
  </div>
  
   <div id="bList_menu">
<%--     <input type="button" value="글쓰기" onclick="location='bbs_write?page=${page}';" /> --%>
    <c:if test="${(!empty find_field) && (!empty find_name)}"><%-- 검색필드와 검색어가 있는 경우 즉 검색하고 난 이후 실행 --%>
     <input type="button" value="전체목록" onclick="location='bbs2_list?page=${page}';" />     
    </c:if>
   </div>
   
   <%-- 검색 기능--%>
   <div id="bFind_wrap">
    <select name="find_field">
     <option value="bbs_title" <c:if test="${find_field == 'bbs2_title'}"> ${'selected'}</c:if>>제목</option>
     <option value="bbs_cont" <c:if test="${find_field == 'bbs2_cont'}"> ${'selected'}</c:if>>내용</option>
    </select>
    <input name="find_name" id="find_name" size="30" value="${find_name}" />
    <input type="submit" value="검색" />
   </div>   
 </div>
 </form>
 
<div class="clear"></div>
<jsp:include page="../include/footer.jsp" />
