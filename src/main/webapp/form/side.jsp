<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
%>
<!-- left side bar -->
	<div id="left_bar">
      <div class="logo">
        <h1><a href="index.jsp">nookyoon</a></h1>
       </div>

 <div class="left_navi1">
        <ul>
          <li><a href="#">New</a></li>
          <li><a href="#">Best 15</a></li>
          <li><a href="#">Ring</a></li>
          <li><a href="#">Earring</a></li>
          <li><a href="#">Necklace</a></li>
          <li><a href="#">Bracelet</a></li>
          <li><a href="#">Anklet</a></li>
        </ul>
      </div>

      <div class="left_navi2">
        <ul>
          <li><a href="index.jsp?workgroup=wontack&work=notice">Notice</a></li>
          <li><a href="index.jsp?workgroup=wontack&work=question">Question</a></li>
          <li><a href="index.jsp?workgroup=wontack&work=review">Review</a></li>
        </ul>
      </div>
    </div>

<!-- right side bar -->
  <div id="right_bar">
    <div class="search">
      <fieldset>
        <input id="keyword" type="text">
        <img onclick="search()" src="<%=request.getContextPath()%>/images/btn_image/searchBtn.png">
      </fieldset>
    </div>

    <div class="right_name">
        <a href="index.jsp?workgroup=moosung&work=cart">CART - 0</a>
    </div>
    <div class="right_naiv" id="right_navi">
    <% if(loginMember==null) { %>
      <ul>
        <li><a href="index.jsp?workgroup=chanhyuk&work=login">Log in</a></li>
        <li><a href="index.jsp?workgroup=moosung&work=join">Join</a></li>
        <li><a href="index.jsp?workgroup=chanhyuk&work=login">Order</a></li>
        <li><a href="index.jsp?workgroup=moosung&work=myPage">My Page</a></li>
      </ul>
      <% } else { %>
      <ul>
        <li><a href="index.jsp?workgroup=moosung&work=profile">Profile</a></li>
        <li><a href="index.jsp?workgroup=chanhyuk&work=logout_action">Log Out</a></li>
        <li><a href="#">Order</a></li>
        <li><a href="index.jsp?workgroup=moosung&work=myPage">My Page</a></li>
      </ul>
      	<% if(loginMember.getGrade()=="00") { %>
	      <ul>
	        <li>관리자</li>
	        <li><a href="index.jsp?workgroup=chanhyuk&work=logout_action">Log Out</a></li>
	      </ul>
      	<% } %>
      <% } %>
    </div>
  </div>
  
  <body>
  <script type="text/javascript">
  	function search() {
  		var key = document.getElementById("keyword").value;
  		
  		if(key == null || key.trim() == ""){
  			alert("검색어를 입력해주세요.");
  			return;
  		}
  		location.href = "<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=search_product&keyword="+key;
	}
  </script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  </body>
  