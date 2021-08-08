<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MemberDTO> memberList=MemberDAO.getDAO().selectAllMemberList("email");
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

.memberF input {
	font-size: 18px;
	border: none;
	padding-left: 1px;
	line-height: 20px;
	min-width: 300px;
	border-bottom: 1px solid white;
}

.memberF input:focus {
	outline: none;
}


#searchM {
	width: 500px;
	margin: 0 auto;
	padding-top: 15px;
	text-align: center;
}

#searchBtnM {
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 5px 5px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

#searchBtnM:hover {
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
					<h1>회원관리</h1>
				</div>
				<br>
				<div id="searchM">
					<form method="post" name="mForm" class="memberF">
						검색 : <input type="text" name="member">
						<a type="button" id="searchBtnM" >조회</a>
					</form>
				</div>
				<br>
				<div class="memberlist">
					<form name="memberForm" id="memberForm">
						<table>
							<tr>
								<th>이메일</th>
								<th>이름</th>
								<th>누적금액</th>
								<th>등급</th>
								<th>상태</th>
							</tr>
							
							<% for(MemberDTO member:memberList) { %>
							<tr>
								<th class="member_e"><%=member.getEmail() %></th>
								<th class="member_n"><%=member.getName() %></th>
								<th class="member_a"><%=member.getTotal_pay() %></th>
								<th class="member_g"><%=member.getGrade() %></th>
							
								<td class="member_status">
									<select class="status" name="<%=member.getEmail()%>">
										<option value="0" <% if(member.getStatus()=="0") { %> selected <% } %>>활성화</option>
										<option value="1" <% if(member.getStatus()=="1") { %> selected <% } %>>비활성화</option>
									</select>
								</td>
							</tr>
							<% } %>
						</table>
					</form>
				</div>
			</div>
		</div>
		<!-- container end -->
	</div>
	<script type="text/javascript">
		document.getElementById("searchBtnM").onclick=function() {
			if(mForm.member.value=="") {
				alert("이메일을 입력해주세요.");
				return;
			} else {			
				window.open("<%=request.getContextPath()%>/admin/searchM_action.jsp","회원조회"
				    ,"height=550, width=900");
			}
			mForm.submit();
		}
	</script>
</body>
</html>