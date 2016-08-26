<%@page import="sist.co.model.SistBBSDTO" %>
<%@page import="sist.co.model.SistMemberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>


     <h3>디테일도 오류가 없다~~~~~</h3>
     <hr><br>
     
       	<form name="frmForm" id="_frmForm" method="post" action="">
			<table class="list_table" style="width: 85%">
				<colgroup><col style="width:100px"/><col style="width:auto"/></colgroup>
				
				<tbody>
					<tr>
					<th>작성자</th>
					<td style="text-align: left; size: 60;">&nbsp;${rbbs.id }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td style="text-align: left; size: 60;">&nbsp;${rbbs.title }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td style="text-align: left; size: 60;">&nbsp;${rbbs.wdate }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td style="text-align: left; size: 60;">&nbsp;${rbbs.readcount }</td>
				</tr>
				<tr>
					<th>정보</th>
					<td style="text-align: left; size: 60;">&nbsp;${rbbs.ref }-${rbbs.step }-${rbbs.depth }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td style="text-align: left;"><textarea rows="10" cols="70" name="content" readonly="readonly">${rbbs.content }</textarea></td>
				</tr>
				<input type="hidden" name="seq" value="${rbbs.seq }"/>
				</tbody>
			</table>
		
       
         
     <br><hr>
<div align="center">
  <c:if test="${login.id eq rbbs.id }">
    <span class="button blue"><input type="submit"  id="_btnupdate" value="수정하기"/></span>
    <span class="button blue"><button type="button"  id="_btndelete">삭제</button></span>
  </c:if>
  
<span class="button blue"><button type="button"  id="_btnReply">답글쓰기</button></span>
<a href="bbslist.do"><span class="button blue"><button type="button" >리스트로 돌아가기</button></span></a>
<a href="bbswrite.do"><span class="button blue"><button type="button" >글 작성하기</button></span></a>
<a href="logout.do"><span class="button blue"><button type="button" >로그아웃</button></span></a>
</div>
 </form>
 
 <script type="text/javascript">
 $('#_btnupdate').click(function(){
	alert('글 수정~');
	$('#_frmForm').attr('target', '_self').attr('action', 'bbsupdate.do').submit();
	});
 
 $('#_btndelete').click(function(){
	alert('글 삭제~');
	$('#_frmForm').attr('target', '_self').attr('action', 'bbsdelete.do').submit();
	});
 
 
 
 $('#_btnReply').click(function(){
		alert('답글 작성~');
		$('#_frmForm').attr('target', '_self').attr('action', 'bbsreply.do').submit();
		});
 </script>
 
