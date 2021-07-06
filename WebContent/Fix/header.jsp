<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


</head>
<body>
<!-- 임시 헤더  , 수정 필요 -->
	<% if(session.getAttribute("email")==null){ %>
		
	<%	}else{
		String email = (String)session.getAttribute("email");	
		String nickname = (String)session.getAttribute("nickname");
		Integer level = (Integer)session.getAttribute("level");
		%>
	
	<% } %>
<nav class="navbar navbar-default" style="height:80px">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
      </button>
      <a class="navbar-brand" href="index.jsp">ALLREVIEW</a>
    </div>
	<!-- 일단 링크를 사용  -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">  
      <ul class="nav navbar-nav navbar-right">
      	<% if(session.getAttribute("email")==null){ %>
			<li><button type="button" class="btn btn-default" onclick="location.href='join.jsp'">회원가입</button></li>
      		<li><button type="button" class="btn btn-default" onclick="location.href='login.jsp'">로그인</button></li>
		<%	}else{ %>
			<li>
				<form action="userController" method="get">
				<input type="submit" class="btn btn-default" value="로그아웃">
				<input type="hidden" name="command" value="logout">
				</form>
			</li>
			<li><button type="button" class="btn btn-default" onclick="location.href='userController?command=mypageInfo'">마이페이지</button></li>
		<% } %>
		<% if(session.getAttribute("email")!=null){
			if((Integer)session.getAttribute("level") == 1 || (Integer)session.getAttribute("level") == 2) {%>
      			<li><button type="button" class="btn btn-default" onclick="location.href='adminController?command=userList'">관리자페이지</button></li>
      	<% 		} 
			}%>
	
      </ul>
    </div>
  </div>
</nav>

</body>
</html>