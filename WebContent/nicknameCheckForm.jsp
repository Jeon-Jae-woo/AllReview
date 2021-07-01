<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>          
<!DOCTYPE html>
<html>
<head>
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
	<h1>사용할 수 있는 별명입니다</h1>
	<h2><%=nickname %></h2>
	<input type="button" onclick="nicknameTrue()" value="확인">

<% }else{ %>
	<h1>사용할 수 없는 별명입니다</h1>
	<h2><%=nickname %></h2>
	<input type="button" onclick="nicknameFalse()" value="확인">

<% } %>
</body>
</html>