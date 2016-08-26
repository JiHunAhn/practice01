<%@page import="sist.co.model.SistBBSDTO" %>
<%@page import="sist.co.model.SistMemberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>


     <hr><br>
        <h2 align="center"> 부모글</h2>
            <table class="list_table" style="width: 85%">
				<colgroup><col style="width:100px"/><col style="width:auto"/></colgroup>
				
				<tbody>
					<tr>
					<th>작성자</th>
					<td style="text-align: left; size: 60;">&nbsp;${bbs.id }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td style="text-align: left; size: 60;">&nbsp;${bbs.title }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td style="text-align: left; size: 60;">&nbsp;${bbs.wdate }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td style="text-align: left;"><textarea rows="10" cols="70" name="content" readonly="readonly">${bbs.content }</textarea></td>
				</tr>
				</tbody>
			</table>
			
			 <hr><br>
            <h2 align="center"> 답글</h2>
            
            <form name="frmForm" id="_frmForm" method="post" action="">
            <input type="hidden" name="seq" value="${bbs.seq }"/>
			
			<table class="list_table" style="width: 85%">
				<colgroup><col style="width:100px"/><col style="width:auto"/></colgroup>
				<tbody>
					<tr>
					   <th>아이디</th>
					   <td style="text-align: left;"><input type="text" name="id" size="60" value="${login.id }" readonly="readonly"></td>
				    </tr>
				    
				    <tr>
					   <th>제목</th>
					   <td style="text-align: left;"><input type="text" name="title" size="60"></td>
				    </tr>
				    
				    <tr>
					   <th>내용</th>
					   <td style="text-align: left;"><textarea rows="10" cols="70" name="content" id="_content"></textarea></td>
				    </tr>
				    
				    <tr>
					   <td colspan="2" align="center" style="height: 50px; text-align: center;">
					      <span class="button blue"><button type="button"  id="_btnReply" title="답글쓰기">답글쓰기</button></span>
					    </td>
				    </tr>
				</tbody>
			</table>
		</form>
		

         
<br><hr>
<div align="center">
<a href="bbslist.do"><span class="button blue"><button type="button" >리스트로 돌아가기</button></span></a>
</div>

<script type="text/javascript">
  $("#_btnReply").click(function (){
	 alert("답~~~글!!");
	 $("#_frmForm").attr({"target":"_self", "action":"bbsreplyAf.do"}).submit();
  });
</script>




