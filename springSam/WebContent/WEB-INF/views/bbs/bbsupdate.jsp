<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>


      <h3 align="center">글수정에도 오류가 없다~~~~~~~~~~  만세~~~~~~~~~</h3>
     <hr><br>
     

		<form name="frmForm" id="_frmForm" method="post" >
			<table class="list_table" style="width: 85%">
				<colgroup><col style="width:20%"/><col style="width:80%"/></colgroup>
				
				<tbody>
					<tr>
					   <th>아이디</th>
					   <td style="text-align: left;"><input type="text" name="id" size="60" value="${bbs.id }" readonly="readonly"></td>
				    </tr>
				    
				    <tr>
					   <th>제목</th>
					   <td style="text-align: left;"><input type="text" name="title" size="60" value="${bbs.title }"></td>
				    </tr>
				    
				    <tr>
					   <th>내용</th>
					   <td style="text-align: left;"><textarea rows="10" cols="70" name="content" id="_content">${bbs.content }</textarea></td>
				    </tr>
				    
				    <tr>
					   <td colspan="2" align="center" style="height: 50px; text-align: center;">
                            <span class="button blue"><input type="submit" id="_btnupdate" value="수정"/></span>
                       </td>
				    </tr>
				<input type="hidden" name="seq" value="${bbs.seq }"/>
				</tbody>
			</table>
		</form>

         
     <br><hr>
<div align="center">
<a href="bbslist.do"><span class="button blue"><button type="button" >리스트로 돌아가기</button></span></a>
<a href="bbswrite.do"><span class="button blue"><button type="button" >글 작성하기</button></span></a>
<a href="logout.do"><span class="button blue"><button type="button" >로그아웃</button></span></a>
</div>

<script type="text/javascript">
  $('#_btnupdate').click(function (){
	 alert('수정한겨~');
	 $('#_frmForm').attr({'target':'_self', 'action':'bbsupdateAf.do'}).submit();
  });
</script>