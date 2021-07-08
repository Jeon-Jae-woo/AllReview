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

/* 별점 */
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('image/star.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p0_5"]{width:15px;z-index:5.5;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p1_5"]{width:45px;z-index:4.5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p2_5"]{width:75px;z-index:3.5;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p3_5"]{width:105px;z-index:2.5;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p4_5"]{width:135px;z-index:1.5;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

.starR1{

}
.starR2{
   
}
.starR1.on{}
.starR2.on{}

/* 별점기능 */


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
			<form class="writer" action="onlineController" method="post">
			<input type="hidden" name="command" value="write">
			<input type="hidden" name="category_id" value="${category_id}">
			<h2>글 쓰기</h2> 
			<input type="text" readonly="readonly" value="${category_name}">
			
		
		<!-- 제목-->
		<input type="text" name="title" placeholder="제목을 입력하세요">

		<!-- 평가 항목 -->
		<input type="button" value="상품만족도 선택">
		<input type="text" value="가격만족도" name="price_sat" value="1"> 가격만족도
		
		<input type="text" value="상품만족도" name="product_sat" value="1"> 상품만족도

		<input type="text" name="product_add">
		<input type="text" name="receipt">
		


		<!-- 별점기능 -->
		<span class="star-input">
			<span class="input">
				<input type="radio" name="star-input" value="0.5" id="p0_5" class="starR1 on">
			    <label for="p0_5">0.5</label>
		    	<input type="radio" name="star-input" value="1" id="p1" class="starR2 on">
		    	<label for="p1">1</label>
		    	<input type="radio" name="star-input" value="1.5" id="p1_5" class="starR1">
		    	<label for="p1_5">1.5</label>
		    	<input type="radio" name="star-input" value="2" id="p2" class="starR2">
		    	<label for="p2">2</label>
		    	<input type="radio" name="star-input" value="2.5" id="p2_5" class="starR1">
		    	<label for="p2_5">2.5</label>
		    	<input type="radio" name="star-input" value="3" id="p3" class="starR2">
		    	<label for="p3">3</label>
		    	<input type="radio" name="star-input" value="3.5" id="p3_5" class="starR1">
		    	<label for="p3_5">3.5</label>
		    	<input type="radio" name="star-input" value="4" id="p4" class="starR2">
		    	<label for="p4">4</label>
		    	<input type="radio" name="star-input" value="4.5" id="p4_5" class="starR1">
		    	<label for="p4_5">4.5</label>
		    	<input type="radio" name="star-input" value="5" id="p5" class="starR2">
		    	<label for="p5">5</label>
		  	</span>
	  			<!-- <output for="star-input"><b>0</b>점</output> -->				
		</span>
		<!-- 별점기능 -->
		<!-- 내용 -->
		<textarea rows="30" cols="200" name="content">내용을 입력하세요.</textarea>
		
		
		
		<br><strong>구매내역 첨부 (필수)</strong>
		<!--  구매내역 파일 올리기  + 버튼 / 삭제버튼 ajax?-->
		<input type="file" name="receiptupload" accept ="image/*" />
		
		<p>상품사진 첨부
		<!--  상품사진 올리기  + 버튼 / 삭제버튼 ajax?-->
		<input multiple="multiple" type="file" name="productupload" accept ="image/*" />
			
			
		<!-- 작성취소 -->
		<button class="csbt" onclick="">작성 취소</button>
		<!-- 작성 완료 -->
		<input type="submit" value="작성" class="btn">
		</form>
		
		</div>
		
	</section>
	
	<!-- 1,2,3,4,5 페이지 이동 기능 jsp 코드 들어가야함 -->
	
	
	<hr>
	<!-- Footer -->
		<%@ include file="Fix/footer.jsp" %>
</body>
</html>