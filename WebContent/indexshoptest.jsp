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
	<br>
	<a href="shop.do?command=shoplist">매장 글 목록</a><br>
	<a href="shop.do?command=shopwriteform">매장 글 쓰기</a>
	
	<%@ include file="Fix/footer.jsp" %>
</body>
</html>