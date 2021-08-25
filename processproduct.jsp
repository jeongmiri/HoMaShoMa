<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>HoMaShoMa</title>
		
</head>

<body>

	<!-- 게시의 등록, 수정, 삭제를 위한 자바빈즈 이용 선언-->
	<jsp:useBean id="pro" class="hsboard.ProductEntity" scope="page" />
	<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />

	<%@ page import="hsboard.*" %>
	<%
		request.setCharacterEncoding("euc-kr");
		
		String productnumber = request.getParameter("ProductNumber");
		String menu = request.getParameter("menu");
		String id  =  (String)session.getAttribute("id");
		String category = request.getParameter("Category");
		String productname = request.getParameter("ProductName");
		String productinformation = request.getParameter("ProductInformation");
		String productimage = request.getParameter("ProductImage");
		String productprice = request.getParameter("ProductPrice");
		String productminimumquantity = request.getParameter("ProductMinimumQuantity");
		String productmaximumquantity = request.getParameter("ProductMaximumQuantity");
		String productstate = request.getParameter("ProductState");
		String currentcount = request.getParameter("CurrentCount");
		String buycount = request.getParameter("BuyCount");
		String company = request.getParameter("CompnayList");
		String trackingnumber = request.getParameter("invoiceNumberText");
		String trackingid = request.getParameter("Id");

		int num = Integer.parseInt(productnumber);

		if(menu.equals("preflag")) {

			if(id!=null) 
			{
				%><jsp:setProperty name="pro" property="id" value="<%= id %>" />
					<jsp:setProperty name="pro" property="productnumber" value="<%= num %>" /><%

				prodb.updateCurrentcount(num);
				prodb.insertBuyerDB(pro);
				response.sendRedirect("productinfo.jsp?ProductNumber="+num);
			}
			else response.sendRedirect("login.jsp");
			
		}

		else if(menu.equals("ingflag")) {
			
			if(id!=null)
			{
				%><jsp:setProperty name="pro" property="id" value="<%= id %>" />
					<jsp:setProperty name="pro" property="productnumber" value="<%= num %>" /><%

				prodb.updateBuycount(num);
				prodb.insertComDB(pro);
				prodb.deleteBuyerDB(num);
				response.sendRedirect("buyerpage.jsp");
			}
			else response.sendRedirect("login.jsp");
		}

		else if(menu.equals("predelflag")) {
			
			if(id!=null)
			{
				prodb.deleteBuyerDB(num);
				prodb.deleteCurrentcount(num);
				response.sendRedirect("productinfo.jsp?ProductNumber="+num);
			}
			else response.sendRedirect("login.jsp");
		}

		else if(menu.equals("delete")) {

			if(id!=null)
			{
				prodb.deleteDB(num);
				prodb.deleteSellerDB(num);
				prodb.deleteBuyerDB(num);
				response.sendRedirect("sellerpage.jsp");
			}
		}

		else if(menu.equals("ingdelflag")) {

			if(id!=null)
			{
				prodb.deleteComDB(num);
				prodb.deleteBuycount(num);
				response.sendRedirect("productinfo.jsp?ProductNumber="+num);
			}
		}

		else if(menu.equals("trackingflag")) {

			if(id!=null)
			{ %>
				<jsp:setProperty name="pro" property="id" value="<%= trackingid %>" />
				<jsp:setProperty name="pro" property="productnumber" value="<%= num %>" />
				<jsp:setProperty name="pro" property="trackingnumber" value="<%= trackingnumber %>" />
				<jsp:setProperty name="pro" property="company" value="<%= company %>" /> <%

				prodb.updateComDB(pro);

				response.sendRedirect("productbuyerlist.jsp?ProductNumber="+num);
			}
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