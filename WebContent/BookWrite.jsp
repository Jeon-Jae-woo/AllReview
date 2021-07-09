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
	

	
	<div class="container text-center">
	
	<section class="content">
	
	<button>매장</button>
	<button>의류</button>
	<button>영화</button>
	<button>도서</button>
	
	</section>
	
	<br>
	<h2>리뷰등록</h2>
	<form action="bookController" method="post">
 		<input type="hidden" name="command" value="reviewWrite">
 		<input type="hidden" name="book_id" value="${book_id }">
		<table border="1">
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" value="${nickname }"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="content"></textarea></td>
		</tr>
		<tr>
		<th>이미지</th>
		<td><input type="text" name="review_img"><td>
		</tr>
		<tr>
		<th>평점</th>
		<td><input type="text" name="book_grade"><td>
		</tr>
		
			
		
		<tr>
		
		
			<td colspan="2">
				<input type="submit" value="등록">
				<input type="button" value="목록" onclick="location.href='BookImfo.jsp'">
				
			</td>
		</tr>
			
			</table>
			</form>
			</div>
		
	<%@ include file="Fix/footer.jsp" %>

	
</body>
</html>