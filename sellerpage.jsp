<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HoMaShoMa</title>
		<style>
		</style>
		<script language=JavaScript src="productform.js"></script>
</head>

<body>

	<jsp:include page="header.jsp" flush="false" />

	<%@ page import="homashoma.*" %>
	<%
		request.setCharacterEncoding("euc-kr");
		
		String userid = (String)session.getAttribute("id");

		HoMaShoMaDBCP userdb = new HoMaShoMaDBCP();
		SellerEntity seller = userdb.getSeller(userid);

		String id = userid;
		String password = seller.getPassword();
		String name = seller.getName();
		String phonenum = seller.getPhonenum();
		String email = seller.getEmail();
		String address = seller.getAddress();
	%>


	<div class =" container">

		<h2> MYPAGE </h2>

		<!-- �Ǹ��� ���� -->
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

		<input type= "button" value="��ǰ���" class="back2"  onclick="location='insertproduct.jsp'">

		<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />
		<% 
	
			ArrayList<ProductEntity> list = prodb.getSellerProductListId(userid);
			ArrayList<ProductEntity> list2 = prodb.getProductList();
			
			%>
		<div class="preitem">

				<h2>�Ǹſ�����ǰ</h2>
				<div class="listdiv">
				<table class="tbl-list">
					<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
					<tr>
						<th>��ǰ�̹���</th>
						<th>��ǰ��</th>
						<th>����</th>
						<th>������ / �ּ��Ǹż���</th>
						<th></th>
					</tr>
				</table><%
				for(ProductEntity pro : list) {
					for(ProductEntity pro2 : list2) {
						int num1 = pro.getProductnumber();
						int num2 = pro2.getProductnumber();
						String a = "delete";
						String state = pro2.getProductstate();

						if(num1==num2) {
							if(state.equals("pre")) {
								%>
										<table class="tbl-list">
											<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
											<tr>
												<td><img src="images/<%= pro2.getProductimage() %>" width="80"/></img></td>
												<td><a href="productinfo.jsp?ProductNumber=<%= num1 %>"><%= pro2.getProductname() %></a></td>
												<td><%= pro2.getProductprice() %></td>
												<td><%= pro2.getCurrentcount() %> / <%= pro2.getProductminimumquantity() %></td>
												<td><input type="button"  class="back2" value="����" Onclick="location='processproduct.jsp?ProductNumber=<%= num2 %>&menu=<%= a %>'">
												</td>
											</tr>
										</table>
									
								<% }
				}
				}
			}
			%>
			</div>
		</div>

		<!-- �Ǹ��ڰ� ����� ��ǰ ��� -->
		<div class="ingitem">
			
			<h2>�Ǹ��߻�ǰ</h2>
			<div class="listdiv">
			<table class="tbl-list">
				<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
				<tr>
					<th>��ǰ�̹���</th>
					<th>��ǰ��</th>
					<th>����</th>
					<th>������ / ����</th>
					<th></th>
				</tr>
			</table>
			<%
				for(ProductEntity pro : list) {
				for(ProductEntity pro2 : list2) {
					int num1 = pro.getProductnumber();
					int num2 = pro2.getProductnumber();
					String state = pro2.getProductstate();

					if(num1==num2) {
						if(state.equals("ing")) {
							%>
								
									<table class="tbl-list">
										<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
										<tr>
											<td><img src="images/<%= pro2.getProductimage() %>" width="80"/></img></td>
											<td><a href="productinfo.jsp?ProductNumber=<%= num1 %>"><%= pro2.getProductname() %></a></td>
											<td><%= pro2.getProductprice() %></td>
											<td><%= pro2.getCurrentcount() %> / <%= pro2.getProductminimumquantity() %></td>
											<td><input type="button" value="��Ϻ���" class="back2" Onclick="location='productbuyerlist.jsp?ProductNumber=<%= num2 %>'"></input></td>
										</tr>
									</table>
								
							<% }
			}
			}
		}
		%>
		</div>
		</div>

		<div class="comitem">
			<h2>�ǸſϷ��ǰ</h2>
			<div class="listdiv">
			<table class="tbl-list">
				<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
				<tr>
					<th>��ǰ�̹���</th>
					<th>��ǰ��</th>
					<th>����</th>
					<th></th>
					<th></th>
				</tr>
			</table>
			<%
				for(ProductEntity pro : list) {
				for(ProductEntity pro2 : list2) {
					int num1 = pro.getProductnumber();
					int num2 = pro2.getProductnumber();
					String state = pro2.getProductstate();

					if(num1==num2) {
						if(state.equals("com")) {
							%>
								<div class="listdiv">
									<table class="tbl-list">
										<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
										<tr>
											<td><img src="images/<%= pro2.getProductimage() %>" width="80"/></img></td>
											<td><a href="productinfo.jsp?ProductNumber=<%= num1 %>"><%= pro2.getProductname() %></a></td>
											<td><%= pro2.getProductprice() %></td>
											<td></td>
											<td></td>
										
										</tr>
									</table>
								</div>
							<% }
			}
			}
		}
		%>
		</div>
		</div>
	
	</div>

	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>

</html>