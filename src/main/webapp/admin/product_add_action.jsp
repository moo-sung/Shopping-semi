<%@page import="dao.ProductDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory=request.getServletContext().getRealPath("/image/2_05_shop1_174441");

	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory
		, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	String productIdx=multipartRequest.getParameter("productIdx");
	String productName=multipartRequest.getParameter("productName");
	String mainImage=multipartRequest.getParameter("mainImage");
	int productPrice=Integer.parseInt(multipartRequest.getParameter("productPrice"));
	String category=multipartRequest.getParameter("category");
	int productStock=Integer.parseInt(multipartRequest.getParameter("productStock"));
	String status=multipartRequest.getParameter("status");
	
	ProductDTO product=new ProductDTO();
	product.setIdx(productIdx);
	product.setName(productName);
	product.setImg_source(mainImage);
	product.setPrice(productPrice);
	product.setKinds(category);
	product.setStock(productStock);
	product.setNew_best(status);
	
	ProductDAO.getDAO().insertProduct(product);

	out.println("<script type='text/javascript'>");
	out.println("alert('제품이 추가되었습니다.')");
	out.println("window.close");
	out.println("</script");

%>