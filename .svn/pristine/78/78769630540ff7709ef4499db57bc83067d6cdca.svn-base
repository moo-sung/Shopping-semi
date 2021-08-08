<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_url.jspf" %>
<%-- 수량 edit  --%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String cart_idx=request.getParameter("cart_idx");
	int quantity=Integer.parseInt(request.getParameter("quantity"));
	
	CartDTO cart=new CartDTO();
	cart.setCart_idx(cart_idx);
	cart.setQuantity(quantity);
	
	CartDAO.getDAO().updateCart(cart);	

	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=minjeong&work=cart.jsp';");
	out.println("</script>");
%>
