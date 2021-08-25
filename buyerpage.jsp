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

<script language=JavaScript src="productform.js"></script>

<body>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

	<jsp:include page="header.jsp" flush="false" />

	<%@ page import="homashoma.*" %>
	<%
		request.setCharacterEncoding("euc-kr");
		
		String userid = (String)session.getAttribute("id");

		HoMaShoMaDBCP userdb = new HoMaShoMaDBCP();
		BuyerEntity buyer = userdb.getBuyer(userid);

		String id = userid;
		String password = buyer.getPassword();
		String name = buyer.getName();
		String phonenum = buyer.getPhonenum();
		String email = buyer.getEmail();
		String address = buyer.getAddress();
	%>
	
	<div class =" container">

		<h2> MYPAGE </h2>

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

		<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />
		<% 
	
			ArrayList<ProductEntity> list = prodb.getBuyerProductListId(userid);
			ArrayList<ProductEntity> list2 = prodb.getProductList(); 
			ArrayList<ProductEntity> list3 = prodb.getComProductListId(userid);%>


			
		<!-- �����ڰ� ���ſ������� ������ ��ǰ ��� -->
		<div class="preitem">

			<h2>���ſ����ǰ</h2>
			<table class="tbl-list">
					<colgroup><col width="20%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="20%"></colgroup>
					<tr>
						<th>��ǰ�̹���</th>
						<th>��ǰ��</th>
						<th>�Ǹ��� ���̵�</th>
						<th>����</th>
						<th>������ / �ּ��Ǹż���</th>
						<th>���Ű��ɿ���</th>
					</tr>
				</table>

			<%
			for(ProductEntity pro : list) {
				for(ProductEntity pro2 : list2) {
					int num1 = pro.getProductnumber();
					int num2 = pro2.getProductnumber();

					if(num1==num2) {
							%>
								<table class="tbl-list">
										<colgroup><col width="20%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="20%"></colgroup>
										<tr>
										<td><img src="images/<%= pro2.getProductimage() %>" width="80"/></img></td>
										<td><a href="productinfo.jsp?ProductNumber=<%= num1 %>"><%= pro2.getProductname() %> </a></td>
										<td><a href="sellerinfo.jsp?Sellerid=<%= pro2.getId() %>"><%= pro2.getId() %></a> </td>
										<td><%= pro2.getProductprice() %> </td>
										<td><%= pro2.getCurrentcount() %> / <%= pro2.getProductminimumquantity() %></td>
										<td>
											<% if("ing".equals(pro2.getProductstate())) { %>
											<input type="button" class="back2" value="�����ϱ�" OnClick="location='productinfo.jsp?ProductNumber=<%= num1 %>'" ></input>
											<% } else { %> ���źҰ� <% } %>
										</td>
									</tr>
									</table>
							<%
					}
			}
			}

		%>
		</div>

		<!-- �����ڰ� ���� �Ϸ��� ��ǰ ��� -->
		<div class="comitem">

		<h2>���ſϷ��ǰ</h2>
			<table class="tbl-list">
					<colgroup><col width="20%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="20%"></colgroup>
					<tr>
						<th>��ǰ�̹���</th>
						<th>��ǰ��</th>
						<th>�Ǹ��� ���̵�</th>
						<th>����</th>
						<th></th>
						<th></th>
					</tr>
				</table>

			<%
			for(ProductEntity pro3 : list3) {
				for(ProductEntity pro2 : list2) {
					int num1 = pro3.getProductnumber();
					int num2 = pro2.getProductnumber();

					if(num1==num2) {
							%>
								<table class="tbl-list">
										<colgroup><col width="20%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="20%"></colgroup>
										<tr>
										<td><img src="images/<%= pro2.getProductimage() %>" width="80"/></img></td>
										<td><a href="productinfo.jsp?ProductNumber=<%= num1 %>"><%= pro2.getProductname() %></a></td>
										<td><a href="sellerinfo.jsp?Sellerid=<%= pro2.getId() %>"><%= pro2.getId() %></a> </td>
										<td><%= pro2.getProductprice() %> </td>
										<td><input type="button" value="�����Է�" class="back2" onClick="location='reviewinput.jsp?ProductNumber=<%= num1 %>&Sellerid=<%=pro2.getId() %>'"></input></td>
										<td>
											<% if(pro3.getCompany() == null ) { %> ������� �Էµ��� �ʾҽ��ϴ�. <% }
												else { %> 
										<input type="button" value="�����Ȯ��" class="back2" onClick="location='trackingService.jsp?ProductNumber=<%= num1 %>'"></input><% } %></td>
										
									</tr>
									</table>
							<%
					}
			}
			}

		%>
		</div>

	</div>

	
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>