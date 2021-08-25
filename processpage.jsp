<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>HoMaShoMa</title>
		
</head>

<body>

	<!-- ????? ?? -->
	
	<jsp:useBean id="seller" class="homashoma.SellerEntity" scope="page" />
	<jsp:useBean id="buyer" class="homashoma.BuyerEntity" scope="page" />
	<jsp:useBean id="userdb" class="homashoma.HoMaShoMaDBCP" scope="page" />


	<%
		request.setCharacterEncoding("euc-kr");

		String id = (String)session.getAttribute("id");
		String password = request.getParameter("Password");
		String name = request.getParameter("Name");
		String phonenum = request.getParameter("PhoneNum");
		String email = request.getParameter("Email");
		String address = request.getParameter("Address");

	%>

	<jsp:setProperty name="seller" property="id" value="<%= id %>" />
	<jsp:setProperty name="seller" property="password"  value="<%= password %>"/>
	<jsp:setProperty name="seller" property="name" value="<%= name %>" />
	<jsp:setProperty name="seller" property="phonenum" value="<%= phonenum %>" />
	<jsp:setProperty name="seller" property="email"  value="<%= email %>" />
	<jsp:setProperty name="seller" property="address" value="<%= address %>" />
		
		


</body>
</html>