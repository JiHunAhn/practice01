<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

      <h3 align="center"> 니 필력 좀 보자</h3>
     <hr><br>

		<form name="frmForm" id="_frmForm" method="post" >
			<table class="list_table" style="width: 85%">
				<colgroup><col style="width:20%"/><col style="width:80%"/></colgroup>
				
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
					       <span>
					          <a href="#none" id="_btnLogin" title="글쓰기">
					               <span class="button blue"><button type="button" id="#_btnLogin">글쓰기</button></span>
					          </a>
					       </span> 
					    </td>
				    </tr>
				
				</tbody>
			</table>
		</form>


<script type="text/javascript">
  $('#_btnLogin').click(function (){
	 alert("이것도 글이라고~");
	 $('#_frmForm').attr({'target':'_self', 'action':'bbswriteAf.do'}).submit();
  });
</script>




