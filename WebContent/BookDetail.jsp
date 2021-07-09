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

	.review{
		vertical-align:middle;
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
	<h1>리뷰글 상세보기</h1>
	
	<div class="review">
	<textarea name="head" cols="40" rows="3" readonly>도서명 평점 추천수 신고수 조회수</textarea><br>
	<textarea name="detail" cols="40" rows="20"></textarea><br>
	</div>
	<button>목록보기</button>

	</div>
	<div class="container"style="border:1px solid black">
	${dto.review_id }
	<br>
	${dto.review_title }
	<br>
	${dto.review_content }
	<br>
	${dto.nickname }
	<br>
	${dto.book_id }
	<br>
	${dto.review_r_num }
	<br>
	${dto.review_v_num }
	<br>
	${dto.rcreateat }
	</div>
	
	<input type="button" class="btn" value="삭제" onclick="location.href='bookController?command=reviewDelete&book_id=${dto.book_id}&review_id=${dto.review_id}'">
	<input id="list" type="button" value="수정" onclick="location='bookController?command=reviewUpdateForm&review_id=${dto.review_id}'">
	<%@ include file="Fix/footer.jsp" %>
	

</body>
</html>