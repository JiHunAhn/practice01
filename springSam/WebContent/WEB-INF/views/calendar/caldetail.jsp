<%@page import="sist.co.model.SistCalendar" %>
<%@page import="sist.co.model.SistMemberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>


     <h3> cal디테일도 오류가 없다~~~~~</h3>
     <hr><br>
     
       	<form name="frmForm" id="_frmForm" method="post" action="">
			<table class="list_table" style="width: 85%">
				<colgroup><col style="width:200"/><col style="width:auto"/></colgroup>
				
				<tbody>
				<tr>
					<th>아이디</th>
					<td style="text-align: left;">&nbsp;${caldto.id }</td>
				</tr>
				<tr>
					<th>일정</th>
					<td style="text-align: left;">&nbsp;${wdate } </td>
				</tr>
				<tr>
					<th>제목</th>
					<td style="text-align: left; size: 118;">&nbsp;${caldto.title }</td>
				</tr>
				<tr>
					<th>일정 상세내용</th>
					<td style="text-align: left;"><textarea rows="20" cols="100" name="content" readonly="readonly">${caldto.content }</textarea></td>
				</tr>
				<input type="hidden" name="seq" value="${caldto.seq }"/>
				</tbody>
			</table>
		
       
         
     <br><hr>
<div align="center">
    <span class="button blue"><input type="submit"  id="_btnupdate" value="수정하기"/></span>
    <span class="button blue"><button type="button"  id="_btndelete">삭제</button></span>
  
 </form>
 <span class="blue button"><a href="${urls }">일정보기</a></span>
 
 <script type="text/javascript">
 $('#_btnupdate').click(function(){
	alert('일정 수정~');
	$('#_frmForm').attr('target', '_self').attr('action', 'calupdate.do').submit();
	});
 
 $('#_btndelete').click(function(){
	alert('일정 삭제~');
	$('#_frmForm').attr('target', '_self').attr('action', 'caldelete.do').submit();
	});

 </script>

