<%@ page contentType="text/html; charset=UTF-8"%>

<%@page import="sist.co.Help.myCal" %>
<%@page import="sist.co.Help.CalendarUtil" %>
<%@page import="java.util.Calendar" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<style>
table{
	border-collapse: collapse; 
}
table, td, th{
	border: 1px solid black;
}
.sunday{
	color:red;
	text-align: left;
	vertical-align: top;
}
.satday{
	color:blue;
	text-align: left;
	vertical-align: top;
}
.otherday{
	color:black;
	text-align: left;
	vertical-align: top;
}
.days2{
	font-size:20px;
	color:#4d6bb3;
	text-align: center;
	vertical-align: middle;
}
.days3{
	font-size:10px;
	color:#4d6bb3;
	text-align: center;
	vertical-align: middle;
}
.days4{	
	align:center;
	text-align: center;
	vertical-align: middle;
}
.innerTable{
	border: 0px;
}
</style>

<% 
myCal jcal = (myCal)request.getAttribute("jcal");

int dayOfWeek = jcal.getDayOfweek();
int lastDayOfMonth = jcal.getLastDay();

int year = jcal.getYear();
int month = jcal.getMonth();

String pp=String.format("<a href='./%s?year=%d&month=%d'><img src='image/left.gif'/></a>", 
		"calendar2.do", year-1, month);
String p=String.format("<a href='./%s?year=%d&month=%d'><img src='image/prec.gif'/></a>", 
		"calendar2.do", year, month-1);
String nn=String.format("<a href='./%s?year=%d&month=%d'><img src='image/last.gif'/></a>", 
		"calendar2.do", year+1, month);
String n=String.format("<a href='./%s?year=%d&month=%d'><img src='image/next.gif'/></a>", 
		"calendar2.do", year, month+1);

Calendar cal = Calendar.getInstance();
cal.set(year, month-1, 1);

int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>

<div class="list_table" align="center">
<table>
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>

<tr height="40px">
	<td class="days2" colspan="7">
		<%=pp %><%=p %>
			<font color="red" style="font-size: 20">
				<%=String.format("%d년&nbsp;%d월", year, month) %>
			</font>
		<%=n %><%=nn %>	
	</td> 
</tr>

<tr height="40px">
	<th class="days2">일</th>
	<th class="days2">월</th>
	<th class="days2">화</th>
	<th class="days2">수</th>
	<th class="days2">목</th>
	<th class="days2">금</th>
	<th class="days2">토</th>
</tr>

<tr height="40px">
	<%
	for(int i = 1;i < dayOfWeek; i++){
		%>
		<td>&nbsp;</td>
		<%	
	}
	for(int i = 1;i <= lastDay; i++){
		String wdate = CalendarUtil.yyyymmdd(year, month, i);
		%>
		<td id='mytd<%=i %>' class="days3" onmouseout="mout('<%=i %>')"	onmouseover="ajaxcalendar('<%=i %>','${login.id }','<%=wdate %>')" >
			<a href='calwrite.do?year=%d&month=%d&day=%d'><%=i %></a> 
			<div id="my<%=i %>"></div>
		</td>
		<% 
		if((i+dayOfWeek-1)%7 == 0){
			%>
			</tr><tr height="40px">
			<%
		}
	}
	for(int i = 0;i < (7-(dayOfWeek+lastDayOfMonth-1)%7)%7; i++){
		%>
		<td>&nbsp;</td>	
		<%
	}
	%>
</tr>
</table>
</div>

<script type="text/javascript">

function ajaxcalendar(i, id, wdate) {
	$("#mytd"+i).css("background-color", "#ff0000");
	showallcust(i, id, wdate);
}
function mout(i) {
	$("#mytd"+i).css("background-color", "#ffffff");
	$("#my"+i).hide();
}
$(document).ready(function name() {
	$("#my").html("나는 미래다");
});

function showallcust(i, id, wdate) {	
	$.ajax({
		type:"POST",
		url:"<%=application.getContextPath() %>/calendarjson.do",
		async:true,
		data:"id="+id+"&wdate="+wdate,
		success:function(msg){
			/* alert(i + " " + id + " " + wdate); */
		}
	});	
}
function ajaxwrite(i, id, wdate) {	
	$.ajax({
		type:"POST",
		url:"<%=application.getContextPath() %>/calwrite.do",
		async:true,
		data:"id="+id+"&wdate="+wdate,
		success:function(msg){
			/* alert(i + " " + id + " " + wdate); */
		}
	});	
}

</script>










