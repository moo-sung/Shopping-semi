<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>MyPage</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
#naviBtn {
	margin: 30px auto 80px;
}

#naviBtn ul {
	text-align: center;
}

#naviBtn .btn {
	display: inline-block;
	width: 120px;
	margin: 5px;
	box-sizing: border-box;
	text-align: center;
}

#naviBtn .btn h3 {
	font-size: 0.9em;
}

#naviBtn .btn h3 a {
	display: block;
	width: 100%;
	padding: 40px 0;
	border: 1px solid white;
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}

#naviBtn .btn h3 a:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
}

#orderList {
	margin: 20px auto 0;
	max-width: 700px;
	border: 1px solid white;
}

#orderList .title {
	padding: 11px 21px;
	margin: 0;
	border-bottom: 1px solid white;
}

#orderList .state {
	padding: 20px 0;
}

#orderList .state ul {
	text-align: center;
}

#orderList .state li {
	display: inline-block;
	padding: 10px 23px;
	text-align: center;
	width: 120px;
}

#orderList .state a {
	display: inline-block;
	/* width: 170px; */
	font-size: 14px;
	width: 100%;
	height: 100%;
}

#orderList .state span {
	display: block;
	text-align: center;
}
</style>
</head>
<body>
	<div class="titleArea">
		<h1>My Page</h1>
		<br>
	</div>

	<div id="naviBtn">
		<ul>
			<li class="btn order">
				<h3>
					<a href="#"> Order<br> 주문내역 조회
					</a>
				</h3>
			</li>
			<li class="btn profile">
				<h3>
					<a href="<%=request.getContextPath()%>/moosung/profile.jsp">
						Profile<br> 회원 정보
					</a>
				</h3>
			</li>
			<li class="btn cart">
				<h3>
					<a href="<%=request.getContextPath()%>/minjeong/cart.jsp">
						Cart<br> 장바구니 조회
					</a>
				</h3>
			</li>
			<li class="btn board">
				<h3>
					<a href="#"> Board<br> 게시물 관리
					</a>
				</h3>
			</li>
			<li class="btn address">
				<h3>
					<a id = "address_search" style="cursor: pointer;"> Address<br> 주소록 관리
					</a>
				</h3>
			</li>
		</ul>
	</div>

	<div id="orderList">
		<div class="title">
			<h3>나의 주문처리 현황</h3>
		</div>
		<div class="state">
			<ul class="deli">
				<li style="border-right: 1px solid white;"><a>입금전</a> <span id = "waiting">0</span>
				</li>
				<li style="border-right: 1px solid white;"><a>배송준비중</a> <span id = "pay">0</span>
				</li>
				<li style="border-right: 1px solid white;"><a>배송중</a> <span id = "delivery">0</span>
				</li>
				<li style="border-right: 1px solid white;"><a>배송완료</a> <span id = "arrive">0</span>
				</li>
			</ul>
		</div>
	</div>
<script type="text/javascript">
$("document").ready(function () {
	<%
	
	%>
	
	
	var waiting = ;
	var pay = ;
	var delivery = ;
	var arrive = ;
	$("#waiting span").text();
	$("#pay span").text();
	$("#delivery span").text();
	$("#arrive span").text();
})

$("#address_search").click(function() {
	window.open("<%=request.getContextPath()%>/moosung/address_list.jsp"
			,"주소록","width=1000,height=800,left=100,top=50");
});
</script>

</body>
</html>