<%@page import="dto.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProductDTO> productList=ProductDAO.getDAO().selectAllProductList("released_date");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<style type="text/css">
/* CSS 작성 */
#contents {
	margin: 0 auto;
	padding: 100px 0 80px;
}

h1 {
	text-align: center;
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	width: auto;
	border-collapse: collapse;
}

th, td {
	padding: 11px 10px 10px;
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

form {
	text-align: center;
	font-size: 15px;
}

</style>
</head>
<body>

			<div id="content">
				<div class="controlArea">
					<h1>제품조회</h1>
				</div>
				<div class="prodeculist">
					<form class="productTable">
						<table>
							<tr>
								<th>제품코드</th>
								<th>제품명</th>
								<th>이미지</th>
								<th>가격</th>
								<th>카테고리</th>
								<th>수량</th>
								<th>등록일</th>
								<th>제품상태</th>
							</tr>
							
							<% for(ProductDTO product:productList) { %>
							<tr>
								<th class="product_c"><%=product.getIdx() %></th>
								<th class="product_n"><%=product.getName() %></th>
								<th class="product_i"><%=product.getImg_source() %></th>
								<th class="product_p"><%=product.getPrice() %></th>
								<th class="product_s"><%=product.getKinds() %></th>
								<th class="product_s"><%=product.getStock()%></th>
								<th class="product_d"><%=product.getRelease_date() %></th>
								
								<td class="product_status">
									<select class="status" name="<%=product.getIdx()%>">
										<option value="0" <% if(product.getNew_best()=="0") { %> selected <% } %>>NEW</option>
										<option value="1" <% if(product.getNew_best()=="1") { %> selected <% } %>>BEST</option>
										<option value="2" <% if(product.getNew_best()=="2") { %> selected <% } %>>NEW_BEST</option>
									</select>
								</td>
							</tr>
							<% } %>
						</table>
					</form>
				</div>
			</div>

</body>
</html>