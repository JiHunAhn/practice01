<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri= "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<div class="menu_table">
  <ul style="width: 100%">
    <li class="title">일정관리</li>
    <li class="subtitle">일정관리</li>
    <li class="menu_item">
        <a href="#none" onclick="url_calendar()" title="일정달력">일정달력</a>
    </li>
    <li class="menu_item">
        <a href="#none" onclick="url_calwrite()" title="일정추가">일정추가</a>
    </li>
  </ul>
</div>