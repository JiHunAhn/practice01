<%@ page import="sist.co.Help.myCal"%>
<%@ page import="sist.co.model.SistCalendar"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Calendar"%>
<%@page import="org.apache.tools.ant.types.resources.First"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8"); %>

<style>
table{  border-collapse: collapse; }
table, td, th{ border: 1px solid black; }

td.sunday a { color: red;}
td.satday a { color: blue;}
td.otherday a { color: black;}

.sunday{ color: red; text-align: left; vertical-align: top; }
.satday{ color: blue; text-align: left; vertical-align: top; }
.otherday{ color: black; text-align: left; vertical-align: top; }
.days2{ font-size:20px;  color: white; text-align: center; vertical-align: middle; }
.days3{ font-size:20px;  color: white; text-align: center; vertical-align: middle; background-color: #4d6bb3; line-height: 1em; font-weight: normal; }
.innerTable { border: 0px; }
</style>

<%!
//callist 연결 메소드-해당하는 년도, 월, 일에 맞는 callist.do 링크를 걸기
public String callist(int year, int month, int day){
	String s ="";
	s+=String.format("<a href='%s?year=%d&month=%d&day=%d'>", "callist.do", year, month, day);
	s+=String.format("%2d", day);
	s+="</a>";
	
	return s;
}

//일정쓰기 링크 펜 사진으로 만들기
public String showpen(int year, int month, int day){
	String s ="";
	String url = "calwrite.do";
	String image = "<img src = 'image/pen.png' width=15px, height=15px/>";
	s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", url, year, month, day, image);
	
	return s;
}

//1일 -> 01일 로 나타나게 만드는 메소드
public String two(String msg){
	return msg.trim().length()<2 ? "0"+msg : msg.trim();
}

//달력에 제목이 10자 이상이면 그 뒤를 ...로 줄이는 메소드
public String dot10(String msg){
	String s ="";
	if(msg.length()>=10){
		s=msg.substring(0, 10);
		s+= "...";
	}else{
		s=msg.trim();
	}
	return s;
}

//테이블 만들기 메소드(calwrite 랑 callist 연결되게)
public String makeTable(int year, int month, int day, List<SistCalendar> lcdtos){
	//20160701 이렇게 년도 월 일을 하나의 String에 저장
	String dates=(year+"")+two(month+"")+two(day+"");
	
	String s = "";
	s= "<table>";
	s+= "<col width='100px'/>";
	
	//rdate에 맞춰서 해당하는 일정이 있으면 일정의 제목이 나타나게 하기
	for(SistCalendar lcd:lcdtos){
		//radate에서 년월일에 해당하는 dates가 같을 경우에 caldetail에 연결하게
		if(lcd.getWdate().substring(0, 8).equals(dates)){
			s+="<tr bgcolor='LightSteelBlue'>";
			s+="<td>";
			//caldetail에 연결할때 seq 정보를 넘기게 하기
			s+="<a href='caldetail.do?seq="+lcd.getSeq()+"'>";
			s+="<font style='font-size:12px; color:#090000;'>";
			//제목 길면 줄이는 메소드에 제목 적용
			s+=dot10(lcd.getTitle());
			s+="</font>";
			s+="</a>";
			s+="</td>";
			s+="</tr>";
		}
	}
	s+="</table>";
	return s;
}
%>

<%
List<SistCalendar> list = new ArrayList<SistCalendar>();
Object Oflist = request.getAttribute("flist");
if(Oflist != null){
	list= (List<SistCalendar>)Oflist;
}

myCal jcal = (myCal)request.getAttribute("jcal");

int dayOfWeek = jcal.getDayOfweek();
int lastDayOfMonth = jcal.getLastDay();
int year = jcal.getYear();
int month = jcal.getMonth();

//이미지로 년도 월 바꾸기
//년도 바꾸기
String pp = String.format("<a href='./%s?year=%d&month=%d'><img src='image/left.gif'></a>", "calendar.do", year-1, month);
String nn = String.format("<a href='./%s?year=%d&month=%d'><img src='image/last.gif'></a>", "calendar.do", year+1, month);

//월 바꾸기
String p = String.format("<a href='./%s?year=%d&month=%d'><img src='image/prec.gif'></a>", "calendar.do", year, month-1);
String n = String.format("<a href='./%s?year=%d&month=%d'><img src='image/next.gif'></a>", "calendar.do", year, month+1);

//월별 일정구하기
String url = String.format("%s?year=%s&month=%s", "calendar3.do", year, month);

%>

<div style="text-align: left;">
   <a href='<%=url %>'>
      <%=year+"년"+month+"월" %>일정보기
   </a>
</div>

<div class="box_border" style="margin-top: 5px; margin-bottom: 10px;">
    <table style="width: 85%;">
       <col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/>
       
       <thead>
       <tr height="50">
	     <td colspan="7" class="days2">
		   <%=pp %><%=p %>	
		   <font color="blue" style="font-size:20;">
		       <!-- year 값과 month값을 %d년&nbsp;&nbsp;%d월 이 포멧에 맞춰 나타나게 한다. -->
			   <%=String.format("%d년&nbsp;%d월", year, month)%>
		    </font>
		    <%=n %><%=nn %>
	     </td>
       </tr>


		<tr height="100">
			<th class="days3">일</th>
			<th class="days3">월</th>
			<th class="days3">화</th>
			<th class="days3">수</th>
			<th class="days3">목</th>
			<th class="days3">금</th>
			<th class="days3">토</th>
		</tr>
		</thead>

		<tr height="100" align="left" valign="top">
			<%
				//1일 전에 칸들을 빈칸 처리하기
				for (int i = 1; i < dayOfWeek; i++) {
			%>
			<td>&nbsp;</td>
			<%
				}
				
			    for (int i = 1; i <= lastDayOfMonth; i++) {
			    	String hhh = String.format("<a href='%s?year=%d&month=%d&day=%d'>"+
			                                             "<img src='image/pen.gif' alt='write'/></a>",
			                                             "calwrite.do", year, month, i);
			    	
			    	if((i+dayOfWeek-1)%7==0){//토요일 일때
			     	%>	
			    		<td class="satday">&nbsp;<%=callist(year,month,i) %>&nbsp; <%=showpen(year, month, i) %>
			    		<%=makeTable(year, month, i, list) %>
			    		</td>
			    	<%	
			    	}else if((i+dayOfWeek-1)%7==1){//일요일 일때
			    	%>
			    	   <td class="sunday">&nbsp;<%=callist(year,month,i) %>&nbsp; <%=showpen(year, month, i) %>
			    		<%=makeTable(year, month, i, list) %>
			    	   </td>
			    	<%	
			    	}else{
			    	%>
			    	    <td class="otherday">&nbsp;<%=callist(year,month,i) %>&nbsp; <%=showpen(year, month, i) %>
			    		<%=makeTable(year, month, i, list) %>
			    		</td>
			    	<%	
			    	}
			    	if((i+dayOfWeek-1)%7==0){
			    		%>
			    		</tr><tr height="100px">
			    		<%
			    	}
			    }
			
				for (int i = 0; i < (7 - (dayOfWeek + lastDayOfMonth - 1) % 7) % 7; i++) {
			%>
			<td>&nbsp;</td>
			<%
				}
			%>
		</tr>

	</table>
</div>

<br><hr>
<div class="box_border" style="margin-top: 5px; margin-bottom: 10px;">
   <form name="frmForm1" id="_frmFormSearch" method="post" action="" >
      <table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px; padding: 0;">
         <tr>
            <td>검색:</td>
            <td style="padding-left: 5px;">
                <select id="_s_category" name="s_category">
                      <option value="" selected="selected">선택</option>
                      <option value="title">제목</option>
                      <option value="contents">내용</option>
                </select>
            </td>
            
            <td style="padding-left: 5px;">
                <input type="text" id="_s_keyword" name="s_keyword" value='${s_keyword }' />
                <input type="hidden" id="id" name="id" value='${login.id }' />
            </td>
            
            <td style="padding-left: 5px;">
                <span class="button blue">
                  <button type="button" id="_btnSearch">검색</button>
                </span>
            </td>
          </tr>
       </table>
   </form>
</div>

<script type="text/javascript">
$('#_btnSearch').click(function() {
	$('#_frmFormSearch').attr({'target':'_self', 'action':'calget.do'}).submit();
});
</script>
