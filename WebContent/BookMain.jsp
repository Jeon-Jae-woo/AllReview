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
	
	<c:choose>
						<c:when test="${empty categoryList }">
							<tr>
								<td colspan ="4">----작성된 글이 존재하지 않습니다----</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="cate" items="${categoryList }">
	       					<li><a href="bookController?command=bookList&category=${cate.book_type}&pageNum=1">${cate.book_type_name }</a></li>
	       					</c:forEach>
						</c:otherwise>
					</c:choose>
	
	
	<br>
	<br>
	<!-- book_type, book_type_name -->
	
	<img src="images/midnight.jpg"  style="width:120pt; height:120pt;" onclick="location.href='BookImfo.jsp'"> 
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt"><br>
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt">
	<input type="button" style="width:100pt; height:100pt">
	
	</div>
	<div class="container">
	<div id="box">
					<div id="wrap">
							<c:choose>
								<c:when test="${empty list }">
									<tr>
										<td colspan ="4">----작성된 글이 존재하지 않습니다----</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="dto" items="${list }">
									<div class="container" style="border: 1px black solid;">
									<!-- 값 수정 -->
									<div>${dto.book_title}</div>
									
              						<div><a href="bookController?command=bookDetail&book_id=${dto.book_id}">${dto.book_img}</a></div>
									</div>
									
									</c:forEach>
								</c:otherwise>
							</c:choose>
					</div>
					
					<!-- 페이징 -->
					<nav class="pull-bottom">
				<c:set var="pageNum" value="${paging.pageNum }"/>
				<c:set var="startPage" value="${paging.startPage}"/>
				<c:set var="endPage" value="${paging.endPage}"/>
				<c:set var="totalPage" value="${paging.totalPage}"/>
				<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					<li>
			      		<a href="bookController?command=bookList&category=${category}&pageNum=1" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="bookController?command=bookList&category=${category}&pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="bookController?command=bookList&pageNum=${ item }&category=${category}">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="bookController?command=bookList&pageNum=${totalPage}&category=${category}" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
			
			</nav>
					
					
	</div>
	</div>
	<%@ include file="Fix/footer.jsp" %>
	
</body>

	
</html>