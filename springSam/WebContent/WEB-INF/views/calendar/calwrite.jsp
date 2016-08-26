<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="sist.co.Help.myCal"%>
<%@ page import="java.util.Calendar"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<%
myCal jcal = (myCal)request.getAttribute("jcal");
String year = ""+jcal.getYear(); //int -> String 바꾸기
String month = ""+jcal.getMonth();
String day = "" + jcal.getDay();

Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH)+1;
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR_OF_DAY); //24시간 단위
int tmin = cal.get(Calendar.MINUTE);
%>

<form action="calwriteAf.do" method="post">
   <table class="list_table" style="width: 85%;">
      <colgroup>
         <col style="width:200;"/><col style="width:auto;"/>
      </colgroup>
      
      <tr>
          <th>아이디</th>
          <td style="text-align: left;">&nbsp;${login.id }</td>
          <input type="hidden" name="id" value="${login.id }"/> 
      </tr>
      <tr>
          <th>일정</th>
          <td style="text-align: left;"> 
              <select name ="year">
           <%
             for(int i =tyear-3; i<=tyear+3; i++){
            	 %>
            	 <option <%=year.equals(i+"")?"selected='selected'":"" %>value="<%=i %>"><%=i %></option>
                 <%
             }
           %>
           </select>년 &nbsp;
           
           <select name ="month">
           <%
             for(int i = 1; i<=12; i++){
            	 %>
            	 <option <%=month.equals(i+"")?"selected='selected'":"" %>value="<%=i %>"><%=i %></option>
                 <%
             }
           %>
           </select>월 &nbsp;
                 
           <select name ="day">
           <%
             for(int i =1; i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
            	 %>
            	 <option <%=day.equals(i+"")?"selected='selected'":"" %>value="<%=i %>"><%=i %></option>
                 <%
             }
           %>
           </select>일 &nbsp;

           <select name ="hour">
           <%
             for(int i =1; i<=24; i++){
            	 %>
            	 <option <%=(thour+"").equals(i+"")?"selected='selected'":"" %>value="<%=i %>"><%=i %></option>
                 <%
             }
           %>
           </select>시 
           
           <select name ="min">
           <%
             for(int i =0; i<=59; i++){
            	 %>
            	 <option <%=(tmin+"").equals(i+"")?"selected='selected'":"" %>value="<%=i %>"><%=i %></option>
                 <%
             }
           %>
           </select>분 &nbsp;
          </td>
          
      </tr>
      <tr>
          <th>제목</th>
          <td style="text-align: left;"><input type="text" name="title" size="118" title="제목"/> </td>
      </tr>
      <tr>
          <th>일정 상세 내용</th>
          <td style="text-align: left;"><textarea name="content" rows="20" cols="100"></textarea></td>
      </tr> 
      <tr>
         <td colspan="2"><span class="blue button"><input type="submit" value="저장"></span></td> 
      </tr> 
   </table>
</form>