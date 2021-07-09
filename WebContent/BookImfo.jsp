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
		도서명 : ${bookInfo.book_title }<br>
		카테고리 : ${bookInfo.book_type_name }<br>
		작가 : ${bookInfo.writer}<br>
		출판사 :${bookInfo.publisher }<br>
		평점 : ★★★★ 4.0
		</p>
		</div>	
		<br>
		<br>
		<br>
		<br>
		
		
	
	
	<table class="table">
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>조회수</th>
			</tr>	
		
		</thead>
		<tbody>	
					<c:choose>
						<c:when test="${empty reviewList }">
							<tr>
								<td colspan="4">작성된 글이 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${reviewList}">
								<tr>
									<td><a href="bookController?command=reviewDetail&review_id=${list.review_id}">${list.review_title}</a></td>
									<td>${list.nickname }</td>
									<td>${list.rcreateat}</td>
									<td>${list.review_r_num }</td>
									<td>${list.review_v_num }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
			<tr>
				<td colspan="4">
					<input type="button" value="리뷰 등록하기" onclick="location.href='bookController?command=reviewWriteForm&book_id=${bookInfo.book_id}'">
				</td>
			</tr>
		</tbody>
	</table>
	
				<nav class="pull-bottom">
			<c:set var="pageNum" value="${paging.pageNum }"/>
			<c:set var="startPage" value="${paging.startPage}"/>
			<c:set var="endPage" value="${paging.endPage}"/>
			<c:set var="totalPage" value="${paging.totalPage}"/>
			<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					<li>
			      		<a href="bookController?command=bookDetail&book_id=${book_id }&pageNum=1" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="bookController?command=bookDetail&book_id=${book_id }&pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="bookController?command=bookDetail&pageNum=${ item }&book_id=${book_id }">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="bookController?command=bookDetail&pageNum=${totalPage}&book_id=${book_id }" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
			
			</nav>
	
	</div> 
	
	<%@ include file="Fix/footer.jsp" %>
</body>
</html>