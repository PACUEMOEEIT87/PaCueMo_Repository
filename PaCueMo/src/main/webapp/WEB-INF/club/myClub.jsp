﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
		  <%--insert css here--%>
		  <%--@import url('');--%>
	</style>
	<script>
		  <%--insert JScript here--%>
		  <%--<script src=""></script>--%>
	</script>
  </head>
  <body>
  <jsp:include page="/fragment/top.jsp"/>
  <jsp:include page="sidebar.jsp"/>
      <h1>你的社團</h1>
      <h1>${sessionScope.MyClub.clubName}</h1>
       <c:if test="${sessionScope.memberId == sessionScope.MyClub.clubHead}">
      
      <h1>你是團長</h1>
      </c:if> 
  </body>
</html>
