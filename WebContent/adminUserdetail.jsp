<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#userdetail_div{
	border: 1px black solid;
	height:600px;
	margin-left:100px;
	margin-top:50px;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	border-radius: 10px 10px 10px 10px;
	font-weight: bold;
	text-align:center;
	position: relative;
	top: 50px;
}

#userdetail_div2{
	border: 1px black solid;
	height:900px;
	margin-left:100px;
	margin-top:50px;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	border-radius: 10px 10px 10px 10px;
	font-weight: bold;
	text-align:center;
	position: relative;
	top: 50px;
}

.side{
	margin-top:10px;
	margin-bottom:10px;
}


div[title="userdetail_div2"]{
	border: 1px black solid;
	height:300px;
}
body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;
}
h1{
	position: relative;
	top: 50px;
	left: 6%;
	text-shadow: 1px 1px 1px gray;
}
#h4_sub{
	position: relative;
	top: 40px;
}
#sidenav{
	position: relative;
	top: 40px;
}

</style>
<script type="text/javascript">
	window.onload = function(){
		var selectedLevel = '<c:out value="${userdetail.levelNo}"/>';
		var levelBox = document.getElementById("levelSelect");
		for(var i=0; i<levelBox.length;i++){
			if(levelBox[i].value==selectedLevel){
				levelBox[i].selected=true;
			}
		}
		
		var selectedStatus = '<c:out value="${userdetail.statusNo}"/>';
		var statusBox = document.getElementById("statusSelect");
		for(var i=0; i<statusBox.length;i++){
			if(statusBox[i].value==selectedStatus){
				statusBox[i].selected=true;
			}
		}
		
		var selectedData = '<c:out value="${category}"/>';
		console.log(selectedData);
		var selectBox = document.getElementById("category");
		for(var i=0; i<selectBox.length;i++){
			if(selectBox[i].value==selectedData){
				selectBox[i].selected=true;
				}
			}
	}
</script>
</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	
	<div class="container" style="text-align:center; color:white;">
		<h1>회원 조회</h1>
	</div>
	<div class="row">
		<!-- 좌측 nav  -->
		<div class="container col-sm-2" id="userdetail_div">
			<div class="row flex-nowrap">
    			<div class="col-3 bd-sidebar text-center">
    			<br>
    			<h4  id="h4_sub">회원 관리</h4>
      				<ul class="nav" id="sidenav">
				        <li class="side"><a href="adminController?command=userList">회원 목록</a></li>
				        <li class="side"><a href="adminController?command=userList&adminCheck=true">관리자 목록</a></li>
      				</ul>
      		
      			<h4  id="h4_sub">게시판 글 처리</h4>
      			     <ul class="nav" id="sidenav">
				        <li class="side"><a href="adminController?command=waitList&status=0">승인 대기중인 글</a></li>
				        <li class="side"><a href="adminController?command=waitList&status=2">승인 거절된 글</a></li>
      				</ul>
      			
      			<h4  id="h4_sub">공지사항</h4>
      		      	<ul class="nav" id="sidenav">
				        <li class="side"><a href="adminNotice.jsp">게시판 공지사항</a></li>
      				</ul>
    			
    			<h4  id="h4_sub">신고 관리</h4>
    			    <ul class="nav" id="sidenav">
				        <li class="side"><a href="adminReportboard.jsp">신고 목록</a></li>
      				</ul>
      			</div>
    		</div>
		</div>
		<!-- 우측, 회원정보와 작성 글 목록  -->
		<div class="container col-sm-6" id="userdetail_div2">
			<div class="row">
				<!-- 회원 정보 -->
				<div class="container col-sm-12" id="subsub" title="userdetail_div2">
					<h4>회원 정보</h4>
					<!-- 추가 작업 필요함  -->
					<form class="form-horizontal" action="adminController" method="post">
					<input type="hidden" name="command" value="userUpdate">
					<div class="row">
						<div class="container col-sm-12" style="height:100px;">
		  						<div class="form-group" style="margin-top:25px;">
		    						<label for="email" class="col-sm-2 control-label">이메일</label>
		    							<div class="col-sm-3">
		      								<input type="email" class="form-control" id="email" name="email" aria-describedby="sizing-addon2" value="${userdetail.email }" readonly="readonly">
		    							</div>
							  		<label for="createdAt" class="col-sm-2 control-label">가입일</label>
							  			<div class="col-sm-3">
		      								<input type="text" class="form-control" id="createdAt" aria-describedby="sizing-addon2" value="${userdetail.createdAt }" readonly="readonly">
		    							</div>
							  	</div>
						</div>
						<div class="container col-sm-12" style="height:100px;">
							<div class="form-group" style="margin-top:20px;">
		    					<label for="nickname" class="col-sm-2 control-label">별명</label>
		    						<div class="col-sm-3">
		      							<input type="email" class="form-control" id="nickname" aria-describedby="sizing-addon2" value="${userdetail.nickname}" readonly="readonly">
		    						</div>
							  	<label for="" class="col-sm-2 control-label">상태</label>
							  		<div class="col-sm-3">
		      					  		<select class="form-control" id="statusSelect" name="statusSelect">
    										<option value="1">활동</option>
    										<option value="2">정지</option>
    										<option value="3">탈퇴</option>
  										</select>
		    						</div>
							 </div>
						</div>
						<div class="container col-sm-12" style="height:60px;">
							<div class="form-group" style="margin-top:10px;">
								<label for="" class="col-sm-2 control-label">직위</label>
							  		<div class="col-sm-3">
		      					  		<select class="form-control" id="levelSelect" name="levelSelect">
    										<option value="3">회원</option>
    										<option value="2">부관리자</option>
  										</select>
		    						</div>
							<input type="submit" class="btn btn-primary" style="margin-left:200px;" value="변경">
		    				</div>
						</div>
					</div>
					</form>
				</div>
			</div>
			<!-- 작성 글 목록  -->
			<div class="row">
				<div class="container col-sm-12" id="subsub" title="userdetail_div2" style="height:600px">
					<h4>작성 글 목록</h4>
					<form class="form-horizontal" action="adminController" method="post">
						<input type="hidden" name="command" value="userdetail">
						<input type="hidden" name="email" value="${userdetail.email}">
						<div class="container" style="margin-top:10px">
							<div class="col-sm-2">
		      					<select class="form-control" name="category" id="category">
    								<option value="매장">매장</option>
    								<option value="온라인">온라인 쇼핑</option>
    								<option value="영화">영화</option>
    								<option value="책">책</option>
  								</select>
		    				</div>
		    			<input type="submit" class="btn btn-primary" value="검색">	
		    			</div>
		    		</form>
					<table class="table text-center table-hover" id="" style="margin-top:20px;">
						<thead>
							<tr>
								<th class="active text-center" style="width:200px">카테고리</th>
								<th class="active text-center" style="width:400px">제목</th>
								<th class="active text-center" style="width:200px">작성일</th>
							</tr>
						</thead>
						<tbody>
						<!-- 기능 구현시에 변경됨  -->
						<c:choose>
							<c:when test="${empty totalList }">
								<tr>
									<td colspan="4">작성된 글이 존재하지 않습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="list" items="${totalList}">
									<tr>
										<td>${list.categoryName }</td>
										<td>${list.title }</td>
										<td>${list.createAt }</td>
									</tr>		
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<hr>
					<!-- pagination 처리 필요함 -->
					<nav class="pull-bottom text-center">
						<c:set var="pageNum" value="${paging.pageNum }"/>
						<c:set var="startPage" value="${paging.startPage}"/>
						<c:set var="endPage" value="${paging.endPage}"/>
						<c:set var="totalPage" value="${paging.totalPage}"/>
						<c:set var="itemCount" value="${paging.itemCount}"/>
						<ul class="pagination">
							<li>
			      				<a href="adminController?command=userdetail&pageNum=1&category=${category}&email=${userdetail.email}" aria-label="Previous">
			        			<span aria-hidden="true">&laquo;</span>
			      				</a>
			    			</li>
						<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                			<c:if test="${ pageNum == item }">
                    			<li><a href="adminController?command=userdetail&pageNum=1&category=${category}&email=${userdetail.email}">${ item }</a></li>
                			</c:if>
                			<c:if test="${ pageNum != item }">
		 						<li><a href="adminController?command=userdetail&pageNum=${ item }&category=${category}&email=${userdetail.email}">${ item }</a></li>
                			</c:if>
            			</c:forEach>
            			<li>
			      			<a href="adminController?command=userdetail&pageNum=${totalPage}&category=${category}&email=${userdetail.email}" aria-label="Next">
			        		<span aria-hidden="true">&raquo;</span>
			      			</a>
			    		</li>
				</ul>
			
			</nav>
				</div>
			</div>			
		</div>

	</div>
	
	<br><br><br><br><br><br><br><br><br>
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>