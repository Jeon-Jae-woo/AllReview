<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#adminpage_div{
		border: 1px black solid;
		height:600px;
		margin-left:100px;
		margin-top:50px;
	}
	
	#adminpage_div2{
		border: 1px black solid;
		height:600px;
		margin-left:100px;
		margin-top:50px;
	}
	
	.side{
		margin-top:10px;
		margin-bottom:10px;
	}
		
</style>
</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	
	<div class="container" style="text-align:center;">
		<h1>게시판 공지사항 작성</h1>
	</div>
	<div class="row">
		<!-- 좌측 nav -->
		<div class="container col-sm-2" id="adminpage_div">
			<div class="row flex-nowrap">
    			<div class="col-3 bd-sidebar text-center">
    			<br>
    			<h4>회원 관리</h4>
      				<ul class="nav">
				        <li class="side"><a href="adminUserlist.jsp">회원 목록</a></li>
				        <li class="side"><a href="adminList.jsp">관리자 목록</a></li>
      				</ul>
      		
      			<h4>게시판 글 처리</h4>
      			     <ul class="nav">
				        <li class="side"><a href="adminWaitboard.jsp">승인 대기중인 글</a></li>
				        <li class="side"><a href="adminRefusalboard.jsp">승인 거절된 글</a></li>
      				</ul>
      			
      			<h4>공지사항</h4>
      		      	<ul class="nav">
				        <li class="side"><a href="adminNotice.jsp">게시판 공지사항</a></li>
      				</ul>
    			
    			<h4>신고 관리</h4>
    			    <ul class="nav">
				        <li class="side"><a href="adminReportboard.jsp">신고 목록</a></li>
      				</ul>
      			</div>
    		</div>
		</div>
		<!-- 우측 글 작성 -->
		<div class="container col-sm-6 text-center" id="adminpage_div2">
				<!-- 추가 작업 필요  -->
				<form class="form-horizontal" action="" method="post">
					<div class="row" style="margin-top:20px;">
						<div class="container col-sm-12" style="height:100px;">
							<!-- 제목, 카테고리 -->
		  					<div class="form-group" style="margin-top:25px;">
		    					<label for="inputEmail" class="col-sm-2 control-label">제목</label>
		    						<div class="col-sm-4">
		      							<input type="text" class="form-control" id="inputEmail" aria-describedby="sizing-addon2">
		    						</div>
							  	<label for="category" class="col-sm-2 control-label">카테고리</label>
							  	<div class="col-sm-3">
		      				  		<select class="form-control">
    									<option>온라인 쇼핑</option>
    									<option>매장</option>
    									<option>책</option>
    									<option>영화</option>
  									</select>
	    						</div>
						  	</div>
						</div>
						<!-- 내용  -->
						<div class="container col-sm-12" style="height:250px;">
							<div class="form-group" style="margin-top:20px;">
		    					<label for="notice_content" class="col-sm-2 control-label">내용</label>
		    						<div class="col-sm-7">
		      							<textarea class="form-control" rows="9" cols="11" id="notice_content"></textarea>
		    						</div>	
							 </div>
						</div>
						<!-- 업로드  -->
						<div class="container col-sm-12" style="height:60px;">
							<div class="form-group" style="margin-top:10px;">
								<label for="" class="col-sm-2 control-label">업로드</label>
							  	<div class="col-sm-3">
							  		<div class="form-group">
  										<input type="file" id="ex_file"> 
									</div>
		    					</div>
		    				</div>
						</div>
						<!-- 제출 -->
						<div class="container col-sm-12" style="height:100px; margin-top:40px;">
							<div class="form-group" style="margin-top:10px;">
								<button type="submit" class="btn btn-primary" style="margin-right:20px;">글작성 </button>
								<button type="submit" class="btn btn-primary">취소 </button>
							</div>
						</div>
					</div>
				</form>
			</div>      
		</div>
		

	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>