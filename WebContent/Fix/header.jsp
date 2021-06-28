<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--<link rel="stylesheet" href="resources/bootstrap-3.3.2-dist/css/bootstrap.css"> -->
<!--<script type="text/javascript" src="resources/bootstrap-3.3.2-dist/js/bootstrap.js"></script>-->


</head>
<body>
<!-- 임시 헤더  , 수정 필요 -->
<nav class="navbar navbar-default" style="height:80px">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
      </button>
      <a class="navbar-brand" href="../index.jsp">ALLREVIEW</a>
    </div>
	<!-- 일단 링크를 사용  -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">  
      <ul class="nav navbar-nav navbar-right">
      	<li><button type="button" class="btn btn-default" onclick="location.href='User/join.jsp'">회원가입</button></li>
      	<li><button type="button" class="btn btn-default" onclick="location.href='User/login.jsp'">로그인</button></li>
      	<li><button type="button" class="btn btn-default" onclick="location.href='User/mypageInfo.jsp'">마이페이지</button></li>
      	<li><button type="button" class="btn btn-default" onclick="location.href='Admin/adminMain.jsp'">관리자페이지</button></li>
      </ul>
    </div>
  </div>
</nav>

</body>
</html>