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
	<a href="indexshoptest.jsp">매장</a>
	
	

	
	<a href="movieController?command=moiveListCate">영화</a>	
	
	<a href="onlineController?command=list">온라인</a>
	
	<a href="bookController?command=bookList">책</a>

	


	<%@ include file="Fix/footer.jsp" %>
</body>
</html>