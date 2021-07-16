<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 영화 상위랭크5 </title>

<style type="text/css">

.side_table{
	/* border: 1px dashed red; */
	float: right;
	position: absolute;
	right: 30px;
	height: 600px;
	top: 550px;
	
}

#reco_tb{
	width: 300px;
	text-align: center;
	height: 200px;
	color: black;
	font-weight: bold;
 	/* text-shadow: 1px 1px 1px gray; */
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
 	/* text-shadow: 1px 1px 1px gray; */
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
			<h4 style="color:white;"> 영화 리뷰 추천수 상위 top5 </h4>
		</div>
			
		<div>
				<table id="reco_tb" border=1 >
					<thead>
						<tr >
							<th style="text-align:center;">No.</th>
							<th style="text-align:center;">제목</th>
							<th style="text-align:center;">추천수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list2 }">
								<tr>
									<td>---리뷰 없음---</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto2" items="${list2 }" end="4">
									<tr>
										<td>${r=r+1 }</td>
										<td><a href="movieController?command=reviewDetail&review_id=${dto2.review_id }">${dto2.review_title }</a></td>
										<td>${dto2.review_r_num }</td>  
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
		</div>
		
		<br>
		<div class="side_title02">
			<h4 style="color:white;"> 영화 리뷰 조회수 상위 top5 </h4>
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
						<c:choose>
							<c:when test="${empty list3 }">
								<tr>
									<td>---리뷰 없음---</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto3" items="${list3 }" end="4">
									<tr>
										<td>${r2=r2+1 }</td>
										<td><a href="movieController?command=reviewDetail&review_id=${dto3.review_id }">${dto3.review_title }</a></td>
										<td>${dto3.review_v_num }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					
				</table>
			</form>
		</div>
		
	</div>
	
	
	<!-- footer -->
	<%-- <%@ include file="../Fix/footer.jsp" %> --%>



</body>
</html>