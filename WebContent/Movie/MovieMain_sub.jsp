<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 메인페이지 서브</title>


<style type="text/css">

.container{
	border: 1px dashed red;
	padding: 5px;
	width: 70%;
	height: 900px;
}

.top{
	border: 1px dashed red;
/* 	display: inline;
	position: relative; */
	padding: 0px;
	margin: 0px;
	width: 100%;
	float: left;
	left: 100px;
	height: 80px;
}

h1{
	display: inline;
	position: relative;
	top: 25px;
}

#select{
	display:inline;
	position: relative;
	float: left;
	left: 250px;
	font-size: 20px;
	top: 40px;
}

.search{
	display:inline;
	position: relative;
	float: right;
	right: 50px;
	top: 35px;
}

.search > input, button{
	font-size: 20px;
}

#box{
	width: 100%;
	height: 800px;
	border: 1px solid gray;
	position: relative;
	top: 100px;

}
#wrap{
	border: 1px dotted red;
	position: relative;
	width: 90%;
	height: 660px;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
}

#wrap > div {
	width: 200px;
	height: 250px;
	border: 1px solid gray;
	position: relative;
	bottom: 90px;
	left: 100px;
	float: left;
	margin: 45px;
	box-sizing: border-box;
	
}

#wrap > div:nth-child(5){
clear: both;

}

.page_wrap {
	text-align:center;
	font-size:0;

 }
.page_nation {
	border: 1px dashed red;
	display:inline-block;
	position: relative;
	margin: auto;
	bottom: 30px;
	
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('Image/page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('Image/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('Image/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('Image/page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}




</style>

</head>
<body>

	<div class="container">
		<!--  목록 페이지 상단 (카테고리명, 정렬, 검색) -->
		<div class="top">
			<form class="top_1">
				<h1>액션</h1>
				<select id="select" onchange=>
				<!-- "selectOpt(this.options[this.selectedIndex].value);" -->
				
					<option value="">제목순</option>
					<option value="">조회순</option>
					<option value="">추천순</option>					
				</select>
				<div class="search">
					<input type="text" class="form-control" placeholder="제목을 입력하세요">
					<button type="submit" class="btn btn-default">검색</button>
				</div>
			</form>
		</div>
		
		<!--  목록 페이지 중간 (영화포스터 바둑판 배열) -->
		
		<div id="box">
			<div id="wrap">
				<div><a href="">1</a></div>
				<div><a href="">2</a></div>
				<div><a href="">3</a></div>
				<div><a href="">4</a></div>
				<div><a href="">5</a></div>
				<div><a href="">6</a></div>
				<div><a href="">7</a></div>
				<div><a href="">8</a></div>
			</div>
			
			<div class="page_wrap">
			   <div class="page_nation">
			      <a class="arrow pprev" href="#"></a>
			      <a class="arrow prev" href="#"></a>
			      <a href="#" class="active">1</a>
			      <a href="#">2</a>
			      <a href="#">3</a>
			      <a href="#">4</a>
			      <a href="#">5</a>
			      <a class="arrow next" href="#"></a>
			      <a class="arrow nnext" href="#"></a>
			   </div>
			</div>
			
		</div>
	</div>











</body>
</html>