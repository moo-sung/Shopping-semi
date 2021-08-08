<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
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

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	width: auto;
	border-collapse: collapse;
}

th, td {
	padding: 11px 10px 10px;
	height: 30px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

.productF input {
	font-size: 18px;
	border: none;
	padding-left: 1px;
	line-height: 20px;
	min-width: 300px;
	border-bottom: 1px solid white;
}

.productF input:focus {
	outline: none;
}


#searchP {
	width: 500px;
	margin: 0 auto;
	padding-top: 15px;
	text-align: center;
}

#searchBtnP {
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 5px 5px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

#searchBtnP:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}

.deleteadd {
	width: 500px;
	margin: 0 auto;
	padding-top: 15px;
	text-align: center;
}

#removeBtn, #addBtn {
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 5px 50px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

#removeBtn:hover, #addBtn:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
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
				<div class="controlArea">
					<h1>제품관리</h1>
				</div>
				<br>
				<div id="searchP">
					<form method="post" name="pForm" class="productF">
						검색 : <input type="text" name="name">
						<a type="button" id="searchBtnP" >조회</a>
					</form>
				</div>
				<br>
				<div class="deleteadd">
					<button type="button" id="removeBtn">삭제</button>&nbsp;&nbsp;&nbsp;
					<button type="button" id="addBtn">추가</button>
				</div>
				<div class="prodeculist">
					<form class="productTable">
						<table>
							<tr>
								<td>
									<input type="checkbox" id="Acheck">
								</td>
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
								<td><input type="checkbox" id="check"></td>
								<th class="product_c"><%=product.getIdx() %></th>
								<th class="product_n"><%=product.getName() %></th>
								<th class="product_i"><%=product.getImg_source() %></th>
								<th class="product_p"><%=product.getPrice() %></th>
								<th class="product_s"><%=product.getKinds() %></th>
								<th class="product_s"><%=product.getStock()%></th>
								<th class="product_d"><%=product.getRelease_date() %></th>
								
								<td class="product_status">
									<select class="status" name="<%=product.getIdx()%>">
										<option value="NEW" <% if(product.getNew_best()=="NEW") { %> selected <% } %>>NEW</option>
										<option value="BEST" <% if(product.getNew_best()=="BEST") { %> selected <% } %>>BEST</option>
										<option value="NEW_BEST" <% if(product.getNew_best()=="NEW_BEST") { %> selected <% } %>>NEW_BEST</option>
									</select>
								</td>
							</tr>
							<% } %>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	document.getElementById("searchBtnP").onclick=function() {
		if(pForm.name.value=="") {
			alert("제품명을 입력해주세요.");
			return;
		} else {			
			window.open("<%=request.getContextPath()%>/admin/searchP_action.jsp","제품조회"
			    ,"height=550, width=1100");
		}
		pForm.submit();
	}
	
	document.getElementById("addBtn").onclick=function() {
		window.open("<%=request.getContextPath()%>/admin/product_add.jsp","제품추가"
				,"height=550, width=800");
	}
	
	//체크 제이쿼리
	$(document).ready(function() {
		$("#ACheck").click(function() { 
			if($("#ACheck").prop("checked")) { 
				$("input[type=checkbox]").prop("checked",true);
			} else {
				$("input[type=checkbox]").prop("checked",false);
			}
		});
	});	
	</script>
</body>
</html>