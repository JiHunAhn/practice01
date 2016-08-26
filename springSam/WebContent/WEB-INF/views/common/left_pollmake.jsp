<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri= "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<div class="menu_table">
<c:if test="${login.auth eq '3' }">
  <ul style="width: 100%">
    <li class="title">투표</li>
    <li class="subtitle">투표하기</li>
    <li class="menu_item">
        <a href="#none" onclick="url_polllist()" title="투표 목록">투표 목록</a>
    </li>
</c:if>    
    
 <c:if test="${login.auth eq '1' }">   
    <li class="title">투표만들기</li>
    <li class="subtitle">투표</li>
    <li class="menu_item">
        <a href="#none" onclick="url_polllist()" title="투표 목록">투표 목록</a>
        <a href="#none" onclick="url_pollmake()" title="투표 만들기">투표 만들기</a>
    </li>
 </c:if> 
  </ul>
</div>