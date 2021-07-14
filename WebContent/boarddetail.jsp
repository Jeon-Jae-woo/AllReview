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
top: 70px;
position: relative;
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
	/* border: 1px solid gray; */
	height: 260px;
}
#nav{

   left: 0px;
   right:0px;
   height: 100px;
   	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );	

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
	color: black;
	font-weight: bold;
	font-size: 15px;
	text-shadow: 1px 1px 1px gray;
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
  /*  display: none; */
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
	background-color: rgba( 255, 255, 255, 0.8 );
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
	text-shadow: 1px 1px 1px gray;
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

.csbt{
width:70px;
position: absolute;
right: 28%;
transform: translateX(-28%)
}

.wrtbt {
width:70px;
position: absolute;
right: 24%;
transform: translateX(-24%)
}

.deletebt {
width:100px;
height: 35px;
}

.listbt{
width:150px;
position: absolute;
right: 57%;
height: 35px;
transform: translateX(-57%)
}

.btn{
width:100px;
position: absolute;
right: 24%;
transform: translateX(-24%)
}
.titleop{
width: 1142px;
}

.hr1{

display:none;
}

.contentbox{
padding: 2em 2em; margin: 0em 15px; font-weight: 
bold; color: #565656; background: #E4FCFF; 
box-shadow: 0px 0px 0px 10px #E4FCFF; border: solid 2px skyblue; border-radius: 8px;

}

.titlebox{
padding: .43em 0em .35em .7em; margin: 0em 0; font-weight: bold; 
color: #232323; background: #E4FCFF; border-left: solid 10px #1DC1D6; border: skyblue;
width: 700px;
}

.autobox{
padding: .43em 0em .35em .7em; margin: 0em 0; 
font-weight: bold; color: #232323; 
background: #F8E8FF; border-left: solid 10px #8A66AE;
}

#btngroup{
	border: 1px solid red;
    background-color: rgba(0,0,0,0);
    color: red;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}

#btngroup:hover{
  color:white;
  background-color:red;
}

#updatebtn{
	 border: 1px solid skyblue;
    background-color: rgba(0,0,0,0);
    color: skyblue;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}
#updatebtn:hover{
  color:white;
   background-color:skyblue;
}

#listbtn{
	border: 1px solid green;
    background-color: rgba(0,0,0,0);
    color: green;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}

#listbtn:hover{
 	color:white;
  	background-color:green;
}

#deletebtn{
	border: 1px solid hotpink;
    background-color: rgba(0,0,0,0);
    color: hotpink;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}

#deletebtn:hover{
	color:white;
  	background-color:hotpink;
}
body{
	background-image: url("./resources/Image/on2.png");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;

}

#titlebox{

padding: 15px;
width: 76%;
height: 220px;
/* position: relative; */
background-color: white;
background-color: rgba( 255, 255, 255, 0.8 );
	
}
#content{
top: 60px;
position:relative;
}

#uploadImage{
position:relative;
bottom: 200px;
float: left;
left: 5%;
}
#bottombutton{
position: relative;
bottom: 110px;
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
	
	<!-- Header -->
	<header>
		   <div class="categorybox">
      <div id="nav">
         <ul>
               <li id="online">온라인 쇼핑</li>
               <li id="moive">영화</li>
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
                        <td colspan ="4"><!---작성된 글이 존재하지 않습니다----></td>
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
	</header>
	<!-- Section -->
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<section>
	
		<div id="secmain">
			<div id="titlebox">
				<!-- 제목출력-->
				<h1><input type="text" value="제목 : ${dto.online_title }" readonly="readonly" class="titlebox" ></h1><br>
				<input type="text" value="작성자: ${dto.nickname }" readonly="readonly" class="autobox"> &nbsp;&nbsp;
				<!-- 카테고리 출력 -->
				<input type="text" value="카테고리: ${dto.category_name }" readonly="readonly" class="autobox">&nbsp;&nbsp;
		
				
				<!-- 만족도 출력 -->
				가격만족도  <input type="text" value="${dto.price_sat }" readonly="readonly"> &nbsp;
				상품만족도  <input type="text" value="${dto.product_sat }" readonly="readonly"> &nbsp;
				평점  <input type="text" value="${dto.satavg }" readonly="readonly"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- 조회수,추천수 출력 -->
				
				조회수  <strong>${dto.hits }</strong>&nbsp;&nbsp;&nbsp;
				추천수 <strong>${dto.recomd }</strong><hr class="hr1"> <br>
				
				<!-- 추천 -->
				<input type="button" value="추천" class="csbt" id="btngroup" onclick="">
				<!-- 신고 -->
				<input type="button" value="신고" class="wrtbt" id="btngroup" onclick=""><br><br><br>
			</div>
		
		<!-- 내용 출력-->
		<textarea id="content" rows="27" cols="165" class="contentbox" readonly="readonly">${dto.online_content } </textarea> <br>
		<img alt="" src="resources/uploadImage/${dto.add_receipt}" width="200" height="200">
		<img id="uploadImage" alt="" src="resources/uploadImage/${dto.add_product}" width="200" height="200">
		<br>
		<!-- 게시글 삭제버튼 , 게시글작성자한테만 노출 -->
		<div id="bottombutton">
		<input type="button" value="작성 글 삭제" class="deletebt" id="deletebtn"
				onclick="location.href='onlineController?command=delete&board_id=${dto.online_board_id}&category_id=${dto.category_id }'" >
				
	
		<!-- 목록으로 돌아가기  -->
		<input type="button" class="listbt" id="listbtn" onclick="history.back();" value="이전 목록으로">
				
		<input type="button" class="btn" id="updatebtn" value="글 수정하기" onclick="location.href='onlineController?command=updateForm&board_id=${dto.online_board_id}'">
		</div>
		</div>
	</section>
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
		<%@ include file="OnlineTop5.jsp" %>
	
	
	<!-- Footer -->
		<%@ include file="Fix/footer.jsp" %>
</body>
