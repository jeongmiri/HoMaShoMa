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

<div class="selectjoin">
<h2> JOINUS </h2>

	<a href="joinBuyer.jsp">
		<img src="images/1481393583_add-buy-plus-shopping-cart.png" width="40%"></img>
		<h4>BUYER</h4>
	
	</a>


	<a href="joinSeller.jsp">
		<img src="images/1481393595_store-sign.png" width="40%"></img>
		<h4>SELLER</h4>
	</a>
	</div>

<hr width="90%">
<jsp:include page="footer.jsp" flush="false" />
</body>
</html>