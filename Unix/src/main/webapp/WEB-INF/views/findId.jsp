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

        
               
                    
	<div class="jumbotron">
	  <h2>아이디는: ${member.user_id} 입니다</h2>
	  <button type="button" onclick="location.href='/'">메인페이지</button>
	</div>

<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
</body>
</html>