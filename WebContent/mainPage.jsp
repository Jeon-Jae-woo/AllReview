<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALLREVIEW 메인페이지</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>

<style type="text/css">
	
.categorybox{
	/* border: 1px solid gray; */
	height: 260px;
}
#nav{
	/* border: 1px solid gray; */
	left: 0px;
	right:0px;
	height: 100px;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );	
	
	}
#nav ul li{
	/* border:1px dashed red; */
	list-style: none;
	display: inline;
	position: relative;
	padding: 0;
	line-height:40px;
	text-align:center;
	float: left;
	left: 9%;
	top: 25px;
	width: 20%;
	color: black;
	font-weight: bold;
	font-size: 18px;
	text-shadow: 1px 1px 1px gray;
	}

#nav ul li:hover{
	color:gray;
	}
#subcategorybox{
	/* border:1px dashed red; */
	height: 100px;
	position: relative;
	top: 20px;
}
#boxtitle{
	position: relative;
	/* border: 1px dashed red; */
	left: 6%;
	top:20px;
	width: 400px;
	color: white;
	text-shadow: 1px 1px 1px gray;
}
#box{
	border: 1px solid gray;
	border-radius: 5px 5px 5px 5px;
	position: relative;
	width: 95%;
	left: 2.5%;
	height: 750px;
	top: 50px;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );	
	
}
#wrap{
	position: relative;
	width: 95%;
	height: 660px;
	top: 40%;
	left: 39%;
	transform: translate(-40%,-40%);
}

#wrap > div {
	width: 180px;
	height: 230px;
	border: 1px solid gray;
	position: relative;
	float: left;
	left: 3%;
	margin: 45px;
	box-sizing: border-box;
	border-radius: 5px 5px 5px 5px;
	/* background-color: gray; */
}
#wrap > div:nth-child(6){
	clear: both;
}
#mainlistreviewtitle1{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
#mainlistreviewtitle2{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
#mainlistreviewtitle3{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
#mainlistreviewtitle4{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
#mainlistreviewtitle5{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
#mainlistreviewtitle6{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
#mainlistreviewtitle7{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
#mainlistreviewtitle8{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
#mainlistreviewtitle9{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
#mainlistreviewtitle10{
	text-align: center;
	position: relative;
	top: 95%;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}

body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;
}
</style>

</head>
<body>

	<!-- 임시 index -->
	<%@ include file="Fix/header.jsp" %>
	<br>
	
	<!-- 카테고리 박스  -->
	<div class="categorybox">
		<div id="nav">
				<ul>
	            	<li id="online" onclick="location.href='onlineController?command=list'">온라인 쇼핑</li>
	            	<li id="moive" onclick="location.href='movieController?command=moiveListCate'">영화 </li>
	            	<li id="shop" onclick="location.href='shop.do?command=shoplist'">매장</li>
	            	<li id="book" onclick="location.href='bookController?command=bookList'">도서</li>
	            </ul>
	    </div>
	    <div id="subcategorybox">
			<div id="subcategory1">
			</div>
		</div>
	</div>
	<br>
	
	<!-- 중간 목록박스 타이틀 -->
	<div id="boxtitle">
		<h3> 전체 리뷰 베스트 TOP 10 </h3>
	</div>
	
	<!--  중간 목록박스  전체 리뷰  Top10 (조회순, 추천순 둘중 뭐로 할지 ?) -->
	<div id="box">
		<div id="wrap">
			<c:choose>
				<c:when test="${empty allList }">
					<tr>
						<td colspan ="4">작성된 글이 존재하지 않습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
				<c:forEach var="dto" items="${allList }">
					<c:choose>
						<c:when test="${dto.bigCategory eq '영화' }">
							<!-- 값 수정 -->
							<div>
								<div><a href="movieController?command=reviewDetail&review_id=${dto.boardNo}"><img id="movieposter" src="resources/uploadImage/${dto.reviewImg}" width="100" height="100"></a></div>
								<div id="mainlistreviewtitle10">${dto.title}</div>
							</div>
						</c:when>
						<c:when test="${dto.bigCategory eq '매장' }">
							<!-- 값 수정 -->
							<div>
								<div><a href="shop.do?command=shopdetail&shopno=${dto.boardNo}"><img id="movieposter" src="resources/uploadImage/${dto.reviewImg}" width="100" height="100"></a></div>
								<div id="mainlistreviewtitle10">${dto.title}</div>
							</div>
						</c:when>
						<c:when test="${dto.bigCategory eq '온라인' }">
							<!-- 값 수정 -->
							<div>
								<div><a href="onlineController?command=detail&board_id=${dto.boardNo}"><img id="movieposter" src="resources/uploadImage/${dto.reviewImg}" width="100" height="100"></a></div>
								<div id="mainlistreviewtitle10">${dto.title}</div>
							</div>
						</c:when>
						<c:when test="${dto.bigCategory eq '도서' }">
							<!-- 값 수정 -->
							<div>
								<div><a href="bookController?command=reviewDetail&review_id=${dto.boardNo}"><img id="movieposter" src="resources/uploadImage/${dto.reviewImg}" width="100" height="100"></a></div>
								<div id="mainlistreviewtitle10">${dto.title}</div>
							</div>
						</c:when>
					</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
				</div>
		</div>
	
	
	<br><br><br><br><br><br><br><br><br><br>

	<%@ include file="Fix/footer.jsp" %>
</body>
</html>