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
	<th width="65%">
		[${catedto.cateName }] ${dto.title }
	</th>
	<th width="10%">
		작성일/수정일
	</th>
	<th width="15%">
		${dto.createat }/${dto.updateat }
	</th>
	</tr>
	<tr>
		<td colspan="4">
			<img src="img/J.png">
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<textarea rows="10" cols="80" readonly="readonly">${dto.content }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			서비스 : ${dto.service }<br>
			청결 : ${dto.clean }<br>
			교통 : ${dto.traffic }
		</td>
	</tr>
		
	<tr>
		<td colspan="2">
			재방문 : ${(dto.revisit == 'Y')?"O":"X"}<br>
			추천그룹 : ${groupdto.groupName }
			
		</td>
	</tr>
	<tr>
		<td colspan="4">지도
		<img src="img/J.png">
		</td>
	</tr>
	<tr>
		<td colspan="4">
		<input type="button" value="삭제" onclick="location.href='shop.do?command=shopdelete&shopno=${dto.shopno}'">
		<input type="button" value="수정" onclick="location.href='shop.do?command=shopupdateform&shopno=${dto.shopno}'">
		<input type="button" value="목록" onclick="location.href='shop.do?command=shoplist'">
		</td>
	</tr>
	
	
	
	</table>
</div>


<footer ><%@ include file="Fix/footer.jsp" %></footer>
</body>
</html>