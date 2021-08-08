<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
#contents {
	margin: 0 auto;
	padding: 130px 0 80px;
}

h1 {
	text-align: center;
}

.area {
	width: auto;
	text-align: center;
	font-size: 20px;
	padding: 100px 80px;
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
				<div class="manager">
					<h1>관리자</h1>
				</div>
				<div class="area">
					<h1>관리자 페이지입니다.</h1>

					<!-- <jsp:include page="" /> -->
				</div>
			</div>
		</div>
		<!-- container end -->

	</div>
</body>
</html>