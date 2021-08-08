<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
List<CartDTO> cartList = CartDAO.getDAO().selectAllCartList(loginMember.getEmail());
List<ProductDTO> productList = new ArrayList<ProductDTO>();
for (CartDTO cart : cartList) {
	String productIdx = cart.getProduct_idx();
	ProductDTO product = ProductDAO.getDAO().selectProduct(productIdx);
	productList.add(product);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
.titleArea h1 {
	margin: 0 0 30px;
	text-align: center;
}

.basketinfo .menu {
	text-align: center;
	border-bottom: 0.3px solid rgb(207, 207, 207);
	max-width: 180px;
	margin: 0 auto;
}

.basketinfo .menu p {
	font-size: 18px;
	margin: 20px 20px 12px;
	padding: 13px 10px 0px;
}

.order-empty p {
	margin: 100px 0;
	text-align: center;
}

.removeBtn {
	text-align: center;
}

.removeBtn .textAndBtn {
	margin-right: 620px;
}

.removeBtn #removeAllBtn {
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	color: rgb(13, 13, 13);
	width: 125px;
	height: 35px;
	padding: 6px 12px;
}

.removeBtn #removeAllBtn:hover {
	background-color: rgb(13, 13, 13);
	border: 1px solid rgb(207, 207, 207);
	color: rgb(207, 207, 207);
}

.basket_btn {
	margin: 0 auto;
	width: 400px;
	height: 50px;
	font-size: 1.2em;
	cursor: pointer;
	padding: 12px 0;
	text-align: center;
	margin-top: 10px;
}

.basket_btn .submitAllBtn {
	font-weight: bold;
	color: rgb(13, 13, 13);
	background-color: rgb(171, 195, 159);
	padding: 11px 27px 11px;
	border: none;
}

.basket_btn .submitAllBtn:hover {
	background-color: rgb(13, 13, 13);
	border: 1px solid rgb(207, 207, 207);
	color: rgb(207, 207, 207);
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	border-collapse: collapse;
	width: 900px; 
}

th {
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

td {
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

.price .count {
	display: inline-block;
	position: relative;
	vertical-align: top;
}

.count #down .downBtn {
	position: static
}

.cartTable table {
	font-size: 13px;
}

.cartTable table input {
	text-align: center;
}

.name{
	cursor: pointer;
}

.name:hover{
	border-bottom: 1px solid rgb(207, 207, 207)
}

.cartTable .quantity button {
	background-color: rgb(13, 13, 13);
	border: 1px solid rgb(207, 207, 207);
	color: rgb(207, 207, 207);
	padding: 4px 8px;
	margin: 8px 5px 8px;
}

.cartTable .quantity button:hover {
	background-color: rgb(207, 207, 207);
	border: 1px solid rgb(13, 13, 13);
	color: rgb(13, 13, 13);
}

.name, .price, .total {
	border: none;
	font-size: 15px;
}

.name, .price, .total:focus {
	outline: none;
}

</style>
</head>
<body>
	<div class="titleArea">
		<h1>Shopping Cart</h1>
	</div>
	<div class="basketinfo">
		<div class="menu">
			<p>국내배송상품</p>
		</div>
	</div>
	<br>
	<%-- 있으면 목록 출력 없으면 비어있음 표시--%>
	<%
	if (cartList.isEmpty()) {
	%>
	<p>Your cart is empty</p>
	<%
	} else {
	%>
	<div class="cartlist">
		<form class="cartTable" action="">
			<table>
				<tr>
					<th>Item</th>
					<th>Qty</th>
					<th>Price</th>
					<th>Total</th>
				</tr>
				<%
				int i = 0;
				for (; i < productList.size(); i++) {
				%>
				<tr>
					<td><input type="hidden" id="productIdx<%=i%>"
						name="productIdx<%=i%>"	value="<%=cartList.get(i).getProduct_idx()%>">
						<input type = "button" id="name<%=i%>" class="name" name="name"
						value="<%=productList.get(i).getName()%>">
					</td>
					<td id="quantity<%=i%>" class="quantity">
						<span class="count">
							<input type="text" id="cnt<%=i%>" value="1" readonly="readonly"
							style="width: 20px; border: none;">
							<a href="#none"	id="up">
								<img src="<%=request.getContextPath()%>/namkyu/image/btn_count_up.gif"
									id="up<%=i%>" class="upBtn" onclick="up(<%=i%>)">
							</a>
						<a href="#none" id="down">
							<img src="<%=request.getContextPath()%>/namkyu/image/btn_count_down.gif" id="down<%=i%>"
								class="downBtn" onclick="down(<%=i%>)">
						</a>
						<br>
							<button id="button<%=i%>">edit</button>
						</span>
					</td>

					<td>
						<input type="hidden" id="real_price<%=i%>">
						<input id="price<%=i%>" class="price" name="price"
						value="<%=productList.get(i).getPrice()%>"
						readonly="readonly"></td>
					<td><input id="total<%=i%>" class="total" name="total" readonly="readonly">
					</td>
				</tr>
				<%}%>
			</table>
		</form>
		<div class="removeBtn">
		<span>
			<button type="button" id="removeAllBtn">장바구니비우기</button>
		</span>
	</div>
</div>
	<br>
	<div class="basket_btn">
		<input type="submit" class="submitAllBtn" value="전체상품 주문">
	</div>
	<%}%>
	<script type="text/javascript">
		$("document").ready(function() {
			<% for (int i =0; i< productList.size(); i++) {%>
			var price = <%=productList.get(i).getPrice()%>;
			document.getElementById("price"+<%=i%>).setAttribute("value", price.toLocaleString());
			document.getElementById("total"+<%=i%>).setAttribute("value", price.toLocaleString());
			<%}%>
		})
	
		var count = [];
		
		function up(i) {
			var price = document.getElementById("real_price"+i).value;
			if(count[i]==undefined) {		
				count[i]=1;
			}
			count[i]++;
			document.getElementById("cnt"+i).setAttribute("value", count[i]);
			document.getElementById("total"+i).setAttribute("value", price*count[i].toLocaleString());
			return;
		}
		
		function down(i) {
			var price = document.getElementById("real_price"+i).value;
			if(count[i]==undefined) {
				count[i]=1;	
			}
				count[i]--;						
			if(count[i]<=0) {
				count[i]=0;
			}	
			document.getElementById("cnt"+i).setAttribute("value", count[i]);
			document.getElementById("total"+i).setAttribute("value", price*count[i].toLocaleString());
			return;
		}			
	$("#removeAllBtn").click(function() {
		if(window.confirm("장바구니를 비우시겠습니까?")) {
			location.href="<%=request.getContextPath()%>/index.jsp?workgroup=minjeong&work=cart_clear";}
	});
	
	$("#submitAllBtn").click(function() {
		location.href = "";
	});
	</script>
</body>
</html>