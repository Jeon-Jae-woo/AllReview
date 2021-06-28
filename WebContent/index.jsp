<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 임시 index -->
	<%@ include file="Fix/header.jsp" %>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
	<input type="button" value="테스트" onclick="location.href='userController?command=test'">
	<input type="button" value="테스트2" onclick="location.href='shopcontroller?command=test2'">
	
	
	<%@ include file="Fix/footer.jsp" %>
</body>
</html>