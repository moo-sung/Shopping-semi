<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>nookyoon</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
#contents {
	margin: 0 auto;
	padding: 200px 0;
	max-width: 1200px;
}

.titleArea {
	text-align: center;
}

.spForm table {
	margin: 0 auto;
}

.spForm table th {
	font-size: 15px;
	text-align: left;
	padding: 25px 0;
	display: block;
	text-align: left;
}

.spForm table td {
	display: block;
	border-bottom: 1px solid white;
}

.spForm table th, td {
	min-width: 100px;
	max-width: 500px;
}

.spForm table th, td::after {
	content: "";
	display: block;
	clear: both;
}

.spForm table th span {
	float: right;
	font-size: 12px;
	opacity: 0.5;
}

.spForm table td span {
	float: right;
	font-size: 12px;
	opacity: 0.8;
}

.spForm table input {
	font-size: 18px;
	border: none;
	padding-left: 1px;
	line-height: 20px;
	min-width: 300px;
}

.pbutton {
	height: 49px;
	width: 300px;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 15px 30px;
	border: 15px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

.pbutton:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 2px solid rgb(207, 207, 207);
}

.searchPb {
	text-align: center;
	padding: 15px 1px;
	border: 15px;
}

.spForm table input:focus {
	outline: none;
}
</style>
</head>
<body>
	<div id="wrap">

		<!-- container start -->
		<div id="container">
			<!-- content area => 안에 내용들 다 지우고본문작성 -->
			<div id="content">

				<div class="titleArea">
					<h1>비밀번호 찾기</h1>
				</div>
				<div class="searchTable">

					<form id="spForm" class="spForm" method="post"
						action="<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=searchP_action">
						<table>
							<tbody>
								<tr>
									<th>이메일</th>
									<td><input type="text" id="email" name="email"><span
										id="emailcheck"></span></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" id="name" name="name"> <span
										id="nameCheck"></span></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" id="phone" name="phone"> <span
										id="phoneCheck"></span></td>
								</tr>
							</tbody>
						</table>
						<div class="searchPb">
							<button type="submit" class="pbutton">search Password</button>
						</div>
					</form>

				</div>
			</div>
		</div>
		<!-- container end -->
		<%-- footer 불러오기 --%>

		<script type="text/javascript">
			$(document).ready(function() {

			});
			$("#spForm").submit(function() {
				var submitResult = true;

				if ($("#email").val() == "") {
					$("#emailcheck").html("(이메일을 입력해 주세요.)");
					submitResult = false;
				}

				if ($("#name").val() == "") {
					$("#nameCheck").html("(이름을 입력해 주세요.)")
					submitResult = false;
				}

				var phoneReg = /^\d{2,3}-\d{3,4}-\d{4}$/;
				if ($("#phone").val() == "") {
					$("#phoneCheck").html("(전화번호를 입력해주세요)");
					submitResult = false;
				} else if (!phoneReg.test($("#phone").val())) {
					$("#phoneCheck").html("(올바른 전화번호를 입력해주세요)");
					submitResult = false;
				}

				return submitResult;
			});
		</script>
	</div>
</body>
</html>