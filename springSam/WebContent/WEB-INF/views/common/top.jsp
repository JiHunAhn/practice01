<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri= "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="<%=request.getContextPath()%>/js.go_url.js"></script>


<jsp:useBean id="nows" class="java.util.Date"/>

<div style="width: 100%;  height: 53px; border-bottom: 1px solid #5e5e5e;">
   <div style="width: 100%;  height: 100%; clear: both; display: inline-block;">
       <div id="_title_image" style="width: 30%; float: left; display: inline;">
            <img src="image/12.jpg" style="height: 53px; width:250px;" alt="로고엑박"/>
       </div>
       
       <div id="_title_today" style="width: 70%; float: left; text-align: right;">
            <div style="position: relative; top: 27px;">
            
              <c:if test="${login.id ne ' ' }">
                <a href="#none" onclick="url_logout();" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
              </c:if>
            
              <c:if test="${login.name ne ' ' }">
                [${login.name }]&nbsp;&nbsp;&nbsp;
              </c:if>

               <fmt:formatDate var="now" value="${nows }" pattern="yyyy/MM/dd"/>${now }
            </div>
       </div>   
   </div>
</div>  