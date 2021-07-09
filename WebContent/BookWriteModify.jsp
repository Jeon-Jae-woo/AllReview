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
	
		<div class="container"style="border:1px solid black">
	</div>
	
	<br>
	<h2>리뷰수정</h2>
	<form action="bookController" method="post">
 		<input type="hidden" name="command" value="reviewUpdate">
 		<input type="hidden" name="review_id" value="${dto.review_id }">
		<table border="1">
		<tr>
			<th>작성자</th>
			<td><input type="text" name="nickname" value="${dto.nickname}"></td>
		</tr>
		<tr>
			<th>리뷰 제목</th>
			<td><input type="text" name="title" value="${dto.review_title }" ></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><input type="text" name="date" value=${dto.rcreateat }></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="content">${dto.review_content }</textarea></td>
		</tr>
		
			
		
		<tr>
		
		
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="location.href='BookImfo.jsp'">
				
			</td>
		</tr>
			
			</table>
			</form>
			</div>
		
	<%@ include file="Fix/footer.jsp" %>

	
</body>
</html>