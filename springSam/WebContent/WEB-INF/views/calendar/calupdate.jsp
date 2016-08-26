<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>


      <h3 align="center">일정 수정에도 오류가 없다~~~~~~~~~~  만세~~~~~~~~~</h3>
     <hr><br> 
     

		<form name="frmForm" id="_frmForm" method="post" >
			<table class="list_table" style="width: 85%">
				<colgroup><col style="width:200"/><col style="width:auto"/></colgroup>
				
				<tbody>
					<tr>
					   <th>아이디</th>
					   <td style="text-align: left;"><input type="text" name="id" size="118" value="${caldto.id }" readonly="readonly"></td>
				    </tr>
				    <tr>
					   <th>제목</th>
					   <td style="text-align: left;"><input type="text" name="title" size="118" value="${caldto.title }"></td>
				    </tr>
				    
				    <tr>
					   <th>일정 상세내용</th>
					   <td style="text-align: left;"><textarea rows="20" cols="100" name="content" id="_content">${caldto.content }</textarea></td>
				    </tr>
				    
				    <tr>
					   <td colspan="2" align="center" style="height: 50px; text-align: center;">
                            <span class="button blue"><input type="submit" id="_btnupdate" value="수정"/></span>
                       </td>
				    </tr>
				<input type="hidden" name="seq" value="${caldto.seq }"/>
				</tbody>
			</table>
		</form>

         
     <br><hr>

<script type="text/javascript">
  $('#_btnupdate').click(function (){
	 alert('수정한겨~');
	 $('#_frmForm').attr({'target':'_self', 'action':'calupdateAf.do'}).submit();
  });
</script>