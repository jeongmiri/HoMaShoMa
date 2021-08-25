<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>HoMaShoMa</title>
		
</head>

<body>

	<jsp:useBean id="pro" class="hsboard.ProductEntity" scope="page" />
	<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />

	<%@ page import="hsboard.*" %>
	<%
		request.setCharacterEncoding("euc-kr");
		
		String menu = request.getParameter("menu");
		String id  =  (String)session.getAttribute("id");
		String category = request.getParameter("Category");
		String productname = request.getParameter("ProductName");
		String productinformation = request.getParameter("ProductInformation");
		String productimage = request.getParameter("ProductImage");
		String productprice = request.getParameter("ProductPrice");
		String productminimumquantity = request.getParameter("ProductMinimumQuantity");
		String productmaximumquantity = request.getParameter("ProductMaximumQuantity");
		String productstate = "pre";
		String currentcount = "0";
		String buycount = "0";

		if(menu.equals("insert")) {
	%>

		<jsp:setProperty name="pro" property="id" value="<%= id %>" />
		<jsp:setProperty name="pro" property="category"  value="<%= category %>"/>
		<jsp:setProperty name="pro" property="productname" value="<%= productname %>" />
		<jsp:setProperty name="pro" property="productinformation" value="<%= productinformation %>" />
		<jsp:setProperty name="pro" property="productimage"  value="<%= productimage %>" />
		<jsp:setProperty name="pro" property="productprice" value="<%= productprice %>" />
		<jsp:setProperty name="pro" property="productminimumquantity"  value="<%= productminimumquantity %>" />
		<jsp:setProperty name="pro" property="productmaximumquantity"  value="<%= productmaximumquantity %>"/>
		<jsp:setProperty name="pro" property="productstate" value="<%=  productstate %>" />
		<jsp:setProperty name="pro" property="currentcount" value="<%= currentcount %>" />
		<jsp:setProperty name="pro" property="buycount" value="<%= buycount %>" />


	<%
		prodb.insertDB(pro);
		prodb.insertSellerDB(pro);
		
		response.sendRedirect("product.jsp");

		}
		
	/*	else if(menu.equals("info")) {
	%>

	<jsp:setProperty name="pro" property="productnumber" />
	<jsp:setProperty name="pro" property="id" />
	<jsp:setProperty name="pro" property="category"/>
	<jsp:setProperty name="pro" property="productname" />
	<jsp:setProperty name="pro" property="productinformation"/>
	<jsp:setProperty name="pro" property="productimage"/>
	<jsp:setProperty name="pro" property="productprice" />
	<jsp:setProperty name="pro" property="productminimumquantity"/>
	<jsp:setProperty name="pro" property="productmaximumquantity"/>
	<jsp:setProperty name="pro" property="productstate"/>

	<%
		}*/

	%>
</body>
</html>