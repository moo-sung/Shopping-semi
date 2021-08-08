<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nookyoon</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
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
	text-align: center;
}

#container .mainImg li {
	display: inline;
}

#container .mainImg img {
	margin: 10px;
}
</style>
</head>
<body>
	<div class="mainImg">
		<ul>
			<li><a href="#"><img
					src="https://via.placeholder.com/400x500" /></a></li>
			<li><a href="#"><img
					src="https://via.placeholder.com/400x500" /></a></li>
			<li><a href="#"><img
					src="https://via.placeholder.com/400x500" /></a></li>
		</ul>
	</div>
</body>
</html>