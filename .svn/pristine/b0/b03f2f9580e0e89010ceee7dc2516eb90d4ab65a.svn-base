<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 장바구니 선택삭제 --%>
<% 
   
	request.setCharacterEncoding("UTF-8");
	String cart_idx=request.getParameter("cart_idx");
	
	CartDAO.getDAO().deleteCart(cart_idx);	
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=minjeong&work=cart.jsp';");
	out.println("</script>");	
%>