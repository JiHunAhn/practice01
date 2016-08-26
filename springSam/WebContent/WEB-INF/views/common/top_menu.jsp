<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri= "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<div id="top_menu_wrap">
   <div id="_top_menu">
       <ul class="navi">
       <c:if test="${login.auth eq '3' }">
            <li><a href="bbslist.do" title="HOME">HOME</a></li>
            <li><a href="bbslist.do" title="답변형게시판">답변형게시판</a></li>
            <li><a href="calendar.do" title="일정관리">일정관리</a></li>
            <li><a href="calendar2.do" title="일정관리">Ajax일정관리</a></li>
            <li><a href="pdslist.do" title="자료실">자료실</a></li>
            <li><a href="polllist.do" title="투표">투표하기</a></li>
            </c:if>
            <c:if test="${login.auth eq '1' }">
              <li><a href="bbslist.do" title="HOME">HOME</a></li>
              <li><a href="bbslist.do" title="답변형게시판">답변형게시판</a></li>
              <li><a href="calendar.do" title="일정관리">일정관리</a></li>
              <li><a href="calendar2.do" title="일정관리">Ajax일정관리</a></li>
              <li><a href="pdslist.do" title="자료실">자료실</a></li>
              <li><a href="polllist.do" title="투표">투표하기</a></li>
              <li><a href="pollmake.do" title="투표만들기">투표만들기</a></li>
            </c:if>
            
       </ul>
   </div>
</div>