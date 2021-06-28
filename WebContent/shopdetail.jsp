<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<style type="text/css">
.detailtb{
	margin-left: 50px;
	margin-right: 50px;
}

</style>
</head>
<body>
<header ><%@ include file="Fix/header.jsp" %></header>

	
	<div class="detailtb">
	<table class="table table-bordered">
	<tr>
	<th width="10%" align="center">
		제목
	</th>
	<th>
		제목칸
	</th>
	<tr>
		<td colspan="2">
			<img src="img/J.png">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="10" cols="30" readonly="readonly"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			별점칸
		</td>
	</tr>
		
	<tr>
		<td colspan="2">
			재방문/추천 그룹칸
		</td>
	</tr>
	<tr>
		<td colspan="2">지도
		<img src="img/J.png">
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="button" value="수정">
		<input type="button" value="삭제">
		<input type="button" value="목록">
		</td>
	</tr>
	
	
	
	</table>
</div>


<footer ><%@ include file="Fix/footer.jsp" %></footer>
</body>
</html>