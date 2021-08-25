<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

	<div class =" container">

	<h2> DECORATION </h2>

		<nav id="nav3">
		          <ul>
						<li><a href="decoration_pre.jsp">판매예정</a></li>
						<li><a href="decoration_ing.jsp">판매중</a></li>
						<li style="background-color:#aaa"><a href="decoration_com.jsp" style="color:#fff">판매완료</a></li>
					</ul>
		</nav>
		<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />
		<% 
		
			ArrayList<ProductEntity> list = prodb.getDecorationComList(); 
			int counter = list.size();
			int row = 0;
			if(counter == 0) %>  <h6 style="text-align:center; color:#d5d5d5;">상품이 존재하지 않습니다.</h6> <%

			if(counter > 0) {
			
			for(ProductEntity pro : list) {
			%>
				<a href="productinfo.jsp?ProductNumber=<%= pro.getProductnumber() %>">
				<div class="item">
					<img src="images/<%= pro.getProductimage() %>"/>
						<h3><%= pro.getProductname() %></h3>
						<p><%= pro.getProductprice() %> won</p>
					</div>
				</a>
			<%
				}
			}
			%>

			<hr width=90%>

		</div>
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>