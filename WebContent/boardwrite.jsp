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
border: none;
padding-top:20px;
height: 900px;
padding-left: 40px;
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



.categorybox{
	border: 1px solid gray;
	height: 260px;
	background-image: url("./resources/Image/background02.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;
}
#nav{

   left: 0px;
   right:0px;
   height: 100px;

   }
#nav ul li{
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
	color: white;
	font-weight: bold;
	font-size: 15px;
   }

#nav ul li:hover{
	color:gray;
   }
#subcategorybox{
   /*border:1px dashed red;*/
 height: 100px;
	position: relative;
	top: 20px;
}
#online_sub{
   display: none;
}
#movie_sub{
   display: none;
}
#shop_sub{
   display: none;
}
#book_sub{
   display: none;
}

#subcategory1 ul li{
border-inline: 1px solid lightgray;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.4 );
	list-style: none;
	position: relative;
	padding: 0;
	line-height:40px;
	text-align:center;
	font-weight: bold;
	color: black;
	float: left;
	top: 10px;
	left: 4%;
	width: 15%;
}

#subcategory1 ul li:hover{
  color:gray;
}
.containe{
	border: 1px dotted red;
	postion: absolute;
	width: 98%;
	height: 500px;
	top: 26%;
	transform: translate(-30%, -30%)
	
}

.consub{
margin: 0 auto;

}

.mainbox{
width: 200px;
height: 350px;
border: 1px gray groove;
display: inline-block;
}

.btn1{
width:80px;
position: absolute;
right: 30%;
transform: translateX(-30%)
}
.btn2{
width:80px;
position: absolute;
right: 24%;
transform: translateX(-24%)
}

#titleop{
width:700px;
}

.contentbox{
padding: 2em 2em; margin: 2em 10px; font-weight: 
bold; color: #565656; background: #E4FCFF; 
box-shadow: 0px 0px 0px 10px #E4FCFF; border: solid 2px skyblue; border-radius: 8px;

}

.titlebox{
padding: .43em 0em .35em .7em; margin: 1em 0; font-weight: bold; 
color: #232323; background: #E4FCFF; border-left: solid 10px #1DC1D6; border: skyblue;
}

.autobox{
padding: .43em 0em .35em .7em; margin: 1em 0; 
font-weight: bold; color: #232323; 
background: #F8E8FF; border-left: solid 10px #8A66AE;
}

#btncss{
 border: 1px solid skyblue;
    background-color: rgba(0,0,0,0);
    color: skyblue;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}

#btncss:hover{
    color:white;
    background-color:skyblue;
}



</style>
<!-- ------------------------------------------------------------------------------ -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	   $("#online").click(function(){
	      $("#online_sub1").toggle();
	      $("#online_sub2").toggle();
	   });
	   
	   $("#moive").click(function(){
	      $("#movie_sub").toggle();
	      
	   });
	   
	   $("#shop").click(function(){
	      $("#shop_sub").toggle();
	      
	   });
	   
	   $("#book").click(function(){
	      $("#book_sub").toggle();
	      
	   });
	}); 


</script>



<!-- ------------------------------------------------------------------------------- -->
</head>
<body>
	<!-- Navigation -->
		<!-- 임시 index -->
	<%@ include file="Fix/header.jsp" %>
		 <!-- 카테고리 박스  -->
   <div class="categorybox">
      <div id="nav">
         <ul>
               <li id="online">온라인 쇼핑</li>
               <li id="moive" onclick="location.href='movieController?command=moiveListCate&movie_type=${dto.movie_type }'">영화</li>
               <li id="shop">매장</li>
               <li id="book">도서</li>
            </ul>
      </div>
      <div id="subcategorybox">
             <div id="subcategory1">
                <ul id="online_sub1">  
                   <li onclick="location.href='onlineController?command=list&category=1'">패션</li>
                   <li onclick="location.href='onlineController?command=list&category=2'">뷰티</li>
                   <li onclick="location.href='onlineController?command=list&category=3'">식품</li>
                   <li onclick="location.href='onlineController?command=list&category=4'">홈/생활용품</li>
                   <li onclick="location.href='onlineController?command=list&category=5'">PC/디지털</li>
                   <li onclick="location.href='onlineController?command=list&category=6'">가전</li>
                </ul>
                <ul id="online_sub2">
                   <li onclick="location.href='onlineController?command=list&category=7'">출산/육아</li>
                   <li onclick="location.href='onlineController?command=list&category=8'">의료/건강</li>
                   <li onclick="location.href='onlineController?command=list&category=9'">문구/취미</li>
                   <li onclick="location.href='onlineController?command=list&category=10'">스포츠/레저</li>
                   <li onclick="location.href='onlineController?command=list&category=11'">반려동물</li>
                   <li onclick="location.href='onlineController?command=list&category=12'">자동차</li>
                </ul>
                <ul id="movie_sub">
                   <c:choose>
                  <c:when test="${empty moiveListCate }">
                     <tr>
                        <td colspan ="4">----작성된 글이 존재하지 않습니다----</td>
                     </tr>
                  </c:when>
                  <c:otherwise>
                     <c:forEach var="cate" items="${moiveListCate }">
                         <li onclick="location.href='movieController?command=moiveListCate&category=${cate.movie_type}&pageNum=1'">${cate.movie_type_name }</li>
                         </c:forEach>
                  </c:otherwise>
               </c:choose>
                   
                </ul>
                <ul id="shop_sub">
                <li onclick="">세부 카테고리1</li>
                   <li onclick="">세부 카테고리2</li>
                   <li onclick="">세부 카테고리3</li>
                   <li onclick="">세부 카테고리4</li>
                   <li onclick="">세부 카테고리5</li>
                   <li onclick="">세부 카테고리6</li>
                </ul>
                <ul id="book_sub">
                <li onclick="">세부 카테고리1</li>
                   <li onclick="">세부 카테고리2</li>
                   <li onclick="">세부 카테고리3</li>
                   <li onclick="">세부 카테고리4</li>
                   <li onclick="">세부 카테고리5</li>
                   <li onclick="">세부 카테고리6</li>
                </ul>
             </div>
       </div>
    </div>
    
    <!-- ---------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- Section -->
	<section class="sec1">
		<div id="secmain">
			<form class="writer" action="onlineController" method="post">
			<input type="hidden" name="command" value="write">
			<input type="hidden" name="category_id" value="${category_id}">
			<h3>글 쓰기</h3> 
			<input type="text" value="작성자: ${nickname }" readonly="readonly" class="autobox"> &nbsp;&nbsp;
			<input type="text" value="카테고리: ${category_name}" readonly="readonly" class="autobox"><br>
			
		
		<!-- 제목-->
		<input type="text" name="title" placeholder="제목을 입력하세요" id="titleop" class="titlebox"> &nbsp;&nbsp;

		<!-- 평가 항목 -->
		
		가격만족도 : <input type="hidden" name="price_sat" id="price_sat" value="">
		<select onchange="document.getElementById('price_sat').value = this.options[this.selectedIndex].value">
		<option value='0.5'>0.5</option>
		<option value='1'>1</option>
		<option value='1.5'>1.5</option>
		<option value='2'>2</option>
		<option value='2.5'>2.5</option>
		<option value='3'>3</option>
		<option value='3.5'>3.5</option>
		<option value='4'>4</option>
		<option value='4.5'>4.5</option>
		<option value='5'>5</option>
		</select>
		
		상품만족도 : <input type="hidden" name="product_sat" id="product_sat" value="">
		<select onchange="document.getElementById('product_sat').value = this.options[this.selectedIndex].value">
		<option value='0.5'>0.5</option>
		<option value='1'>1</option>
		<option value='1.5'>1.5</option>
		<option value='2'>2</option>
		<option value='2.5'>2.5</option>
		<option value='3'>3</option>
		<option value='3.5'>3.5</option>
		<option value='4'>4</option>
		<option value='4.5'>4.5</option>
		<option value='5'>5</option>
		</select>
		
		
		<!-- 텍스트 일때는 잘 넘어간다 해결완료 -->
		<!-- <input type="text" value="가격만족도" name="price_sat" value="1"><br> --> 
		<!--  <input type="text" value="상품만족도" name="product_sat" value="1"><br> -->
		
		
		<!-- 내용 -->
		<textarea rows="30" cols="170" name="content" placeholder="내용을 입력하세요" class="contentbox"></textarea><br><br>

		구매영수증 첨부: <input type="text" name="receipt" value="">
		상품영수증 첨부: <input type="text" name="product_add" value="">
		
		
		<!-- 나중에참고 --><!--  구매영수증 첨부: <input type="text" name="receipt" value=""> -->
		<!-- <br><strong>구매내역 첨부 (필수)</strong>
		<input type="file" name="receiptupload" accept ="image/*" />
		 -->
		
		<!-- 나중에참고 --><!--상품영수증 첨부: <input type="text" name="product_add" value=""> -->
		<!--  <p>상품사진 첨부
		<input multiple="multiple" type="file" name="productupload" accept ="image/*" />
	 	 -->
		
			
		<!-- 작성취소 -->
		<input type="button" value="작성 취소" onclick="history.go(-1)" class="btn1" id="btncss"> <!-- 이전페이지 돌아가기 -->
		<!-- 작성 완료 -->
		<input type="submit" value="작성" class="btn2" id="btncss">
		</form>
		
		</div>
		
	</section>
	
	<hr>
	
		<%@ include file="OnlineTop5.jsp" %>
	<br>
	<!-- Footer -->
		<%@ include file="Fix/footer.jsp" %>
</body>
</html>