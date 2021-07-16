<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 도서 상위랭크5 </title>

<style type="text/css">

.side_table{
	/* border: 1px dashed red; */
	float: right;
	position: absolute;
	right: 30px;
	height: 600px;
	top: 650px;
	color: white;
}

/* .side_table01{
	position: relative;
}
.side_table02{
	position: relative;
} */

#reco_tb{
	width: 300px;
	text-align: center;
	height: 200px;
	color: black;
	font-weight: bold;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );

}
#view_tb{
	top:350px;
	width: 300px;
	text-align: center;
	height: 200px;
	color: black;
	font-weight: bold;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
}

</style>


</head>
<body>

	<!-- header -->
	<%-- <%@ include file="../Fix/header.jsp" %> --%>
	
	
	<div class="side_table">
		<div class="side_title01">
			<h4> 도서 리뷰 추천수 상위 top5 </h4>
		</div>
			
		<div>
			<form>
				<table id="reco_tb" border=1 >
					<thead>
						<tr >
							<th style="text-align:center;">No.</th>
							<th style="text-align:center;">제목</th>
							<th style="text-align:center;">추천수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="">제목입니다</a></td>
							<td>10</td>
						</tr>
	 					<tr>
							<td>2</td>
							<td><a href="">제목입니다</a></td>
							<td>9</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="">제목입니다</a></td>
							<td>8</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="">제목입니다</td>
							<td>7</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="">제목입니다</a></td>
							<td>8</td>
						</tr>
					</tbody>
					
				</table>
			</form>
		</div>
		
		<br>
		<div class="side_title02">
			<h4> 도서 리뷰 조회수 상위 top5 </h4>
		</div>
		
		<div>
			<form>
				<table id="view_tb" border=1 >
					<thead>
						<tr>
							<th style="text-align:center;">No.</th>
							<th style="text-align:center;">제목</th>
							<th style="text-align:center;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="">제목입니다</a></td>
							<td>10</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="">제목입니다</a></td>
							<td>9</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="">제목입니다</a></td>
							<td>8</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="">제목입니다</a></td>
							<td>7</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="">제목입니다</a></td>
							<td>8</td>
						</tr>
					</tbody>
					
				</table>
			</form>
		</div>
		
	</div>
	
	
	
	<!-- footer -->
	<%-- <%@ include file="../Fix/footer.jsp" %> --%>



</body>
</html>