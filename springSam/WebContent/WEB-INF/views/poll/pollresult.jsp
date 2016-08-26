<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<table class="list_table" style="width: 95%;">
	<colgroup>
		<col width="200px" /><col width="500px" />
	</colgroup>
	
	<tr>
		<th>투표 번호</th>
		<td style="text-align: left">
			<input type="text" name="pollid" value="${poll.pollid }" size="50" readonly="readonly" />	
		</td>
	</tr>
	
	<tr>
		<th>아이디</th>
		<td style="text-align: left">
			<input type="text" name="id" value="${login.id }" size="50" readonly="readonly" />
		</td>
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
		<th>투표 상세 문항</th>
		<td style="text-align: left">
			
		<c:forEach items="${pollsiblist }" var="psub" varStatus="vs">
			
			<table class="list_table" style="width: 95%;">
				<col width="50" /><col width="500" />
					<tr>
						<th>${vs.count }번</th>
						<td style="text-align: left;">
							<input type="text" size="60px" readonly="readonly" value="${psub.answer }" />
						</td>
					</tr>
			</table>
		
		</c:forEach>
		
		</td>
	</tr>
	
	<tr>
		<th>투표 결과(전체 투표자 : ${poll.polltotal }명 )</th>
		<td>
			<jsp:useBean id="vbean" class="sist.co.Help.VoteBean" />
			<c:forEach items="${pollsublist }" var="psub" varStatus="vs">
			
			<jsp:setProperty property="pcount" name="vbean" value="${psub.pcount }" />
			<jsp:setProperty property="total" name="vbean" value="${poll.polltotal }" />
			
			<table class="list_table" style="width: 95%;">
				<col width="50" /><col width="500" />
					<tr>
						<th>${vs.count }번</th>
						<td style="text-align: left;">
							<jsp:getProperty property="makeBar" name="vbean"/>
						</td>
					</tr>
			</table>
			
			</c:forEach>
		</td>
		
	</tr>
	
	<tr>
		<th>차트</th>
		<td >
		<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
		</td>
	</tr>
</table>
<span class="blue button"><a href="polllist.do">돌아가기</a></span>	

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.12.4.js"></script> -->
<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '투표 결과'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: 
            	for(int i = 0; i < ${pollsublist}.size(); i++) {
            	[{
                name: '1번',
                y: 56.33
            }, {
                name: '2번',
                y: 24.03,
                sliced: true,
                selected: true
            }, {
                name: '3번',
                y: 10.38
            }, {
                name: '4번',
                y: 4.77
            }, {
                name: '5번',
                y: 0.91
            }, {
                name: '6번',
                y: 0.2
            }]
           
            }
        
        }]
    });
});
</script>
