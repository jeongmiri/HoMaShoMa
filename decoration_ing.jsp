<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HoMaShoMa</title>
		<style>

		</style>
</head>

<body>

	<jsp:include page="header.jsp" flush="false" />

	<div class =" container">

	<h2> DECORATION </h2>
		<nav id="nav3">
		          <ul>
						<li><a href="decoration_pre.jsp">�Ǹſ���</a></li>
						<li style="background-color:#aaa"><a href="decoration_ing.jsp" style="color:#fff">�Ǹ���</a></li>
						<li><a href="decoration_com.jsp">�ǸſϷ�</a></li>
					</ul>
		</nav>

		<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />
		<% 
		
			ArrayList<ProductEntity> list = prodb.getDecorationIngList(); 
			int counter = list.size();
			int row = 0;
			if(counter == 0) %>  <h6 style="text-align:center; color:#d5d5d5;">��ǰ�� �������� �ʽ��ϴ�.</h6> <%

			if(counter > 0) {
			
			for(ProductEntity pro : list) {
			%>
				<a href="productinfo.jsp?ProductNumber=<%= pro.getProductnumber() %>">
				<div class="item">
					<img src="images/<%= pro.getProductimage() %>"/>
						<h3><%= pro.getProductname() %> </h3>
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