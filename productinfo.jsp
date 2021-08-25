<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>HoMaShoMa</title>
	
	<script language=JavaScript src="productform.js"></script>

</head>

<body>

	<jsp:include page="header.jsp" flush="false" />

	<%@ page import="hsboard.*" %>
	<%
		request.setCharacterEncoding("euc-kr");
		
		String productnumber = request.getParameter("ProductNumber");

		int num = Integer.parseInt(productnumber);
		ProductDBCP prodb = new ProductDBCP();
		ProductEntity pro = prodb.getProduct(num);

		String id  = pro.getId();
		String category = pro.getCategory();
		String productname = pro.getProductname();
		String productinformation = pro.getProductinformation();
		String productimage = pro.getProductimage();
		String productprice = pro.getProductprice();
		String productminimumquantity = pro.getProductminimumquantity();
		String productmaximumquantity = pro.getProductmaximumquantity();
		String productstate = pro.getProductstate();
		String currentcount = pro.getCurrentcount();
		String buycount = pro.getBuycount();
		
		String success = request.getParameter("success");

		int current = Integer.parseInt(currentcount);
		int buy = Integer.parseInt(buycount);
		int min = Integer.parseInt(productminimumquantity);
		int max = Integer.parseInt(productmaximumquantity);

		ProductEntity pro2 = prodb.getBuyerProduct(num);
		ProductEntity pro3 = prodb.getComProduct(num);

		String buyerid = pro2.getId();
		String buyerid2 = pro3.getId();
		String currentid = (String)session.getAttribute("id");
		String a = "goflag";
	%>

	<div class ="container">

		<form name="productinfoform" method=post action="processproduct.jsp?ProductNumber=<%= pro.getProductnumber() %>">
		<input type=hidden name="menu">

		<div class="rightdiv">
		<div class="in">
			<br/><image src = "images/<%= productimage %>" width="70%"><br/>
		</div>
		</div>

		<div class="leftdiv">
			<div class="name">
				<%= productname %>
			</div>
			<table class="productinfo">
			<colgroup>
				<col width="40%">
				<col width="60%">
			</colgroup>
				<tr>
					<th>상품번호</th>
					<td><%= productnumber %></td>
				</tr>
				<tr>
					<th>등록자아이디</th>
					<td><%= id %></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td><%= category %></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><em><%= productprice %> won</em></td>
				</tr>
				<tr>
					<th>최소판매수량</th>
					<td><%= productminimumquantity %></td>
				</tr>
				<tr>
					<th>최대판매수량</th>
					<td><%= productmaximumquantity %></td>
				</tr>
				<tr>
					<th>상태</th>
					<td><%= productstate %></td>
				</tr>
			</table>

			<% 
			if("Buyer".equals(session.getAttribute("role"))) {
			if( productstate.equals("pre") ) {
				if( current < min) {
					if(buyerid != null && buyerid.equals(currentid)) { %>
						<input type="button" class="back2"value="예약취소" onClick="predelete()"> <% }
					else { 
						prodb.updateStatepre(num);%>
						<input type="button" class="back2" value="구매예약" onClick="preupdate()" >
				<% } } else if ( current >= min) {
							prodb.updateStateing(num); 
							response.sendRedirect("letterprocess.jsp?ProductNumber="+num+"&menu="+a); %>
							<input type="button" class="back2" value="구매하기" onClick="location.href = 'importtest.jsp?ProductNumber=<%= pro.getProductnumber() %>'">
						<% } }
				if( productstate.equals("ing") ) {
					if( buy < max ) { 
						 %>
						<input type="button" class="back2" value="구매하기" onClick="location.href = 'importtest.jsp?ProductNumber=<%= pro.getProductnumber() %>'">
					<% }  else if( buy >= max ) { 
							 prodb.updateStatecom(num);%>
						<input type="button"  class="back2" value="구매불가">
							<% }}
				if(productstate.equals("com")) { %> <input type="button"  class="back2" value="구매불가" > <% } }
			else if("Seller".equals(session.getAttribute("role"))) {
					%> <h5>구매자로 로그인 해 주세요.</h5> <%
			} else { %> <h5>로그인 해야 이용 가능합니다.</h5> <% }
				
				
			if("1".equals(success))
			{%>
				<script>ingupdate();
				</script>
			<% }
				%>

			
		</div>


		<hr width="100%" style="padding-top:50px;border-bottom:1px solid #d5d5d5;">

		<div class= "under">

				<table class="tbl-info">
				<tr>
					<th>상품설명</th>
				</tr>
				</table>
			
			<table class="tbl-list">
			<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
			<tr>
				<th>상품번호</th>
				<th>현재 예약자 수</th>
				<th>현재 구매자 수</th>
				<th>최소 판매 수량</th>
				<th>최대 판매 수량</th>
			</tr>
			<tr>
				<td><%= num %></td>
				<td><%= current  %></td>
				<td><%= buy %></td>
				<td><%= min %></td>
				<td><%= max %></td>
			</tr>
			</table>

			<table class="tbl-info">
				<tr>
					<td><%= productinformation %></td>
				</tr>
			<br>
			</table>

		<%@ page import="java.util.ArrayList, letter.LetterEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="ltedb" class="letter.LetterDBCP" scope="page" />

		<% 
			ArrayList<LetterEntity> list = ltedb.getReviewList(num); %>
			<br><br><br>
			<table class="tbl-info">
				<tr>
					<th>리뷰</th>
				</tr>
			<br>
			</table>
			
			<table class="tbl-list">
					<colgroup><col width="10%"><col width="20%"><col width="20%"><col width="40%"><col width="10%"></colgroup>
					<tr>
						<th>작성자</th>
						<th>작성날짜</th>
						<th>제목</th>
						<th>내용</th>
						<th>평점</th>
					</tr>
			</table>
		<%
			for(LetterEntity lte : list) {
		%>
			<table class="tbl-list">
			<colgroup><col width="10%"><col width="20%"><col width="20%"><col width="40%"><col width="10%"></colgroup>
			<tr>
				<td><%= lte.getId() %></td>
				<td><%= lte.getDatetime() %></td>
				<td><%= lte.getTitle() %></td>
				<td><%= lte.getContent() %></td>
				<td><%= lte.getScore() %></td>
			</tr>
			</table>

			<% } %>

			</div>
		</form>

	</div>
	<!--<div class="push"></div>-->
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />
</body>

</html>