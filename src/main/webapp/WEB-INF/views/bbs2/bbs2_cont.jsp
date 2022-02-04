<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>${b.bbs_title}</title>
<jsp:include page="../include/header.jsp" />

<div id="bCont_wrap">

<table id="bCont_title">
<tr>
<th id="title">${b2.bbs_title}</th>
</tr>
<tr>
<th id="regdate">작성일 : ${fn:substring(b2.bbs_date,0,10)}</th>
</tr>
<tr>
<th id="cont">${bbs_cont}</th>
</tr>

</table>

<%-- <div id="bCont_menu">
<input type="button" value="답변" onclick="location='bbs2_cont?bbs2_no=${b2.bbs_no}&page=${page}&state=reply';"/>
<input type="button" value="수정" onclick="location='bbs2_cont?bbs2_no=${b2.bbs_no}&page=${page}&state=edit';"/>
<input type="button" value="삭제" onclick="location='bbs2_cont?bbs2_no=${b2.bbs_no}&page=${page}&state=del';"/>
<input type="button" value="목록" onclick="location='bbs2_list?page=${page}';"/>
</div> --%>
</div>
<jsp:include page="../include/footer.jsp" />