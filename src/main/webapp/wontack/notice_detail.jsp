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
table {
	width: 1200px;
	margin: 5px auto;
	border: 0.5px solid white;
	border-collapse: collapse;
}


td {
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

#listBox {
	text-align: right;
	margin: 40px 0px 40px 0px;
	
}

#listBtn:hover {
	background-color: white;
	color: black;
}

#listBtn {
	border: 0.5px solid white;
	padding: 10px;
}

#main {
	width: 1200px;
	margin: 5px auto;
	border-collapse: collapse;
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
}

</style>
</head>
<body>
	<div class="main" id="main">
		<p class="titleArea">N&nbsp;&nbsp;o&nbsp;&nbsp;t&nbsp;&nbsp;i&nbsp;&nbsp;c&nbsp;&nbsp;e</p>

		<table id="tableTop">
			<tr>
				<td style="text-align: left;">
					<p><%=post.getTitle() %></p>
					<p>&nbsp;</p>
					<p>Writer&nbsp;&nbsp;[관]<%=post.getEmail().split("@")[0]%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hit&nbsp;&nbsp;
						<%=post.getHit() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date&nbsp;&nbsp;<%=post.getPosted_date().substring(0,16) %></p>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;"><span> <%=post.getContent() %>
				</span></td>
			</tr>
		</table>

		<div id="listBox">

			<%-- List 버튼 누른 경우 --%>
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=notice&pageNum=<%=pageNum %>" id="listBtn">
				&nbsp;&nbsp;L&nbsp;i&nbsp;s&nbsp;t&nbsp;&nbsp;
			</a>
		</div>

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