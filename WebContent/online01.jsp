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

/* #secmain{
border: 1px red dotted;
padding-top:20px;
height: 900px;


} */

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

/* .containe{
	position: relative;
	left: 5%;
	top: 60px;
	padding: 5px;
	width: 67%;
	height: 720px;
	
} */


.mainbox{
	width: 220px;
	height: 380px;
	border: 1px gray groove;
	display: inline-block;
	margin: 20px;
	padding: 20px;
}

.section{
	border:none;
	/* display : inline-block; */
	width: 70%;
	height: 60%;
	position: relative;
	left:5%;
	top: 100px;
}

/* .container{
border:1px dashed red;
width: 70%;
padding:5px;
position: relative;

} */

.consub{
border:none;
margin : 1px;
padding : 1px;
width: 100%;
text-align: center;
}

.imgbox{
height: 160px;
overflow:hidden;
margin:0 auto;
}

.img{
  width:100%;
    height:100%;
    object-fit:cover;
}

.wrtbtn{
	width:120px;
	height: 35px;
	position: absolute;
	right: 25%;
	transform: translateX(-25%);
	font-size: 18px;
	margin-top: 37px;
   border: 1px solid skyblue;
    background-color: rgba(0,0,0,0);
    color: skyblue;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}
.wrtbtn:hover{
   color:white;
    background-color:skyblue;
}

.contentbox{
padding: 2em 2em; margin: 2em 10px; font-weight: 
bold; color: #565656; background: #E4FCFF; 
box-shadow: 0px 0px 0px 10px #E4FCFF; border: solid 2px skyblue; border-radius: 8px;

}

.titlebox{
padding: .43em 0em .35em .7em; margin: 2em 0; font-weight: bold; 
color: #232323; background: #E4FCFF; border-left: solid 10px #1DC1D6; border: skyblue;
}

.autobox{
padding: .43em 0em .35em .7em; margin: 2em 0; 
font-weight: bold; color: #232323; 
background: #F8E8FF; border-left: solid 10px #8A66AE;
}

#navv{
position: absolute;
right: 51.5%;
transform: translateX(-51.5%);
}

.alink{
text-decoration: none; text-shadow: 0 0 24px; 
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

</head>
<body>
	<!-- Navigation -->
	<%@ include file="Fix/header.jsp" %>
	
	<!-- Header -->
	<header>
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
	</header>
		<section class="section">
			
			<!-- <div class="container"> --> <!-- 10개 항목 노출 (사진+글제목) div추가 , size 정하기, 위아래 5개씩, wrapping 해야함 , div하나에 div를 3개넣어서 이미지, 제목등 , 추천조회 -->
				<div class="consub">
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan ="5"><h2>-------------------작성된 글이 존재하지 않습니다-------------------</h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<div class="mainbox">
								
								<div class="imgbox">
								<!--  <img class="img" src="${dto.add_product }"> -->
								<img class="img" src="./resources/Image/icon01.jpg">
								
								</div>
								<br>
								<div class="sub2box">
								<p>글 제목:  <a class="alink" href="onlineController?command=detail&board_id=${dto.online_board_id }">${dto.online_title }</a></p>
								<p>작성자 : ${dto.nickname }</p>
								<p>카테고리: ${dto.category_name }</p>
								</div>
								
								<div class="sub3box">
								조회:${dto.hits } &nbsp;
								추천:${dto.recomd }
								<p>평점:${dto.satavg }</p> 
								</div>
								
							</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			<!-- </div> -->
	</section>
	<br><br><br>
	<input type="button" class="wrtbtn" value="글 작성하기" onclick="location.href='onlineController?command=writeForm&category_id=${category_id}&category_name=${category_name }'"><br>
	<!-- 페이징기능 -->
				<nav class="pull-bottom" id="navv">
			<c:set var="pageNum" value="${paging.pageNum }"/>
			<c:set var="startPage" value="${paging.startPage}"/>
			<c:set var="endPage" value="${paging.endPage}"/>
			<c:set var="totalPage" value="${paging.totalPage}"/>
			<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					<li>
			      		<a href="onlineController?command=list&category=${category_id}&pageNum=1" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="onlineController?command=list&category=${category_id}&pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="onlineController?command=list&pageNum=${ item }&category=${category_id}">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="onlineController?command=list&pageNum=${totalPage}&category=${category_id}" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
			
			</nav>
	
	<br><br><br><br>
	
	<%@ include file="OnlineTop5.jsp" %>
	

	<!-- Footer -->
		<%@ include file="Fix/footer.jsp" %>
</body>
</html>