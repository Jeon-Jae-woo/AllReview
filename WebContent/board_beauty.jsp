<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
border: 1px red dotted;
padding-top:20px;
height: 900px;

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



</style>
<!-- ------------------------------------------------------------------------------ -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>








<!-- ------------------------------------------------------------------------------- -->
</head>
<body>
	<h1>메인 게시판</h1>
	<!-- Navigation -->
		<!-- 임시 index -->
	<%@ include file="Fix/header.jsp" %>
	
	<!-- Header -->
	<header>
		<div class="nmdiv"> <!-- 최상단 카테고리4개, 온라인쇼핑카테고리12개 --> <!-- li안에 div 불가 -->
			<div>
				<ul id="mainca">
					<li id="online">
						<strong>온라인쇼핑</strong>
						<ul id="subca1">
							<li>패션</li>
							<li>뷰티</li>
							<li>식품</li>
							<li>홈/생활용품</li>
							<li>PC/디지털</li>
							<li>가전</li>
						</ul><br><br>
						<ul id="subca2">
							<li>출산/육아</li>
							<li>의료/건강</li>
							<li>문구/취미</li>
							<li>스포츠/레저</li>
							<li>반려동물용품</li>
							<li>자동차</li>
						</ul>
					</li>
					<li id="movie"><strong>영화</strong></li>
					<li id="shop"><strong>매장</strong></li>
					<li id="book"><strong>도서</strong></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- Section -->
	<section>
		<div id="secmain">
			<form>
				<h2>뷰티게시판</h2> 
				
			
				<select id="cate_de" onchange="if(this.value) location.href=(this.value);" >
					<optgroup label="카테고리 선택"> 
					<option value="controller.do?command=list">전체</option>
					<option value="controller.do?command=fashion">패션</option>
					<option value="controller.do?command=beauty">뷰티</option>
					<option value="controller.do?command=food">식품</option>
					<option value="controller.do?command=home">홈/생활용품</option>
					<option value="controller.do?command=digital">PC/디지털</option>
					<option value="controller.do?command=appliances">가전</option>
					<option value="controller.do?command=childcare">출산/육아</option>
					<option value="controller.do?command=medical">의료/건강</option>
					<option value="controller.do?command=hobby">문구/취미</option>
					<option value="controller.do?command=sports">스포츠/레저</option>
					<option value="controller.do?command=pet">반려동물용품</option>
					<option value="controller.do?command=car">자동차</option>
					</optgroup>
				</select>
			
				<!-- 전체검색 -->
				<input type="text" value="게시글 검색" id="search_all" onFocus="this.value=''; return true;">
				<input type="button" value="검색" id="search_bt" onclick=""> 
				
				<!-- 추천,조회,최신순 버튼-->
				<div id="lineup">
					<ul>
						<li id="recentli"><button id="recentbt" type="button" onclick="">최신순</button></li>
						<li id="hitsli"><button id="hitsbt" type="button" onclick="">조회순</button></li>
						<li id="recomdli"><button id="recomdbt" type="button" onclick="">추천순</button></li>
					</ul>
				</div>
				
<!-- ------------------------------------------------------------------------- -->
				
				
				<!-- 글 조회 수정필요 -->
		<table border="1" summary="게시판 목록">

           <caption>전체 글 목록</caption>

           <colgroup>
               <col width="80" />
               <col width="150" />
               <col width="500" />
               <col width="130" />
               <col width="130" />
               <col width="80" />
               <col width="80" />
               <col width="80" />
           </colgroup>  

           <thead>
               <tr>
                    <th>글번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>추천</th>
                    <th>조회</th>
                    <th>평점</th>
               </tr>
           </thead>

           <tbody>
              <tr class="tbody">
              <c:choose>
              	<c:when test="${empty beauty }">
              		<tr>
              			<td colspan="8">----------------작성된 글이 존재하지 않습니다----------------</td>
              		</tr>              
              	</c:when>
              	<c:otherwise>
              		<c:forEach var="dto" items="${beauty }">
              			<tr>
              				<td>${dto.online_board_id }</td>
              				<td>${dto.category_detail_id }</td>
              				<td><a href="controller.do?command=detail&online_board_id=${dto.online_board_id }">${dto.online_title }</a></td>
              				<td>${dto.nickname}</td>
              				<td>${dto.createat }</td>
              				<td>${dto.recomd }</td>
              				<td>${dto.hits }</td>
              				<td>${dto.satavg }</td>
              			</tr>
              		</c:forEach>
              	</c:otherwise>
              	
              </c:choose>
              </tr>
           </tbody>

           <tfoot>
               <tr>
                    <td align="center" colspan="8">1</td>
               </tr>

           </tfoot>

       </table>
				
				<!--  ////글 조회 수정 필요 -->
				
				
<!-- --------------------------------------------------------------------------- -->				
				
				
			</form>
			<!-- 글쓰기 버튼 -->
			<input type="button" value="글 쓰기" onclick="location.href='controller.do?command=writeform'">
			
		</div>
	</section>
	
	<!-- 1,2,3,4,5 페이지 이동 기능 jsp 코드 들어가야함 -->
	
	
	<hr>
	<!-- Footer -->
		<%@ include file="Fix/footer.jsp" %>
</body>
</html>