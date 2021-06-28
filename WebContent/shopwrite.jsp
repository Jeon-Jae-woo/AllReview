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
	$(function(){
		
	});





</script>
<style type="text/css">
.writetb{
	margin-left: 0px;
	margin-right: 200px;

}



</style>

</head>
<body>
	<header ><%@ include file="Fix/header.jsp" %></header>
	
	<div class="writetb">
	<form class="form-horizontal" action="shop.do" method="post">
	<input type="hidden" name="command" value="insertshop">
	<table class="table table-bordered">
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
  		<img src="img/J.png">
  	</div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-2 control-label">평가</label>
    <div class="col-sm-10">
      <textarea class="form-control" rows="8" name="shopcontent"></textarea>
      
      <button type="button" class="btn btn-default">이미지 첨부</button>
    </div>
  </div>
  </td>
  </tr>
  
  <tr>
	<td>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
  		별점칸
  	</div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
  	<p>추천 그룹</p>
  	<input type="radio" value="E" class="group" checked="checked">기타
  	<input type="radio" value="F" class="group">가족
  	<input type="radio" value="C" class="group">커플
  	<input type="radio" value="S" class="group">개인
  	<input type="radio" value="O" class="group">회식
  	</div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
  	<p>재방문 의사</p>
  	<input type="radio" name="" value="Y" class="revisit" checked="checked">Y
  	<input type="radio" name="" value="N" class="revisit">N
  	</div>
  </div>
  </td>
  </tr>
 
  
  <tr>
	<td>
  <div class="form-group">
  	
  	<div class="col-sm-offset-2 col-sm-10">
  	<div><img src="img/J.png" class="img-responsive" alt="Responsive image"></div>
  		
  	</div>
  </div>
  </td>
  </tr>
  
    <tr>
	<td>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">작성</button>
      <button type="button" class="btn btn-default" onclick="location.fref='shop.do?command=shopcate'">취소</button>
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