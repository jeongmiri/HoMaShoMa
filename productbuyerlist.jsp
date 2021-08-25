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

		String productnumber = request.getParameter("ProductNumber");
		int productnum = Integer.parseInt(productnumber);
	%>


	<div class =" container">

		<h2> 판매중인 상품 정보 </h2>

		<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />
		<% 
	
			ArrayList<ProductEntity> list = prodb.getProductListIdNum(productnum, id);
			ArrayList<ProductEntity> list2 = prodb.getComProductListNum(productnum);
			
		%>
		
		<!-- 판매자가 등록한 상품 목록 -->
		<div class="ingitem">

			<div class="listdiv">
			<table class="tbl-list">
				<colgroup><col width="20%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="20%"></colgroup>
				<tr>
					<th>상품이미지</th>
					<th>상품명</th>
					<!--정보보기버튼 -->
					<th>구매자</th>
					<!-- 상태: 결제완료->운송장입력->운송장입력완료 -->
					<!-- 운송장 입력 : YES, 운송장 x : NO -->
					<th>배송여부</th>
					<!-- 입력 되어있을 경우에는 운송장번호 띄우고 입력 안 되어 있으면 입력 버튼 -->
					<th>운송장번호</th>
					<th></th>
				</tr>
			</table>
			<%
				for(ProductEntity pro : list) {
				for(ProductEntity pro2 : list2) { 
					if("ing".equals(pro.getProductstate()) || pro2.getTrackingnumber() == null) {
						int num1 = pro.getProductnumber();
						int num2 = pro2.getProductnumber();

						if(num1==num2) {  %>
									<table class="tbl-list">
										<colgroup><col width="20%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="20%"></colgroup>
										<tr>
											<td><img src="images/<%= pro.getProductimage() %>"width="80"/></img></td>
											<td> <%= pro.getProductname() %></td>
											<td>
												<a href="buyerinfo.jsp?Buyerid=<%=pro2.getId() %>"><%= pro2.getId() %></a>
											</td>
											<td>
												<% if(pro2.getTrackingnumber() == null) { %> No <% }
													else %> YES 
											</td>
											<td>
											<% if(pro2.getTrackingnumber() == null) { %> 입력해주세요 <% }
													else  %><%= pro2.getTrackingnumber() %>	 
												</td> 
												<td><% if(pro2.getTrackingnumber() == null) { %> <input type="button" value="운송장번호입력" class="back2" onClick="location='trackingInput.jsp?ProductNumber=<%=pro2.getProductnumber() %>&Id=<%= pro2.getId() %>'"> <% }
													else  { %>
												<input type="button" value="다시입력" class="back2" onClick="location='trackingInput.jsp?ProductNumber=<%=pro2.getProductnumber() %>&Id=<%= pro2.getId() %>'"></td><% } %>
										</tr>
									</table>
							<% } }
				}
			}	
		%>
		</div>
		</div>
		<br/>
		<input type= "button" value="확인" class="back2"  onclick="history.go(-1)">
	
	</div>

	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>

</html>