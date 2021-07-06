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
	<table>
		<tr>
		<th width="15%">
			<a href="shop.do?command=shoplistcate&cate=1">식품</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplistcate&cate=2">운동</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplistcate&cate=3">의류</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplistcate&cate=4">여행</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplistcate&cate=5">의료</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplistcate&cate=6">기타</a>
		</th>
		</tr>
	</table>
	</div>
	
	
	<div align="center">
	<input class="btn btn-default" type="submit" value="Submit">
	<form action="" method="post">
	<input type="search" class="form-inline" placeholder="검색">
	</form>
	</div>
	<br>
	<div class="catetb">
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	
	<table class="table">
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td>---리뷰 없음---</td>
				</tr>
			</c:when>
			<c:otherwise>

				<c:forEach var="dto" items="${list }" end="15">
				<c:if test="${i%j ==0 }">
				<tr>
				</c:if>
					<td>
						<img src="img/J.png" class="img-responsive" alt="Responsive image" onclick="location.href='shop.do?command=shopdetail&shopno=${dto.shopno }'">
						<a href="shop.do?command=shopdetail&shopno=${dto.shopno }">${dto.shopno } ${dto.title }</a><br>
						<label>평점 ★:  </label>${Math.round((((dto.service)+(dto.clean)+(dto.traffic))/3)*100)/100.0 }<br>
						<label>조회수:${dto.hit } </label>
						<label>추천수:${dto.reco } </label>
						
						<div></div>
					</td>
				<c:if test="${i%j == j-1 }">
				</tr>
				</c:if>
				<c:set var="i" value="${i+1 }"/>
			</c:forEach>
			</c:otherwise>
		
		
		</c:choose>
		
		
	</table>
	</div>
	
	
	
	<div align="center">
	<input type="button" value="prev">
	<a>현재페이지</a>
	<input type="button" value="next">
	<input type="button" value="글쓰기" onclick="location.href='shop.do?command=shopwriteform'">
	
	</div>
	
	
	<footer ><%@ include file="Fix/footer.jsp" %></footer>
</body>
</html>