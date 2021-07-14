<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function setThumbnail(event) { 
	for (var image of event.target.files) { 
		var reader = new FileReader(); 
		
		reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); 
			
		}; 
			console.log(image); 
			reader.readAsDataURL(image); 
		} 
	}







</script>
<style type="text/css">
.writetb{
	margin-left: 0px;
	margin-right: 200px;

}
#multiple-container {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
}
.image {
    display: block;
    width: 100%;
}
.image-label {
    position: relative;
    bottom: 22px;
    left: 5px;
    color: white;
    text-shadow: 2px 2px 2px black;
}



</style>

</head>
<body>
	<header ><%@ include file="Fix/header.jsp" %></header>
	<%request.getSession(); %>
	<div class="writetb">
	<form class="form-horizontal" action="shop.do?command=shopinsert" method="post" enctype="multipart/form-data">
	<!-- <input type="hidden" name="command" value="shopinsert"> -->
	
	<table class="table table-bordered">
	<tr>
		<td>
			<label>카테고리</label>
  		<select name="category">
  			<option value="1">식품</option>
  			<option value="2">운동</option>
  			<option value="3">의류</option>
  			<option value="4">여행</option>
  			<option value="5">기타</option>
  			
  		</select>
		</td>
	</tr>
	<tr>
	<td>
  <div class="form-group">
    <label class="col-sm-2 control-label">제목</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="shoptitle" placeholder="제목">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
  		<label>이미지 첨부</label><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" name="uploadImg">
  		<label>영수증 첨부</label><input type="file" name="receipt"> 
  		<div id="image_container"></div>

  	</div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-2 control-label">평가</label>
    <div class="col-sm-10">
      <textarea class="form-control" rows="8" name="shopcontent"></textarea>
      
    </div>
  </div>
  </td>
  </tr>
  
  <tr>
	<td>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
    <label>서비스</label>
  		<select name="service">
  			<option value="1">1</option>
  			<option value="1.5">1.5</option>
  			<option value="2">2</option>
  			<option value="2.5">2.5</option>
  			<option value="3">3</option>
  			<option value="3.5">3.5</option>
  			<option value="4">4</option>
  			<option value="4.5">4.5</option>
  			<option value="5">5</option>
  		</select>
  		<br>
  	<label>청결</label>
  		<select name="clean">
  			<option value="1">1</option>
  			<option value="1.5">1.5</option>
  			<option value="2">2</option>
  			<option value="2.5">2.5</option>
  			<option value="3">3</option>
  			<option value="3.5">3.5</option>
  			<option value="4">4</option>
  			<option value="4.5">4.5</option>
  			<option value="5">5</option>
  		</select>
  		<br>
  	<label>교통</label>
  		<select name="traffic">
  			<option value="1">1</option>
  			<option value="1.5">1.5</option>
  			<option value="2">2</option>
  			<option value="2.5">2.5</option>
  			<option value="3">3</option>
  			<option value="3.5">3.5</option>
  			<option value="4">4</option>
  			<option value="4.5">4.5</option>
  			<option value="5">5</option>
  		</select>
  		<br>
  	</div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
  	<p>추천 그룹</p>
  	<input type="radio" value="5" name="group" checked="checked">기타
  	<input type="radio" value="4" name="group">개인
  	<input type="radio" value="3" name="group">커플
  	<input type="radio" value="2" name="group">가족
  	<input type="radio" value="1" name="group">회식
  	</div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
  	<p>재방문 의사</p>
  	<input type="radio" name="revisit" value="Y"  checked="checked">Y
  	<input type="radio" name="revisit" value="N" >N
  	</div>
  </div>
  </td>
  </tr>
 
  
    <tr>
	<td>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">작성</button>
      <button type="button" class="btn btn-default" onclick="location.href='shop.do?command=shoplist'">취소</button>
    </div>
  </div>
  </td>
  </tr>
  
  </table>
</form>
</div>	
	
	
	
	
	
	
	
	<footer ><%@ include file="Fix/footer.jsp" %></footer>
</body>
</html>