<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<table class="list_table" style="width: 85%;">
<col width="50"/><col width="175"/><col width="450"/><col width="50"/>

  <tr bgcolor="#09bbaa">
      <th>번호</th><th>시간</th><th>제목</th><th>삭제</th>
  </tr>
  
  <c:forEach items="${callist}" var="cal" varStatus="vs">
    <tr>
       <td>${vs.count }</td>
       <td>${cal.wdate }</td>
       <td style="text-align: left;"> &nbsp;  <a href="caldetail.do?seq=${cal.seq }"> ${cal.title }</a></td>
       <td>
           <form action="caldelete.do"  method="post">
               <input type="hidden" name="seq" value="${cal.seq }">     
               <span class="blue button"><input type="submit" value="삭제"/></span> 
           </form>
       </td>
    </tr>
  </c:forEach>
</table>

<c:url var="urls" value="calendar.do">
   <c:param name="year" value="${year }"></c:param>
   <c:param name="month" value="${month }"></c:param>
</c:url>
<br>
<hr>
<span class="blue button"><a href="${urls }">달력보기</a></span> 