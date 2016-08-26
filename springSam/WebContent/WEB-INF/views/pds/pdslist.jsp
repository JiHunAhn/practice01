<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<table class="list_table" style="width:85%;">
   <colgroup>
      <col width="50"/><col width="70"/><col width="300"/><col width="50"/><col width="40"/><col width="40"/><col width="100"/><col width="40"/>
   </colgroup>
   
   <thead>
      <th>번호</th><th>작성자</th><th>제목</th><th>다운로드</th><th>조회수</th><th>다운수</th><th>작성일</th><th>삭제</th>
   </thead>
   
   <c:if test="${empty pdslist }">
          <tr><td colspan="8">자료가 읎어서 햄보칼수가업서!</td></tr>
  </c:if>
   
   <c:forEach var ="pds" items="${pdslist }" varStatus="pdsS">
        <tr class="_hover_tr">
           <td>${pdsS.count }</td>
           <td>${pds.id }</td>
           <td style="text-align: left"><a href='pdsdetail.do?seq=${pds.seq }'>&nbsp;${pds.title }</a></td>
           <td>
               <span class="button blue">
                  <input type="button" name="btnDown2" value="다운로드" onclick="fileDownload('${pds.filename }' , '${pds.seq }')">
               </span>

           </td>
           <td>${pds.readcount }</td>
           <td>${pds.downcount }</td>
           <td><font size="2">${pds.regidate }</font></td>
           <td>
               <c:if test="${login.id eq pds.id }">
                  <span class="button blue"><input type="button" name="btnDel" value="삭제" data-attache_file_name="${pds.seq }" class="btn_fileDelete"/></span>
               </c:if>
               
               <c:if test="${login.id ne pds.id }">
                  불가
               </c:if>
           </td>
        </tr>      
   
   </c:forEach>

</table>

<form name="frmForm" id="_frmForm" method="get" action="">
</form>

<form name="delfileup" action="fileDownload.do" method="post">
	<input type="hidden" name="filename"/>
	<input type="hidden" name="seq"/>
</form>

<form name="frmForm2" id="_frmForm2" action="" method="post">
	<input type="hidden" id="_seq" name="seq"/>
</form>

<hr><br>
<div id="button_wrap">
   <span class="button blue"><button type="button" id="_btnADD">자료 올리기</button> </span>
</div>

<script type="text/javascript">

  function fileDownload(filename, seq){
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

 
  $(".btn_fileDelete").click(function (){
	  if(window.confirm("진짜로 삭제?")){
		 $("#_seq").val($(this).attr("data-attache_file_name"));
		 $("#_frmForm2").attr({"action":"pdsdel.do"}).submit();	 
		 
	 } 
  });
</script>