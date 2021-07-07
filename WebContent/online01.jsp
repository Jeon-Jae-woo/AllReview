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

.mainbox{
width: 200px;
height: 250px;
border: 1px red dotted;
display: inline-block;

}


</style>
<!-- ------------------------------------------------------------------------------ -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">



</script>

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
					<!-- 클릭시 현재탭에서 해당 하위카테고리의 10개이미지 노출 -->
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
			<form>
				<a href="./board_main.jsp" class="catemain" style="text-decoration:none" >전체</a> 
				<select id="cate_de" onchange="if(this.value) location.href=(this.value);">
					<optgroup label="카테고리 선택"> 
					<option value="controller.do?command=list">전체</option>
					<option value="controller.do?command=calist">패션</option>
					<option value="controller.do?command=calist">뷰티</option>
					<option value="controller.do?command=calist">식품</option>
					<option value="controller.do?command=calist">홈/생활용품</option>
					<option value="controller.do?command=calist">PC/디지털</option>
					<option value="controller.do?command=calist">가전</option>
					<option value="controller.do?command=calist">출산/육아</option>
					<option value="controller.do?command=calist">의료/건강</option>
					<option value="controller.do?command=calist">문구/취미</option>
					<option value="controller.do?command=calist">스포츠/레저</option>
					<option value="controller.do?command=calist">반려동물용품</option>
					<option value="controller.do?command=calist">자동차</option>
					</optgroup>
				</select>
			
				<!-- 전체검색 -->
				<input type="text" value="게시글 검색" id="search_all" onFocus="this.value=''; return true;">
				<input type="button" value="검색" id="search_bt" onclick=""> 
				
				<!-- 추천,조회,최신순 버튼-->
				<div id="lineup">
					<ul>
						<li id="recentli"><button id="recentbt" type="button" onclick="">최신순</button></li>
						<li id="hitsli"><button id="hitsbt" type="button" onclick="">조회순</button></li>
						<li id="recomdli"><button id="recomdbt" type="button" onclick="">추천순</button></li>
					</ul>
				</div>
			</form>
	
			<div> <!-- 10개 항목 노출 (사진+글제목) div추가 , size 정하기, 위아래 5개씩, wrapping 해야함  -->
				<div class="container">
					<div class="mainbox"></div>
					<div class="mainbox"></div>
					<div class="mainbox"></div>
					<div class="mainbox"></div>
					<div class="mainbox"></div>
					<div class="mainbox"></div>
					<div class="mainbox"></div>
					<div class="mainbox"></div>
					<div class="mainbox"></div>
					<div class="mainbox"></div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 1,2,3,4,5 페이지 이동 기능 jsp 코드 들어가야함 -->
	
	
	<hr>
	<!-- Footer -->
		<%@ include file="Fix/footer.jsp" %>
</body>
</html>