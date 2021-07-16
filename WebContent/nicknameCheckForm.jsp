<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>          
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String nickname = request.getParameter("nickname"); %>
<% int result = Integer.parseInt(request.getParameter("result")); %>

<script type="text/javascript">
	function nicknameTrue(){
		opener.document.getElementById("nickname").readOnly = true;
		opener.document.getElementById("checknickname").value = "true";
		window.close();
	}
	
	function nicknameFalse(){
		window.close();
	}
</script>

</head>
<body>
<% if(result==0){ %>
	<div class="container text-center">
	<h1>사용할 수 있는 별명입니다</h1>
	<input type="button" class="btn btn-success" onclick="nicknameTrue()" value="확인">
	</div>

<% }else{ %>
	<div class="container text-center">
	<h1>사용할 수 없는 별명입니다</h1>
	<input type="button" class="btn btn-warning" onclick="nicknameFalse()" value="확인">
	</div>
<% } %>
</body>
</html>