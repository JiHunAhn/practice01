<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<fmt:requestEncoding value="utf-8"/>

<form name="frmForm" id="_frmForm" action="pdsupdateAf.do" method="post" enctype="multipart/form-data">
  <table class="list_table" style="width: 85%">
     <colgroup><col style="width:100px"/><col style="width:auto"/>  </colgroup>
     <tr>
        <th>아이디</th>
        <td style="text-align: left;">
           <input type="text" name="id" readonly="readonly" size="108" value="${pds.id }">   
        </td>
     </tr>
     
     <tr>
        <th>제목</th>
        <td style="text-align: left;">
           <input type="text" name="title" size="108" value="${pds.title }"/>   
        </td>
     </tr>     
     
     <tr>
        <th>파일 업로드</th>
        <td style="text-align: left;">
           <input type="text" name="namefile" size="30" readonly="readonly" value="${pds.filename }"/> 
           <span class="button blue"><input type="button" name="btnDown2" value="다운로드" onclick="filedowns('${pds.filename }' , '${pds.seq }')"></span>
           <input type="file" name="fileload"  style="width:53%;"/>   
        </td>
     </tr>  
     
     
      
      <tr>
        <th>내용</th>
        <td style="text-align: left;">
           <textarea rows="10" cols="91" name="content" id="_content" style="resize: none;">${pds.content }</textarea>
        </td>
     </tr>   
  
      <tr>
        <input type="hidden" name="seq" value="${pds.seq }"/>   
        <td colspan="2"  style="text-align: center; height: 50px;">
           <span class="blue button">
              <a href=#none" id="_btnUpload" title="수정">수정</a>
           </span>
           
           
        </td>
     </tr>   
  </table>

</form>

<form name="delfileup" action="fileDownload.do" method="post">
	<input type="hidden" name="filename"/>
	<input type="hidden" name="seq"/>
</form>

<script type="text/javascript">
$('#_btnUpload').click(function(){
	$("#_frmForm").attr({"target":"_self", "action":"pdsupdateAf.do"}).submit();
	});
	
function filedowns(filename, seq){
	  alert("파일 다운" +filename+"&"+seq);
	  var doc = document.delfileup;
	  doc.filename.value = filename;
	  doc.seq.value = seq;
	  doc.submit();
	
}
</script>