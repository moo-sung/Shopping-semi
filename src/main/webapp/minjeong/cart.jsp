<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@include file="/security/login_url.jspf" %> --%>
<%
//세션 로그인한 유저의 이메일 받아서 파라메타에 저장해주기 -> 변경해야함 
List<CartDTO> cartList = CartDAO.getDAO().selectAllCartList("moo_sung@naver.com");
//List<CartDTO> cartList = CartDAO.getDAO().selectAllCartList("moonhee@naver.com"); 
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
	text-align: center
}

.removeBtn .textAndBtn {
	margin-right: 620px;
}

.removeBtn #removeSelectBtn {
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	color: rgb(13, 13, 13);
	padding: 6px 12px;
}

.removeBtn #removeAllBtn {
	text-align: right;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	color: rgb(13, 13, 13);
	padding: 6px 12px;
}

.removeBtn #removeSelectBtn:hover {
	background-color: rgb(13, 13, 13);
	border: 1px solid rgb(207, 207, 207);
	color: rgb(207, 207, 207);
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
	margin-top: 50px;
}

.basket_btn .submitAllBtn {
	font-weight: bold;
	color: rgb(13, 13, 13);
	background-color: rgb(171, 195, 159);
	padding: 11px 27px 11px;
	margin-right: 7px;
	border: none;
}

.basket_btn .submitSelectBtn {
	font-weight: bold;
	color: rgb(13, 13, 13);
	background-color: rgb(172, 194, 244);
	padding: 11px 27px 11px;
	border: none;
}

.basket_btn .submitAllBtn:hover {
	background-color: rgb(13, 13, 13);
	border: 1px solid rgb(207, 207, 207);
	color: rgb(207, 207, 207);
}

.basket_btn .submitSelectBtn:hover {
	background-color: rgb(13, 13, 13);
	border: 1px solid rgb(207, 207, 207);
	color: rgb(207, 207, 207);
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	width: 900px;
	border-collapse: collapse;
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

.name {
	border: none;
}

.price {
	border: none;
}

.name, .price:focus {
	outline: none;
}

#wrap {
	width: 1200px;
}
</style>
</head>
<body>
	<div id="wrap">
		<%-- header 불러오기 --%>
		<jsp:include page="../form/header.jsp" />
		<%-- side 불러오기 --%>
		<jsp:include page="../form/side.jsp" />
		<!-- container start -->
		<div id="container">
			<!-- content area -->
			<div id="content">
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
								<th><input type="checkbox" id="allCheck"></th>
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
								<td>
									<input type="hidden" id="productIdx<%=i%>" name="productIdx<%=i%>" value="<%=cartList.get(i).getProduct_idx()%>">
									<input type="checkbox" id="check<%=i%>">
									
								</td>
								<td><input id="name<%=i%>" class="name" name="name"
									value="<%=productList.get(i).getName()%>" readonly="readonly"></td>
								<td id="quantity<%=i%>" class="quantity">
								<span class="count"> 
								<input type="text" id="cnt<%=i%>" value="1" readonly="readonly"
										style="width: 20px; border: none;"> 
									<a href="#none" id="up"> 
										<img src="../namkyu/image/btn_count_up.gif"
											id="up<%=i%>" class="upBtn" onclick="up(<%=i%>)">
									</a> 
									<a href="#none" id="down"> 
										<img src="../namkyu/image/btn_count_down.gif" id="down<%=i%>"
											class="downBtn" onclick="down(<%=i%>)">
									</a> 
									<br>
									<button id="button<%=i%>">edit</button>
								</span>
								</td>
								
								<td>
									<input id="price<%=i%>" class="price" name="price"
									value="<%=DecimalFormat.getCurrencyInstance().format(productList.get(i).getPrice())%>"
									readonly="readonly">
								</td>
							</tr>
							<%} %>

						</table>
					</form>
				</div>
				<br>
				<div class="removeBtn">
					<span class="textAndBtn"> <span>선택상품을</span>
						<button type="button" id="removeSelectBtn" onclick = "check()">삭제하기</button>
					</span> 
					<span>
						<button type="button" id="removeAllBtn">장바구니비우기</button>
					</span>
				</div>
				
				<br> <br>
				<div class="basket_btn">
					<input type="submit" class="submitAllBtn" value="전체상품 주문">
					<input type="button" class="submitSelectBtn" value="선택상품 주문"
						onclick="check(<%=i%>)">
				</div>
				<%
				}
				%>
				<script type="text/javascript">
					var count = [];
					var productIdxList = ['hi'];
					function up(i) {
						if(count[i]==undefined) {		
							count[i]=1;
						}
						count[i]++;
					
						document.getElementById("cnt"+i).setAttribute("value", count[i]);
						return;
					}
					function down(i) {
						if(count[i]==undefined) {
							count[i]=1;	
						}
							count[i]--;
						
						if(count[i]<=0) {
							count[i]=0;
						}	
						document.getElementById("cnt"+i).setAttribute("value", count[i]);
						
						return;
					}
					function check(){
						var arr_checked = [];
						for(var j=0;j<i;j++){
							arr_checked[j] = document.getElementsById("productIdx"+j);
							if(arr_checked[j].checked==true){
								productIdxList.push(arr_checked[j].value);
							}
						}
						alert(productIdxList);
					}
				$(document).ready(function() {
					$("#allCheck").click(function() { 
						if($("#allCheck").prop("checked")) { 
							$("input[type=checkbox]").prop("checked",true);
						} else {
							$("input[type=checkbox]").prop("checked",false);
						}
					});
				});			
								
				$("#removeAllBtn").click(function() {
					if(window.confirm("장바구니를 비우시겠습니까?")) {
						location.href="<%=request.getContextPath()%>/index.jsp?workgroup=minjeong&work=cart_clear";}
				});

				$("#submitAllBtn").click(function() {
					location.href = "";
				});

				$("#submitSelectBtn").click(function() {
					location.href = "";
				});
				</script>
			</div>
			<!-- container end -->
			<%-- footer 불러오기 --%>
			<jsp:include page="../form/footer.jsp" />
		</div>
	</div>
</body>
</html>