<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

//하나의 페이지에 검색되어 출력될 게시글의 갯수 설정
int pageSize = 5;

//초기 페이지 또는 원래 있던 페이지 설정
int pageNum = 1;
if (request.getParameter("pageNum") != null) {//전달값이 있는 경우
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}

//요청 페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
//ex) 1Page : 1, 2Page : 11, 3Page : 21, 4Page : 31,...
int startRow = (pageNum - 1) * pageSize + 1;

//요청 페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
//ex) 1Page : 10, 2Page : 20, 3Page : 30, 4Page : 40,...
int endRow = pageNum * pageSize;

//Post테이블에서 글 종류가 notice인 행 모두 호출
List<PostDTO> postList = PostDAO.getDAO().selectAllPostListGeneral("REVIEW", startRow, endRow);


//공지사항 NOTICE의 전체 게시글의 갯수를 계산하여 저장
int totalPost = PostDAO.getDAO().selectPostCount("REVIEW");

//공지사항 NOTICE의 전체 페이지의 갯수를 계산하여 저장
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

//postIdx로 인스턴스 전달받아 저장
PostDTO post=PostDAO.getDAO().selectPost(request.getParameter("postIdx"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
#tableTop {
	width: 1200px;
	margin: 5px auto;
	border: 0.5px solid white;
	border-collapse: collapse;
}


#tableTop td {
	height: 40px;
	border: 0.5px solid white;
	padding: 20px;
}

#title {
	padding: 20px;
	margin: 5px auto;
	text-align: center;
	width: 1000px;
}

.mainContet {
	width: 1000px;
	margin: 0px auto;
	border: 0.5px solid white;
	padding: 20px;
	border-collapse: collapse;
}

#listBox, #modifyBox {
	margin: 40px 0px 40px 0px;
	border: 0.5px solid white;
	
}


#listBtn:hover {
	background-color: white;
	color: black;
}

#deleteBtn:hover {
	background-color: white;
	color: black;
}

#editBtn:hover {
	background-color: white;
	color: black;
}

#listBtn {
	border: 0.5px solid white;
	padding: 10px;
}

#deleteBtn {
	border: 0.5px solid white;
	padding: 10px;
}

#editBtn {
	border: 0.5px solid white;
	padding: 10px;
}

#main {
	width: 1200px;
	margin: 5px auto;
	border-collapse: collapse;
}

.other {
	height: 10px;
	width: 100px;
	border: 0.5px solid white;
	padding: 20px;
	text-align: center;
}

.otherSubject {
	height: 10px;
}

#dual {
	width: 1200px;
	margin: 40px 0px 40px 0px;
	border-collapse: collapse;
	border: 0px;
}

#dualLeft {
	padding: 0px;
	margin: 40px 0px 40px 0px;
	text-align: left;
}

#dualRight {
	padding: 0px;
	margin: 40px 0px 40px 0px;
	text-align: right;
}
.other {
	height: 30px;
	width: 100px;
	border: 0.5px solid white;
	padding: 10px;
	text-align: center;
}
.otherSubject {
	height: 30px;
	padding: 10px;
	border: 0.5px solid white;
}
#tableBottom {
	width: 1200px;
	margin: 5px auto;
	border: 0.5px solid white;
	border-collapse: collapse;
}
.otherSubject {
	height: 30px;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="main" id="main">
		<p class="titleArea">R&nbsp;&nbsp;e&nbsp;&nbsp;v&nbsp;&nbsp;i&nbsp;&nbsp;e&nbsp;&nbsp;w</p>

		<table id="tableTop">
			<tr>
				<td style="text-align: left;"><span>Item&nbsp;&nbsp;</span> <a
					href="#"><span>[silver] 아주이쁜 목걸이</span></a></td>
			</tr>
			<tr>
				<td style="text-align: left;">
					<p>
						<span style="border: 0.5px solid; padding: 3px;">상품 후기</span>&nbsp;&nbsp;&nbsp;&nbsp;배송
						언제오나요 도대체?
					</p>
					<p>&nbsp;</p>
					<p>
						Writer&nbsp;&nbsp;<%=post.getEmail().split("@")[0] %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date&nbsp;&nbsp;
						<%=post.getPosted_date().substring(0,16) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hit&nbsp;&nbsp;<%=post.getHit() %></p>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;"><span> <%=post.getContent() %>
				</span></td>
			</tr>
		</table>

		<table id="dual">
			<tr>
				<td id="dualLeft"><a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review&pageNum=<%=pageNum %>" id="listBtn">&nbsp;&nbsp;L&nbsp;i&nbsp;s&nbsp;t&nbsp;&nbsp;</a>
				</td>
				<td id="dualRight"><a href="#" id="deleteBtn">&nbsp;&nbsp;D&nbsp;e&nbsp;l&nbsp;e&nbsp;t&nbsp;e&nbsp;&nbsp;</a>
				</td>

			</tr>
		</table>

		<table id="tableBottom">
			<tr>
				<td class="other">
					<p>▲&nbsp;이전글</p>
				</td>
				<td class="otherSubject"><a href="#">아주 중요한 내용입니다</a></td>
			</tr>
			<tr>
				<td class="other">
					<p>▼&nbsp;다음글</p>
				</td>
				<td class="otherSubject"><a href="#">아주 중요한 내용입니다</a></td>
			</tr>
		</table>
	</div>
</body>
</html>