<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	form>button{
		border-radius:20%;
		float:right;
		
	}
	
	.content{
		width:100%;
		height:200px;
		background-color: gray
	}

</style>
</head>

<body>
	<%@ include file="Fix/header.jsp" %>

	
	<br>
	
	
	
	
	<div class="container text-center">
	
	<section class="content">
	
	<button>매장</button>
	<button>의류</button>
	<button>영화</button>
	<button>도서</button>
	
	</section>
	
	<br>
	<br>
	
	
	
	<img src="images/midnight.jpg"  style="width:120pt; height:120pt;" onclick="location.href='BookImfo.jsp'"> 
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt"><br>
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt">
	
	</div>
	
	<%@ include file="Fix/footer.jsp" %>
	
</body>

	
</html>