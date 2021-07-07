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
.nmdiv{
border: 1px red dotted;
height: 300px;

}

#secmain{
border: 1px red dotted;
padding-top:20px;
height: 900px;

}

.catemain{
margin-left: 30px;
font-size: 20px;
}



#cate_de{
position: relative;

}

#search_all{
position: absolute;
left: 45%;
transform: translateX(-45%);
}

#search_bt{
position: absolute;
left: 51%;
transform: translateX(-51%);
}

#recomdli, #hitsli, #recentli {
list-style-type:none; float:right;
} 

#lineup{
margin-right: 100px;
display:inline;
}
#mainca {
list-style: none;
height: 40px;
padding: 0px;
margin: 0px;
}

#mainca li {
list-style-type:none; 
float:left;
outline:1px dotted red;
position:relative;
padding: 0px;
line-height:60px;


}

#subca1 li{
list-style-type:none; float:left;
outline:1px dotted red;
margin-left: 30px;
font-size: 20px;

}

#subca2 li{
list-style-type:none; float:left;
outline:1px dotted red;
margin-left: 30px;
font-size: 20px;
}

#online,#movie,#shop,#book{
font-size: 30px;
}

.writer{
margin-left: 80px;
}

.csbt{
position: absolute;
left: 73%;
transform: translateX(-73%);

}

.wrtbt{
position: absolute;
left: 78%;
transform: translateX(-78%);


}


</style>
<!-- ------------------------------------------------------------------------------ -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/star.js"></script>
<script type="text/javascript">


</script>


<!-- ------------------------------------------------------------------------------- -->
</head>
<body>
	<!-- Navigation -->
		<!-- 임시 index -->
	<%@ include file="Fix/header.jsp" %>
	
	<!-- Header -->
	<header>
		<div class="nmdiv"> <!-- 최상단 카테고리4개, 온라인쇼핑카테고리12개 --> <!-- li안에 div 불가 -->
			<div>
				<ul id="mainca">
					<li id="online">
						<strong>온라인쇼핑</strong>
						<ul id="subca1">
							<li>패션</li>
							<li>뷰티</li>
							<li>식품</li>
							<li>홈/생활용품</li>
							<li>PC/디지털</li>
							<li>가전</li>
						</ul><br><br>
						<ul id="subca2">
							<li>출산/육아</li>
							<li>의료/건강</li>
							<li>문구/취미</li>
							<li>스포츠/레저</li>
							<li>반려동물용품</li>
							<li>자동차</li>
						</ul>
					</li>
					<li id="movie"><strong>영화</strong></li>
					<li id="shop"><strong>매장</strong></li>
					<li id="book"><strong>도서</strong></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- Section -->
	<section>
	
		<div id="secmain">
			
		
		<!-- 데이터가져와서 출력해야하는 부분 -->
		<!-- 제목출력-->
		<h1><input type="text" value="${dto.online_title }" readonly="readonly"></h1>
		<!-- 카테고리 출력 -->
		<input type="text" value=${dto.category_id } readonly="readonly">
		<!-- 세부카테고리 출력 -->
		<input type="text" value=${dto.category_detail_id } readonly="readonly">
		
		<!-- 만족도 출력 -->
		가격만족도<input type="text" value="${dto.price_sat }" readonly="readonly">
		상품만족도<input type="text" value="${dto.product_sat }" readonly="readonly">
		평점<input type="text" value="${dto.satavg }" readonly="readonly">
		<!-- 조회수,추천수 출력 -->
		
		조회<strong>${dto.hits }</strong>
		추천<strong>${dto.recomd }</strong>
		
	
		<!-- 내용 출력-->
		<textarea rows="30" cols="200" readonly="readonly">${dto.online_content } </textarea>
	
	
		<!-- 추천 -->
		<button class="csbt" onclick="">추천</button>
		<!-- 신고 -->
		<button class="wrtbt" onclick="">신고</button>
		<!-- 목록으로 돌아가기  -->
		<button class="listbt" onclick="">목록</button>
		<!-- 게시글 삭제버튼 , 게시글작성자한테만 노출 -->
		<input type="button" value="삭제"
				onclick="location.href='controller.do?command=delete&online_board_id=${dto.online_board_id}'" >
		</div>
	</section>
	
	
	<!-- 1,2,3,4,5 페이지 이동 기능 jsp 코드 들어가야함 -->
	
	
	<hr>
	<!-- Footer -->
		<%@ include file="Fix/footer.jsp" %>
</body>
