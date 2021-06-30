<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<% String email = request.getParameter("email"); %>
<% int status = Integer.parseInt(request.getParameter("result")); %>

<script type="text/javascript">
	function emailTrue(){
		opener.document.getElementById("email").readOnly = true;
		opener.document.getElementById("checkemail").value = "true";
		window.close();
	}
	
	function emailFalse(){
		window.close();
	}
</script>

</head>
<body>

<% if(status==0){ %>
	<h1>사용할 수 있는 이메일 입니다</h1>
	<h2><%= email %></h2>
	<input type="button" value="확인" onclick="emailTrue();">
<% }else{ %>
	<h1>사용할 수 없는 이메일 입니다</h1>
	<h2><%= email %></h2>
	<input type="button" value="확인" onclick="emailFalse()">
<% } %>

</body>
</html>