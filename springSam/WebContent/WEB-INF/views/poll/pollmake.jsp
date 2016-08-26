<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

</style>
<script type="text/javascript">
$(document).ready(function (){   //보기 설정 보여주기
	for(i=5; i<=10; i++){
		$('#poll'+i).hide();     //보기는 먼저 4개까지 입력하게 숨기기
	}	
});

function pollchange(me){
	var num =me.options[me.selectedIndex].value;   //보기 갯수 선택했을때 값 받아오기
	alert("니가 선택한 num은 =" + num);
	
	for(i=1 ; i <=10 ; i++){
		$('#poll'+i).val(""); 
		$('#poll'+i).hide(); 
	}
	
	for(i=1 ; i <=num ; i++){
		$('#poll'+i).show(); 
	}
}
</script>

<%
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH)+1;
int tday = cal.get(Calendar.DATE);
%>

<form action = "pollmakeAf.do" method="post">
   <table  class="list_table" style="width:85%;">
   <colgroup> <col width="100px"/><col width="auto"/></colgroup>
      <tr>
         <th>아이디</th>
         <td style="text-align: left;">&nbsp; ${login.id }
         <input type="hidden" name="id" value="${login.id }"/></td>
      </tr> 
       <tr>
         <th>투표 기한</th>
         <td style="text-align:left;">
              <select name="syear">&nbsp;
               <%
               for(int i = tyear; i<tyear+6 ; i++ ){
            	   %>
            	   <option <%=(tyear+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option> 
            	   <%
               }%>
              </select>년&nbsp;
              
             <select name="smonth">
               <%
               for(int i = 1; i<=12 ; i++ ){
            	   %>
            	   <option <%=(tmonth+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option> 
            	   <%
               }%>
              </select>월&nbsp;
              
              <select name="sday">
               <%
               for(int i = 1; i<= cal.getActualMaximum(Calendar.DAY_OF_MONTH) ; i++ ){
            	   %>
            	   <option <%=(tday+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option> 
            	   <%
               }%>
              </select>일&nbsp;
             
              ~&nbsp;
              
              <select name="eyear">
               <%
               for(int i = tyear; i<tyear+6 ; i++ ){
            	   %>
            	   <option <%=(tyear+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option> 
            	   <%
               }%>
              </select>년&nbsp;
              
             <select name="emonth">
               <%
               for(int i = 1; i<=12 ; i++ ){
            	   %>
            	   <option <%=(tmonth+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option> 
            	   <%
               }%>
              </select>월&nbsp;
              
              <select name="eday">
               <%
               for(int i = 1; i<= cal.getActualMaximum(Calendar.DAY_OF_MONTH) ; i++ ){
            	   %>
            	   <option <%=(tday+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i %></option> 
            	   <%
               }%>
              </select>일
         </td>  
      </tr> 
      <tr>
         <th>투표내용</th>
         <td style="text-align:left;"><textarea rows="10" cols="100" name="question"></textarea></td>  
      </tr> 
      <tr>
         <th>투표 문항수</th>
         <td style="text-align:left;">
             <select name ="itemcount" onchange="pollchange(this)">
                 <%
                 for(int i =2 ; i <= 10 ; i++){
                	 %>
                	 <option <%=(4+"").equals(i+"")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
                	 <%
                 }
                 %>
             </select>개
         </td>  
      </tr> 
       <tr>
         <th>투표 응답 문항</th>
         <td style="text-align:left;">
              <%
                 for(int i =1 ; i <= 10 ; i++){
                	 %>
                	   <div id='poll<%=i %>'>
                	     <%=(i+"") %>번 : <input type="text" name='poll<%=i %>' size="110"><br>
                	   </div>
                	<%
                 }
                 %>
         </td>  
      </tr> 
      <tr>
         <td colspan="2"><span class="blue button"><input type="submit"  value="작성완료"></span></td>
      </tr> 
   </table>
</form>
