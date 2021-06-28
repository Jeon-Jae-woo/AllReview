<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<link rel="stylesheet" type="text/css" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<style type="text/css">
.catetb{
	margin-right: 200px;

}

</style>
</head>
<body>
	<header ><%@ include file="Fix/header.jsp" %></header>
	
	
	
	
	
	<div align="center">
	<input class="btn btn-default" type="submit" value="Submit">
	<form action="" method="post">
	<input type="search" class="form-inline" placeholder="검색">
	</form>
	</div>
	<br>
	<div class="catetb">
	<table class="table">
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td>---리뷰 없음---</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:forEach begin="1" end="4">
				<tr>
				<c:forEach var="dto" items="${list }" begin="1" end="4">
			
					<td>
						<img src="img/J.png" class="img-responsive" alt="Responsive image" onclick="location.href='shop.do?command=detail'">
						<a href="shop.do?command=detail">dto.current.title</a>
						<div></div>
					</td>
					<td>
						<img src="img/J.png" class="img-responsive" alt="Responsive image" onclick="location.href='shop.do?command=detail'">
						<a href="shop.do?command=detail">dto.current.title</a>
						<div></div>
					</td>
					<td>
						<img src="img/J.png" class="img-responsive" alt="Responsive image" onclick="location.href='shop.do?command=detail'">
						<a href="shop.do?command=detail">dto.current.title</a>
						<div></div>
					</td>
					<td>
						<img src="img/J.png" class="img-responsive" alt="Responsive image" onclick="location.href='shop.do?command=detail'">
						<a href="shop.do?command=detail">dto.current.title</a>
						<div></div>
					</td>

				</c:forEach>
				</tr>
			</c:forEach>
			</c:otherwise>
		
		
		</c:choose>
		
		
	</table>
	</div>
	
	
	
	<div align="center">
	<input type="button" value="prev">
	<a>현재페이지</a>
	<input type="button" value="next">
	
	</div>
	
	
	<footer ><%@ include file="Fix/footer.jsp" %></footer>
</body>
</html>