<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sist.co.Help.DateUtil" %>
<%@ page import="sist.co.model.SistPollDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
​

<%
List<SistPollDTO> plists = new ArrayList<SistPollDTO>();
Object Oflist = request.getAttribute("plists");

if(Oflist != null){
	plists = (List<SistPollDTO>)Oflist;
}

%>




<c:if test="${login.auth eq '3' }">
<table class="list_table" style="width:95%;">
   <colgroup>
      <col width="40"/><col width="60"/><col width="300"/><col width="50"/>
      <col width="100"/><col width="100"/><col width="50"/><col width="40"/><col width="100"/>
   </colgroup>
   
   <thead>
      <th>번호</th><th>ID</th><th>질문</th><th>결과</th><th>시작일</th><th>종료일</th><th>질문항수</th><th>투표수</th><th>등록일</th>
   </thead>
   
     <c:if test="${empty plists }">
          <tr><td colspan="9">투표가 읎어서 햄보칼수가업서!</td></tr>
     </c:if>
     
     
     <%
      for(int i =0; i < plists.size(); i++){
    	  SistPollDTO poll = plists.get(i);
    	
     %>
        <tr bgcolor="#aabbcc">
           <td><%=(i+1) %></td>  
           <td><%=poll.getId() %></td>
          <%
            boolean isS = poll.isVote();
            if(isS||DateUtil.isEnd(poll.getEdate())){
        	   %>
        	<td>[마감]<%=poll.getQuestion() %></td>
        	   <%
           }else{
        	   %>
        	<td>
        	     <a href='polldetail.do?pollid=<%=poll.getPollid() %>'>
        	         <%=poll.getQuestion() %>
        	     </a>
        	</td>
        	<% } %>
            <td>
            <%
             if(isS||DateUtil.isEnd(poll.getEdate())){
             %>
               <a href="pollresult.do?pollid=<%=poll.getPollid() %>">
                 결과
               </a>
               <% }else{ %>
               <img src="image/pen.gif"/>
               <% } %>
            </td>
            <td><%=poll.getSdate() %></td>
            <td><%=DateUtil.pollState(poll.getEdate()) %><%=poll.getEdate() %></td>
            <td><%=poll.getItemcount() %></td>
            <td><%=poll.getPolltotal() %></td>
            <td><%=poll.getRegdate() %></td>
        </tr>
      <%} %>

</table>

</c:if>

<c:if test="${login.auth eq '1' }">
<table class="list_table" style="width:95%;">
   <colgroup>
     <col width="40"/><col width="60"/><col width="300"/><col width="50"/>
      <col width="100"/><col width="100"/><col width="50"/><col width="40"/><col width="100"/>
   </colgroup>
   
   <thead>
      <th>번호</th><th>ID</th><th>질문</th><th>결과</th><th>시작일</th><th>종료일</th><th>질문항수</th><th>투표수</th><th>등록일</th>
   </thead>
   
   <c:if test="${empty plists }">
        <tr><td colspan="9">관리자 이자식아 투표 좀 만들어라</td></tr>
   </c:if>
   
   
   
   <%
      for(int i =0; i < plists.size(); i++){
    	  SistPollDTO poll = plists.get(i);
    	  
     %>
        <tr bgcolor="#aabbcc">
           <td><%=(i+1) %></td>  
           <td><%=poll.getId() %></td>
           <td><a href='polldetail.do?pollid=<%=poll.getPollid() %>'>
        	         <%=poll.getQuestion() %>
        	     </a></td>
           <td><a href="pollresult.do?pollid=<%=poll.getPollid() %>">
                 결과</a></td>
           <td><%=poll.getSdate() %></td>
           <td><%=DateUtil.pollState(poll.getEdate()) %><%=poll.getEdate() %></td>
           <td><%=poll.getItemcount() %></td>
           <td><%=poll.getPolltotal() %></td>
           <td><%=poll.getRegdate() %></td>
         </tr>  
    <%} %>  
  
<%--        이렇게 써도 되는데 그러면 if(isS||DateUtil.isEnd(poll.getEdate())){ 이거 쓰는데 어렵다     	  
      <c:forEach var="i" items="${plists }" varStatus="poll" >
          <tr bgcolor="#aabbcc">
             <td>${poll.count }</td>
             <td>${i.id }</td>
             <td>${i.question }</td>
             <td>${i.sdate }</td>
             <td>${i.edate }</td>
             <td>${i.itemcount }</td>
             <td>${i.polltotal }</td>
             <td>${i.regdate }</td>
           </tr>
      </c:forEach> --%>
     
</table>

</c:if>

