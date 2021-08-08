<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.PostDTO"%>
<%@page import="dao.PostDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//하나의 페이지에 검색되어 출력될 게시글의 갯수 설정
	int pageSize = 10;
	
	//초기 페이지 또는 원래 있던 페이지 설정
	int pageNum = 1;
	if (request.getParameter("pageNum") != null) {
	 pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//요청 페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
	//ex) 1Page : 1, 2Page : 11, 3Page : 21, 4Page : 31,...
	int startRow = (pageNum - 1) * pageSize + 1;
	
	//요청 페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
	//ex) 1Page : 10, 2Page : 20, 3Page : 30, 4Page : 40,...
	int endRow = pageNum * pageSize;
	
	//Post테이블에서 글 종류 notice, REVIEW, QUESTION인 행 모두 호출 
	List<PostDTO> postList = PostDAO.getDAO().selectAllPostListGeneral("QUESTION", startRow, endRow);
	
	//전체 게시글의 갯수를 계산하여 저장
	int totalPost = PostDAO.getDAO().selectPostCount("QUESTION");
	
	//전체 페이지의 갯수를 계산하여 저장
	int totalPage=(int)Math.ceil((double)totalPost/pageSize);
	
	//전달된 페이지 번호가 비정상적인 경우
	if (pageNum <= 0 || pageNum > totalPost) {
	 pageNum = 1;
	}
	
	//페이지에 출력될 게시글에 대한 글번호 시작값을 계산하여 저장
	int number=totalPost-(pageNum-1)*pageSize;
	
	//마지막 페이지에 대한 처리 - 마지막 페이지 묶음의 최대 페이지수와 전체 게시글에서 나올 수 있는 페이지 수를 비교
	if (endRow > totalPost) {
	 endRow = totalPost;
	}
	
	//오늘 날짜 시간
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<title>관리자</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
h1 {
	text-align: center;
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	width: auto;
	border-collapse: collapse;
}

th, td {
	padding: 11px 50px 10px;
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

#wrap {
   width: 1200px;
}

.questionF input {
	font-size: 18px;
	border: none;
	padding-left: 1px;
	line-height: 20px;
	min-width: 300px;
	border-bottom: 1px solid white;
}

.questionF input:focus {
	outline: none;
}

#searchQ {
	width: 500px;
	margin: 0 auto;
	padding-top: 15px;
	text-align: center;
}

#searchBtn {
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 5px 5px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

#searchBtn:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}


#pageMove {
	margin: 5px auto;
	text-align: center;
	width: 1120px;
}

/*width 값 주고 가운데정렬 */
#wrap {
	width: 100;
	margin: 0 auto;      
}

#container {
   width: 1000px;
   margin: 0 auto;      
}

#container {
	/* 글 정렬 */
	text-align: center;
}

/**/
#pageMove {
	margin: 0 auto;   
}
</style>
</head>
<body>
	<div id="wrap">
		<%-- side 불러오기 --%>
		<jsp:include page="/admin/admin_side.jsp" />
		<!-- container start -->
		<div id="container">
			<!-- content area => 본문작성 -->
			<div id="content">
				<div class="controlArea">
					<h1>QUESTION 관리</h1>
				</div>
				<br>
				<div id="searchQ">
					<form method="post" name="qForm" class="questionF">
						검색 : <input type="text" name="post">
						<span id="postCheck"></span>
						<a type="button" id="searchBtn" >조회</a>
					</form>
				</div>
				<br>
				
				<div class="postlist">
					<form class="postTable">
						<table>
							<tr>
								<th>게시판 종류</th>
								<th>이메일</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
							
							<% for(PostDTO post:postList )  { %>
							<tr>
								<th>QUESTION</th>
								<th class="post_e"><%=post.getEmail() %></th>
								<th class="post_t"><%=post.getTitle() %></th>
								<th class="post_d"><%=post.getPosted_date() %></th>
								<th class="post_h"><%=post.getHit() %></th>
							</tr>
							<% } %>
						</table>
					</form>
				</div>
			
				<div id="pageMove">
				<%-- 페이지 번호 출력 및 링크 설정 - 페이징 처리 --%>
				<%
					//페이지 블럭에 출력될 페이지의 갯수 저장
					int blockSize = 5;
	
					//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장
					int startPage = (pageNum - 1) / blockSize * blockSize + 1;
	
					//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
					int endPage = startPage + blockSize - 1;
	
					//마지막 페이지 블럭의 종료 페이지 번호 변경
					if (endPage > totalPage) {
						endPage = totalPage;
					}
				%>
				<% if (startPage > blockSize) {//2번째 블럭 이상인 경우 - 링크 설정 %>
					<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=question_manager&pageNum=1">&lt;&lt;</a>
					<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=question_manager&pageNum=<%=startPage - blockSize%>">&nbsp;&nbsp;[이전]</a>
				<% } else { %>
					&lt;&lt;&nbsp;&nbsp;&nbsp;[이전]&nbsp;
				<% } %>
	
				<% for (int i = startPage; i <= endPage; i++) { %>
					<% if (pageNum != i) { %>
						<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=question_manager&pageNum=<%=i%>">[&nbsp;<%=i%>&nbsp;]</a>
					<% } else { %>
						<span style="font-size: 20px">[&nbsp;<%=i%>&nbsp;]
						</span>
					<% } %>
				<% } %>
	
				<% if (endPage != totalPage) {//마지막 페이지 블럭이 아닌 경우 - 링크 설정 %>
					<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=question_manager&pageNum=<%=startPage + blockSize%>">&nbsp;[다음]</a>
					<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=question_manager&pageNum=<%=totalPage %>">&nbsp;&nbsp;&gt;&gt;</a>
				<% } else { %>
					[다음]&nbsp;&nbsp;&nbsp;&gt;&gt;
				<% } %>
				<div>&nbsp;</div>
			</div>
			</div>
			
			
		</div>
	</div>
</body>
</html>