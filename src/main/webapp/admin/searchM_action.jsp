<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberDTO> memberList=MemberDAO.getDAO().selectAllMemberList("email");
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
					<h1>회원관리</h1>
				</div>
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
						
						<% if(memberList!=null) { %>
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
							<% } %>
						</table>
					</form>
				</div>
			</div>

</body>
</html>