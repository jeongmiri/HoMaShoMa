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
		
		String id = request.getParameter("Sellerid");

		HoMaShoMaDBCP userdb = new HoMaShoMaDBCP();
		SellerEntity seller = userdb.getSeller(id);

		String password = seller.getPassword();
		String name = seller.getName();
		String phonenum = seller.getPhonenum();
		String email = seller.getEmail();
		String address = seller.getAddress();
	%>
	
	<div class =" container">

		<h2> SELLER INFO PAGE </h2>

		<table class="productinfo">
			<tr>
				<th>�̸�</th>
				<td><%= name %></td>
			</tr>
			<tr>
				<th>���̵�</th>
				<td><%= id %></td>
			</tr>
			<tr>
				<th>�ڵ�����ȣ</th>
				<td><%= phonenum %></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><%= email %></td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td><%= address %></td>
			</tr>
		</table>
	</div>

		<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>