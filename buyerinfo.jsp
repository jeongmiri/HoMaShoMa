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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

	<jsp:include page="header.jsp" flush="false" />

	<%@ page import="homashoma.*" %>
	<%
		request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("Buyerid");

		HoMaShoMaDBCP userdb = new HoMaShoMaDBCP();
		BuyerEntity buyer = userdb.getBuyer(id);

		String password = buyer.getPassword();
		String name = buyer.getName();
		String phonenum = buyer.getPhonenum();
		String email = buyer.getEmail();
		String address = buyer.getAddress();
	%>
	
	<div class =" container">

		<h2> BUYER INFO PAGE </h2>

		<table class="productinfo">
			<tr>
				<th>이름</th>
				<td><%= name %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%= id %></td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td><%= phonenum %></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><%= email %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%= address %></td>
			</tr>
		</table>
	</div>

		<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>