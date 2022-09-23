<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Title</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>

<c:forEach items="${category}" var="category" >
<c:out value="${category.category_name}"></c:out>
</c:forEach>

<h2>${category[0].category_name}</h2>
 

<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
</body>