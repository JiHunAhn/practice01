<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sist.co.Help.DateUtil" %>
<%@ page import="sist.co.model.SistPollDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<form action="polling.do" method="post">
<table class="list_table" style="width:95%;">
   <colgroup>
      <col width="100px"/><col width="auto"/>
   </colgroup>
   
   <tr>
       <th>투표 번호</th>
       <td style="text-align: left;"><input type="text" name="pollid"  size="50" readonly="readonly" value="${poll.pollid }" /></td>
   </tr>
   <tr>
       <th>아이디</th>
       <td style="text-align: left;"><input type="text" name="id"  size="50" readonly="readonly" value="${login.id }" /></td>
   </tr>
   
   <tr>
       <th>투표 기한</th>
       	<td style="text-align: left">	${poll.sdate}~${poll.edate} </td>
   </tr>
   
    <tr>
       <th>투표 내용</th>
       <td style="text-align: left;"><textarea rows="10" cols="50" name="question" readonly="readonly">${poll.question }</textarea></td>
   </tr>
   
   <tr>
       <th>투표 문항수</th>
       <td style="text-align: left;">${poll.itemcount }개</td>
   </tr>
   
   <tr>
       <th>투표 상세 문항</th>
       <td style="text-align: left;">
           <c:forEach items="${pollsublist }" var="psub" varStatus="vs">
               ${vs.count }번 : <input type="radio" name="pollsubid"  ${vs.count==1 ? "checked='checked'":'' } value='${psub.pollsubid }'/>
               <input type="text" size="60" readonly="readonly" name='answer' value="${psub.answer }"/><br>
           </c:forEach>
       </td>
   </tr>
   <tr align="center">
       <td colspan="2">
       		<span class="blue button"><input type="submit" value="투표하기" ></span>
       </td>
   </tr>
</table>

</form>

<span class="blue button"><a href="polllist.do">돌아가기</a></span>