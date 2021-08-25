<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HoMaShoMa</title>

<script type=text/javascript src="productform.js"></script>
<script type=text/javascript src="test.js"></script>
</head>
<body>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<jsp:include page="header.jsp" flush="false" />
	
		<div class="container">
	
	<%@ page import="homashoma.*" %>
	<%
		request.setCharacterEncoding("euc-kr");
		
		String search = request.getParameter("search");
		String word = request.getParameter("word");
	%>
	<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
	<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />
	
	<h2> SEARCH </h2>
	<div class = "dsearch">
	
	<form method = POST action='processSearch.jsp'>
	<input type ='hidden' name = 'trig' id = 'trig' value='triger'>
	<table class = "detailsearch">
	<tr>
	<th> 상품 분류 </th>
	<td> <select class = "category" name = "category">
				<option value="" selected = "selected"> 상품 분류 선택 </option>
				<option value="clothes"> CLOTHES </option>
				<option value="food"> FOOD </option>
				<option value="decoration"> DECORATION </option>
				<option value="diy"> DIY </option>
				</select> </td>
	</tr>
	<tr>
	<th> 검색 조건 </th>
	<td> <select name = 'condition' class = "condition"><option value="name" selected = "selected"> 상품명 </option>
				<option value="seller"> 판매자 </option>
				</select> <input name = 'wordd' class = "word" type='text' value = ""> </td>
	</tr>
	<tr>
	<th> 판매 가격대 </th>
	<td> <input type='text' name = 'min' class = "minprice"> ~ <input type='text' name = 'max' class = "maxprice"> </td>
	</tr> 
	<tr>
	<td colspan = "2" align="center">
	<input type='submit' value="검색하기" class = "ssubmit"> </td>
	</tr> 
	</table>
	</form>
	</div>
	<br>
	<br>
	
	
	<%
	
		String category = "";
		String condition = "";
		String wordd = word;
		String min = "";
		String max = "";
		
		String trig = request.getParameter("trig");
		if(trig != null) {
			category = request.getParameter("category");
			condition = request.getParameter("condition");
			wordd = request.getParameter("wordd");
			min = request.getParameter("min");
			max = request.getParameter("max");
		}
	
		ArrayList<ProductEntity> list = prodb.searchProduct(category, condition, wordd, min, max);
   		int counter = list.size();
		if(counter > 0) {
		
		for(ProductEntity pro : list) {
	%>
			<a href="productinfo.jsp?ProductNumber=<%= pro.getProductnumber() %>">
			<div class="item">
				<div class="image">
				<img src="images/<%= pro.getProductimage() %>" /></img>
				</div>
				<h3><%= pro.getProductname() %> </h3>
				<p><%= pro.getProductprice() %> won</p>
			</div>
			</a>
		<%
			}
		}
		else {
			out.println("정확한 값을 입력해 주세요!");
		}
		%>
	</div>
	
</div>

	<hr width="90%">

	<jsp:include page="footer.jsp" flush="false" />
</body>
</html>