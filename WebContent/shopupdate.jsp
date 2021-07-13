<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header ><%@ include file="Fix/header.jsp" %></header>

	<form class="form-horizontal" action="shop.do" method="post">
	<input type="hidden" name="command" value="shopupdate">
	<input type="hidden" name="shopno" value="${dto.shopno }">
	<div class="detailtb">
	<table class="table table-bordered">
	<tr>
	<th width="10%" align="center">
		제목
	</th>
	<th width="65%">
		[${catedto.cateName }] ${dto.title }
	</th>
	<th width="10%">
		작성일/수정일
	</th>
	<th width="15%">
		${dto.createat }/${dto.updateat }
	</th>
	</tr>
	<tr>
		<td colspan="4">
			<img src="resources/uploadImage/${dto.upload_img }">
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<textarea rows="10" cols="80" name="content">${dto.content }</textarea>
		</td>
	</tr>
	<tr>
	<td colspan="4">
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
  
  	<p>추천 그룹</p>
  	<input type="radio" value="5" name="group" checked="checked">기타
  	<input type="radio" value="4" name="group">개인
  	<input type="radio" value="3" name="group">커플
  	<input type="radio" value="2" name="group">가족
  	<input type="radio" value="1" name="group">회식
  
  	<p>재방문 의사</p>
  	<input type="radio" name="revisit" value="Y"  checked="checked">Y
  	<input type="radio" name="revisit" value="N" >N
  </td>
  </tr>

	<tr>
		<td colspan="4">
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="location.href='shop.do?command=shopdetail&shopno=${dto.shopno}'">
		</td>
	</tr>
	
	
	
	</table>
	
</div>
</form>

<footer ><%@ include file="Fix/footer.jsp" %></footer>
</body>
</html>