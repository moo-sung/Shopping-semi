<%@page import="dao.CartDAO"%>
<%@page import="dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_url.jspf" %>
<%--장바구니 전체삭제--%>
<%
	request.setCharacterEncoding("UTF-8");

	//세션 로그인한 사용자의 이메일 가져오기
	
	//CartDAO.getDAO().clearCart(email);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=minjeong&work=cart.jsp';");
	out.println("</script>");	
%>
