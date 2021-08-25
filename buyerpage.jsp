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

		<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />
		<% 
	
			ArrayList<ProductEntity> list = prodb.getBuyerProductListId(userid);
			ArrayList<ProductEntity> list2 = prodb.getProductList(); 
			ArrayList<ProductEntity> list3 = prodb.getComProductListId(userid);%>


			
		<!-- 구매자가 구매예정으로 선택한 상품 목록 -->
		<div class="preitem">

			<h2>구매예약상품</h2>
			<table class="tbl-list">
					<colgroup><col width="20%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="20%"></colgroup>
					<tr>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>판매자 아이디</th>
						<th>가격</th>
						<th>예약자 / 최소판매수량</th>
						<th>구매가능여부</th>
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
											<input type="button" class="back2" value="구매하기" OnClick="location='productinfo.jsp?ProductNumber=<%= num1 %>'" ></input>
											<% } else { %> 구매불가 <% } %>
										</td>
									</tr>
									</table>
							<%
					}
			}
			}

		%>
		</div>

		<!-- 구매자가 구매 완료한 상품 목록 -->
		<div class="comitem">

		<h2>구매완료상품</h2>
			<table class="tbl-list">
					<colgroup><col width="20%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="20%"></colgroup>
					<tr>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>판매자 아이디</th>
						<th>가격</th>
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
										<td><input type="button" value="리뷰입력" class="back2" onClick="location='reviewinput.jsp?ProductNumber=<%= num1 %>&Sellerid=<%=pro2.getId() %>'"></input></td>
										<td>
											<% if(pro3.getCompany() == null ) { %> 운송장이 입력되지 않았습니다. <% }
												else { %> 
										<input type="button" value="운송장확인" class="back2" onClick="location='trackingService.jsp?ProductNumber=<%= num1 %>'"></input><% } %></td>
										
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