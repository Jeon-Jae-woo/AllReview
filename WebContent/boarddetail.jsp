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
	font-size: 18px;
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
right: 17%;
transform: translateX(-28%);
top: 112px;
}

.wrtbt {
width:70px;
position: absolute;
right: 10%;
transform: translateX(-24%);
top: 112px;
}

.deletebt {
width:100px;
height: 35px;
position: absolute;
left: 7%;

}

.listbt{
width:150px;
position: absolute;
right: 53%;
height: 35px;
transform: translateX(-53%)
}

.btn{
width:100px;
position: absolute;
right: 24%;
transform: translateX(-22%)
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
padding: .43em 0em .35em .7em; 
margin: 0em 0; 
font-weight: bold; 
color: #232323; background: #E4FCFF; border-left: solid 10px #1DC1D6; border: skyblue;
width: 700px;
}

.autobox{
padding: .43em 0em .35em .7em; margin: 0em 0; 
font-weight: bold; color: #232323; 
background: #E4FCFF; border-left: solid 10px #1DC1D6;
}

#btngroup{
	border: 1px solid red;
    background-color: red;
    color: white;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}

#btngroup:hover{
  color:red;
  background-color:white;
}

#updatebtn{
	 /* border: 1px solid #08088A;
    background-color: rgba(0,0,0,0); 
    background-color:#08088A;
    color: #08088A; 
    color:white;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px; */
     color: black;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}
#updatebtn:hover{
/*   color:white; 
  color: #08088A;
   background-color:#08088A; 
  background-color: rgba(0,0,0,0);
   background-color:skyblue; */
   color: #08088A;
  	/* background-color:#E6E6E6; */
  	background-color: #EFFBFB;
}

#listbtn{
	/* border: 1px solid green; */
    /* background-color: green; */
    color: black;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}

#listbtn:hover{
 	/* color:white; */
 	color: #08088A;
  	background-color:#EFFBFB;
}

#deletebtn{
	/* border: 1px solid #FE2E64;
    background-color: #FE2E64;
    color: white;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px; */
     color: black;
    padding: 5px;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;

}

#deletebtn:hover{
	/* color:#08088A;
  	background-color: #F6CEE3; */
  	color: #08088A;
  	background-color:#EFFBFB;
}
body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;

}

#titlebox{

padding: 15px;
width: 70%;
height: 160px;
position: relative;
left: 4%;
color: white;
	
}
#content{
top: 60px;
position:relative;
left: 4%;
}

#uploadImage{
position:relative;
bottom: 200px;
float: left;
left: 7%;
}
#reciptImage{
position:relative;
bottom: 200px;
float: right;
right: 74%

}

.satbtn{
width: 35px;
font-size: 10px bold;
text-align: center;
border : none;
}

</style>
<!-- ------------------------------------------------------------------------------ -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>


<!-- ------------------------------------------------------------------------------- -->
</head>
<body>
	<!-- Navigation -->
		<!-- ?????? index -->
	<%@ include file="Fix/header.jsp" %>
	
	<!-- Header -->
	<header>
		   <div class="categorybox">
      <div id="nav">
         <ul>
               <li id="online">????????? ??????</li>
               <li id="moive">??????</li>
               <li id="shop">??????</li>
               <li id="book">??????</li>
            </ul>
      </div>
      <div id="subcategorybox">
             <div id="subcategory1">
                <ul id="online_sub1">  
                   <li onclick="location.href='onlineController?command=list&category=1'">??????</li>
                   <li onclick="location.href='onlineController?command=list&category=2'">??????</li>
                   <li onclick="location.href='onlineController?command=list&category=3'">??????</li>
                   <li onclick="location.href='onlineController?command=list&category=4'">???/????????????</li>
                   <li onclick="location.href='onlineController?command=list&category=5'">PC/?????????</li>
                   <li onclick="location.href='onlineController?command=list&category=6'">??????</li>
                </ul>
                <ul id="online_sub2">
                   <li onclick="location.href='onlineController?command=list&category=7'">??????/??????</li>
                   <li onclick="location.href='onlineController?command=list&category=8'">??????/??????</li>
                   <li onclick="location.href='onlineController?command=list&category=9'">??????/??????</li>
                   <li onclick="location.href='onlineController?command=list&category=10'">?????????/??????</li>
                   <li onclick="location.href='onlineController?command=list&category=11'">????????????</li>
                   <li onclick="location.href='onlineController?command=list&category=12'">?????????</li>
                </ul>
                <ul id="movie_sub">
                   <c:choose>
                  <c:when test="${empty moiveListCate }">
                     <tr>
                        <td colspan ="4"><!---????????? ?????? ???????????? ????????????----></td>
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
                <li onclick="">?????? ????????????1</li>
                   <li onclick="">?????? ????????????2</li>
                   <li onclick="">?????? ????????????3</li>
                   <li onclick="">?????? ????????????4</li>
                   <li onclick="">?????? ????????????5</li>
                   <li onclick="">?????? ????????????6</li>
                </ul>
                <ul id="book_sub">
                <li onclick="">?????? ????????????1</li>
                   <li onclick="">?????? ????????????2</li>
                   <li onclick="">?????? ????????????3</li>
                   <li onclick="">?????? ????????????4</li>
                   <li onclick="">?????? ????????????5</li>
                   <li onclick="">?????? ????????????6</li>
                </ul>
             </div>
       </div>
    </div>
	</header>
	<!-- Section -->
	<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<section>
	<c:set var="level" value="${level}"/>
	<c:set var="status" value="${dto.status}"/>
		<div id="secmain">
			<div id="titlebox">
				<!-- ????????????-->
				<h3><input type="text" value="?????? : ${dto.online_title }" readonly="readonly" class="titlebox" ></h3><br>
				<input type="text" value="?????????: ${dto.nickname }" readonly="readonly" class="autobox"> &nbsp;&nbsp;
				<!-- ???????????? ?????? -->
				<input type="text" value="????????????: ${dto.category_name }" readonly="readonly" class="autobox">&nbsp;&nbsp;
		
				
				<!-- ????????? ?????? -->
				???????????????  <input type="text" style="color:black;" value="${dto.price_sat }" readonly="readonly" class="satbtn"> &nbsp;
				???????????????  <input type="text" style="color:black;" value="${dto.product_sat }" readonly="readonly" class="satbtn"> &nbsp;
				??????  <input type="text" style="color:black;" value="${dto.satavg }" readonly="readonly" class="satbtn"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- ?????????,????????? ?????? -->
				
				?????????  <strong>${dto.hits }</strong>&nbsp;&nbsp;&nbsp;
				????????? <strong>${dto.recomd }</strong><hr class="hr1"> <br>
				
				<!-- ?????? -->
				<input type="button" value="??????" class="csbt" id="btngroup" onclick="">
				<!-- ?????? -->
				<input type="button" value="??????" class="wrtbt" id="btngroup" onclick=""><br><br><br>
			</div>
		
		<!-- ?????? ??????-->
		<textarea id="content" rows="27" cols="150" class="contentbox" readonly="readonly">${dto.online_content } </textarea> <br>
		
		
		<c:choose>
			<c:when test="${level eq '1' || level eq '2'}">
				<img id="reciptImage" alt="" src="resources/uploadImage/${dto.add_receipt}" width="200" height="200">
			</c:when>
		</c:choose>
		<img id="uploadImage" alt="" src="resources/uploadImage/${dto.add_product}" width="200" height="200">
		<br><br><br><br>
		<!-- ????????? ???????????? , ??????????????????????????? ?????? -->
		<div>
		<input type="button" value="?????? ??? ??????" class="deletebt" id="deletebtn"
				onclick="location.href='onlineController?command=delete&board_id=${dto.online_board_id}&category_id=${dto.category_id }'" >
				
	
		<!-- ???????????? ????????????  -->
		<input type="button" class="listbt" id="listbtn" onclick="history.back();" value="?????? ????????????">
				
		<input type="button" class="btn" id="updatebtn" value="??? ????????????" onclick="location.href='onlineController?command=updateForm&board_id=${dto.online_board_id}'">
		</div>
		
			<!-- ???????????? ???????????? ??????  -->
			<c:choose>
				<c:when test="${status eq '0'}">
					<c:choose>
						<c:when test="${level eq '1' || level eq '2'}">
							<input id="list" type="button" value="??????" onclick="location='adminController?command=approval&review_id=${dto.online_board_id}&bigCate=${bigCate}&status=1'">
							<input id="list" type="button" value="??????" onclick="location='adminController?command=approval&review_id=${dto.online_board_id}&bigCate=${bigCate}&status=2'">
						</c:when>
					</c:choose>
				</c:when>
			</c:choose>
			
		
		</div>
	</section>
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
		<%@ include file="OnlineTop5.jsp" %>
	
	
	<!-- Footer -->
		<%@ include file="Fix/footer.jsp" %>
</body>
