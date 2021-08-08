<%@page import="util.Utility"%>
<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if(request.getMethod().equals("GET")) {
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=chanhyuk&work=login';");
	out.println("</script>");
	return;
}

//전달값 반환 저장
String email = request.getParameter("email");
String password = Utility.encrypt(request.getParameter("password"));
MemberDTO member = MemberDAO.getDAO().selectMember(email);

if ((member == null) || (member.getStatus().equals("0"))) {//아이디에 대한 인증 실패가 발생한 경우
	out.println("<script type='text/javascript'>");
	out.println("alert('아이디가 맞지 않습니다.')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=login';");
	out.println("</script>");
	return;
}

if (!member.getPassword().equals(password)) {//비밀번호 실패가 발생한 경우
	out.println("<script type='text/javascript'>");
	out.println("alert('아이디 또는 비밀번호가 맞지 않습니다.')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=login';");
	out.println("</script>");
	return;
}

//인증 성공
session.setAttribute("loginMember", MemberDAO.getDAO().selectMember(email));

//관리자 페이지로 이동
if (member.getStatus().equals("9")) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + request.getContextPath() +"/admin/admin_main.jsp");
	out.println("</script>");
}

//페이지 이동
String url = (String) session.getAttribute("url");
if (url == null) {//메인페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=moonhee&work=main';");
	out.println("</script>");
} else {//기존페이지로 이동
	session.removeAttribute("url");
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + url + "';");
	out.println("</script>");
}
%>
