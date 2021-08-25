<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>-->
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>HoMaShoMa</title>

		<style>

	</style>
</head>

<body>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<jsp:include page="header.jsp" flush="false" />

	<div class="container">
	
	<div class="listdiv">
	<h2>NEW ITEM</h2>

	<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
	<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />
	<% 
	
		ArrayList<ProductEntity> list = prodb.getProductList();
		ArrayList<ProductEntity> list2 = prodb.getPreProductList(); 
		ArrayList<ProductEntity> list3 = prodb.getIngProductList(); 
	   	int counter = list.size();
		int counter2 = list2.size();
		int counter3 = list3.size();
	   	int row = 0;

		if(counter > 0) {
		
		for(ProductEntity pro : list) {
		%>
			<a href="productinfo.jsp?ProductNumber=<%= pro.getProductnumber() %>">
			<div class="item">
				<div class="image">
				<img src="images/<%= pro.getProductimage() %>" /></img>
				</div>
				<h3><%= pro.getProductname() %> </h3>
				<p><%= pro.getProductprice() %> won</p>
			</div>
			</a>
		<%
			}
		}
		%>
	</div>

	<div class="listdiv">
	<h2>ON SCHEDULE</h2>

	<% 
		if(counter > 0) {
		
		for(ProductEntity pro : list2) {
		%>
			<a href="productinfo.jsp?ProductNumber=<%= pro.getProductnumber() %>">
			<div class="item">
				<div class="image">
				<img src="images/<%= pro.getProductimage() %>"/></img>
				</div>
				<h3><%= pro.getProductname() %> </h3>
				<p><%= pro.getProductprice() %> won</p>
			</div>
			</a>
		<%
			}
		}
		%>

	</div>

	<div class="listdiv">
	<h2>SELLING</h2>

	<% 
	
		if(counter > 0) {
		
		for(ProductEntity pro : list3) {
		%>
			<a href="productinfo.jsp?ProductNumber=<%= pro.getProductnumber() %>">
			<div class="item">
				<div class="image">
				<img src="images/<%= pro.getProductimage() %>"/></img>
				</div>
				<h3><%= pro.getProductname() %> </h3>
				<p><%= pro.getProductprice() %> won</p>
			</div>
			</a>
		<%
			}
		}

		%>
	</div>


	</div>

	<hr width="90%">

	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>
