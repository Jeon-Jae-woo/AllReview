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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	<div class="container text-center">
	<h1>사용 가능한 이메일 입니다</h1>
	<input type="button" class="btn btn-success" value="확인" onclick="emailTrue();">
	</div>
<% }else{ %>
	<div class="container text-center">
	<h1>사용할 수 없는 이메일 입니다</h1>
	<input type="button" class="btn btn-warning" value="확인" onclick="emailFalse()">
	</div>
<% } %>

</body>
</html>