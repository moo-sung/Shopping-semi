<%@page import="dto.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PostDTO post=PostDAO.getDAO().selectPost(request.getParameter("postIdx"));
	
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));
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
</style>
</head>
<body>
	<div class="main" id="main">
		<p class="titleArea">Q&nbsp;&nbsp;u&nbsp;&nbsp;e&nbsp;&nbsp;s&nbsp;&nbsp;t&nbsp;&nbsp;i&nbsp;&nbsp;o&nbsp;&nbsp;n</p>

		<table id="tableTop">
			<tr>
				<td>
					<span>Item&nbsp;&nbsp;</span>
					<%-- 아이템 누르면 아이템 제품 페이지로 이동 --%>
					<a href="#">
						<%-- 아이템명 --%>
						<span>[silver] 아주이쁜 목걸이</span>
					</a>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;">
					<p>
						<%-- 작성 영역에서 종류를 세션으로 전달하여 받아 저장 --%>
						<span style="border: 0.5px solid; padding: 3px;">배송 문의</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<%-- 그냥 제목 --%>
						<%=post.getTitle() %>
					</p>
					<p>&nbsp;</p>
					<p>Writer&nbsp;&nbsp;<%=post.getEmail().split("@")[0] %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date&nbsp;&nbsp;<%=post.getPosted_date().substring(0,16) %></p>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;">
					<span>
						<%=post.getContent() %>
					</span>
				</td>
			</tr>
		</table>

		<table id="dual">
			<%-- 하단에 List를 왼쪽으로 Delete / Edit을 오른족으로 보내기위한 테이블 --%>
			<tr>
				<%-- List 버튼 누를 경우 --%>
				<td id="dualLeft">
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=question&pageNum=<%=pageNum %>" id="listBtn">&nbsp;&nbsp;L&nbsp;i&nbsp;s&nbsp;t&nbsp;&nbsp;</a>
				</td>
				<%-- Delete / Edit 버튼을 누른 경우 액션 페이지로 안내하여 처리 --%>
				<td id="dualRight">
					<a href="#" id="deleteBtn">&nbsp;&nbsp;D&nbsp;e&nbsp;l&nbsp;e&nbsp;t&nbsp;e&nbsp;&nbsp;</a>
					<a href="#" id="editBtn">&nbsp;&nbsp;E&nbsp;d&nbsp;i&nbsp;t&nbsp;&nbsp;</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>