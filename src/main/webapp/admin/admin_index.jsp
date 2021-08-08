<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
String category=request.getParameter("category");

if(category==null) {
	response.sendRedirect("admin_main.jsp");
	return;
}
	
String forwardFilePath=category+".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
img {
	width: 400px;
	height: 500px;
}

#container .main {
	/* 글 정렬 */
	text-align: center;
}

#container .mainImg li {
	display: inline;
}

#container .mainImg img {
	margin: 10px;
}

h1 {
	text-align: center;
}

.area {
	margin: 0 auto;
	padding: 150px 350px;
}

p {
	text-align: center;
	font-size: 30px;
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
				<jsp:include page="<%=forwardFilePath %>"/>	
				<div class="manager">
					<h1>관리자</h1>
				</div>
				<form class="managerTable">
					<div class="area">
						<p>관리자 페이지입니다.</p>
						<!-- <jsp:include page="" /> -->
					</div>
				</form>
			</div>
		</div>
		<!-- container end -->

	</div>
</body>
</html>