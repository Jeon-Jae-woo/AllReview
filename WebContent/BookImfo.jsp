<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
	
<--!	
	div{
		
		
		width :500px;
		height :200px;
		padding: 20px;
		border:1px solid black;
		
	}
-->

	.imfo{
		border: 1px solid black;
		width:100%;
		height:200px;
	}
	
	img{
		
		img{float:left;}
		
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
	<br>
	
		
		<div class="imfo">
		<br>
		
		
		<img src="images/midnight.jpg" hspace=120 style="width:150px; height:150px;">
		<p>
		도서명 : 미드나잇모닝<br>
		카테고리 : 장편소설<br>
		작가 : 김작가<br>
		출판사 : 팩토리라인<br>
		평점 : ★★★★ 4.0
		</p>
		</div>	
		
	
	
	<table class="table">
		<thead>
			<tr>
				<th>도서명</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>조회수</th>
			</tr>	
		
		</thead>
		<tbody>
			<tr>
				<th>미드나잇모닝</th>
				<th>st*****</th>
				<th>2021.06.20</th>
				<th>30</th>
				<th>100</th>
			</tr>
			<tr>
				<th>달러구트 꿈 백화점</th>
				<th>wh*****</th>
				<th>2021.06.21</th>
				<th>49</th>
				<th>201</th>
			</tr>
			<tr>
				<th>완전한 행복</th>
				<th>tr***</th>
				<th>2021.06.22</th>
				<th>50</th>
				<th>190</th>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" value="리뷰 등록하기" onclick="location.href='BookWrite.jsp'">
				</td>
			</tr>
		</tbody>
	</table>
	</div> 
	
	<%@ include file="Fix/footer.jsp" %>
</body>
</html>