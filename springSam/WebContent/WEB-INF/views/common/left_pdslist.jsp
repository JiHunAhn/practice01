<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri= "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<div class="menu_table">
  <ul style="width: 100%">
    <li class="title">자료실</li>
    <li class="subtitle">자료실</li>
    <li class="menu_item">
        <a href="#none" onclick="url_pdslist()" title="글 목록">자료실 목록</a>
    </li>
    <li class="menu_item">
        <a href="#none" onclick="url_pdswrite()" title="글 쓰기">자료 올리기</a>
    </li>
  </ul>
</div>