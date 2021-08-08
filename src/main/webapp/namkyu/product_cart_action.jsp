<%@page import="dao.CartDAO"%>
<%@page import="dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	/* if (request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=namkyu&work=product'");
		out.println("</script>");
		return;
 	} */
	
		String email= "moo_sung@naver.com";	
 		String proidx= "TEST_1";
 	
		request.setCharacterEncoding("UTF-8");	
		/* String email= request.getParameter("email"); */
		/* String email= request.getParameter("moo_sung@naver.com"); */
		String idx = request.getParameter("idx");
		/* String idx= request.getParameter("idx"); */
		String price = request.getParameter("price");
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		
		CartDTO cart= new CartDTO();
		cart.setCart_idx(email); 
		/* cart.setEmail(idx); */
		cart.setEmail(email);
		cart.setProduct_idx(proidx);
		cart.setQuantity(quantity);
		CartDAO.getDAO().insertCart(cart);
		
		
		/* System.out.println(email);
		System.out.println(productIdx);
		System.out.println(quantity); */
		
		
 		out.println("<script type='text/javascript'>");
		out.println("alert('장바구니로 이동되었습니다.')");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=minjeong&work=cart'");
		out.println("</script>"); 		
%>