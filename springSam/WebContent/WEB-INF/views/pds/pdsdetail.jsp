<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<fmt:requestEncoding value="utf-8"/>

<form name="frmForm" id="_frmForm" action="" method="post" enctype="multipart/form-data">
  <table class="list_table" style="width: 85%">
     <colgroup><col style="width:100px"/><col style="width:auto"/>  </colgroup>
     <tr>
        <th>작성자</th>
        <td style="text-align: left;">
           <input type="text" name="id" readonly="readonly" size="108" value="${pds.id }">   
        </td>
     </tr>
     
     <tr>
        <th>제목</th>
        <td style="text-align: left;">
           <input type="text" name="title" size="108" readonly="readonly" value="${pds.title }"/>   
        </td>
     </tr> 
     
     <tr>
        <th>조회수</th>
        <td style="text-align: left;">
           <input type="text" name="readcount" size="108" readonly="readonly" value="${pds.readcount }"/>   
        </td>
     </tr>         
     
      <tr>
        <th>파일 다운로드</th>
        <td style="text-align: left;">
          <input type="text" name="download" size="96" readonly="readonly" value="${pds.filename }"/> 
          <span class="button blue"><input type="button" name="btnDown2" value="다운로드" onclick="filedowns('${pds.filename }' , '${pds.seq }')"></span>
        </td>
     </tr>  
     
     <tr>
        <th>다운수</th>
        <td style="text-align: left;">
           <input type="text" name="downcount" size="108" readonly="readonly" value="${pds.downcount }" />   
        </td>
     </tr>
      
      <tr>
        <th>내용</th>
        <td style="text-align: left;">
           <textarea rows="10" cols="91" name="content" id="_content" readonly="readonly" style="resize: none;">${pds.content }</textarea>
        </td>
     </tr>   

  </table>


<div align="center">
  <c:if test="${login.id eq pds.id }">
    <span class="button blue"><input type="submit"  id="_btnupdate" value="수정하기"/></span>
   <span class="button blue"><input type="button" name="btnDel" value="삭제" data-attache_file_name="${pds.seq }" class="btn_fileDelete"/></span>
  </c:if>

<a href="pdslist.do"><span class="button blue"><button type="button" >리스트로 돌아가기</button></span></a>
<span class="button blue"><button type="button"  id="_btnADD">글 작성하기</button></span></a>
<a href="logout.do"><span class="button blue"><button type="button" >로그아웃</button></span></a>
</div>
 </form>


<form name="delfileup" action="fileDownload.do" method="post">
	<input type="hidden" name="filename"/>
	<input type="hidden" name="seq"/>
</form>

<form name="frmForm2" id="_frmForm2" action="" method="post">
	<input type="hidden" id="_seq" name="seq"/>
</form>

<script type="text/javascript">

function filedowns(filename, seq){
	  alert("파일 다운" +filename+"&"+seq);
	  var doc = document.delfileup;
	  doc.filename.value = filename;
	  doc.seq.value = seq;
	  doc.submit();
	
}

$("#_btnADD").click(function name() {
	alert('불법 자료는 대환영~');
	$("#_frmForm").attr({"target":"_self", "action":"pdswrite.do"}).submit();
	
});

$("#_btnupdate").click(function name() {
	  if(window.confirm("진짜로 수정?")){
		  $("#_frmForm").attr({"target":"_self", "action":"pdsupdate.do?seq=${pds.seq }"}).submit();
	  }
	
});


$(".btn_fileDelete").click(function (){
  if(window.confirm("진짜?")){
	 $("#_seq").val($(this).attr("data-attache_file_name"));
	 $("#_frmForm2").attr({"action":"pdsdel.do"}).submit();	 
	 
 } 
});

</script>