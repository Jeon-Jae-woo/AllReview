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
	
	
	<!-- admin 페이지 작업을 위해서 임시로 만들어놓은 form 입니다 -->	
	<form method="get" action="userController">
		<input type="hidden" name="email" value="jaewoo68@naver.com">
		<input type="hidden" name="levelNo" value="1">
		<input type="hidden" name="command" value="adminLevelUpdate">
		<input type="submit">
	</form>
	
<<<<<<< HEAD
	<a href="MovieController?command=moiveListCate">영화</a>	
	
=======
	<h1><%= session.getAttribute("level")  %></h1>
		
		
>>>>>>> d51ff8e518357cae67ee3b49f2a4df6a0669870d
	<%@ include file="Fix/footer.jsp" %>
</body>
</html>