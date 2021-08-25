<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	String uploadPath = request.getRealPath("HoMaShoMa/images");

	int size = 10*1024*1024;
	String filename="";
	String productname="";
	String category="";
	String productprice="";
	String productinformation ="";
	String productminimumquantity="";
	String productmaximumquantity="";
	String menu="";

	MultipartRequest multi = null;

	try {
		multi = new MultipartRequest(request, uploadPath, size, "euc-kr", new DefaultFileRenamePolicy());
		
		productname = multi.getParameter("ProductName");
		category = multi.getParameter("Category");
		productprice = multi.getParameter("ProductPrice");
		productinformation = multi.getParameter("ProductInformation");
		productminimumquantity = multi.getParameter("ProductMinimumQuantity");
		productmaximumquantity = multi.getParameter("ProductMaximumQuantity");
		menu = multi.getParameter("menu");

		Enumeration files = multi.getFileNames();
		String image = (String)files.nextElement();
		filename = multi.getFilesystemName(image);

	} catch(Exception e) {
		e.printStackTrace();
	}
%>
	<form name="uploadform" action="processproductinsert.jsp" method=post >

		<input type=hidden name="menu" value="<%= menu %>">
		<input type=hidden name="Category" value="<%= category %>">
		<input type=hidden name="ProductName" value="<%= productname %>">
		<input type=hidden name="ProductImage" value="<%= filename %>">
		<input type=hidden name="ProductPrice" value="<%= productprice %>">
		<input type=hidden name="ProductInformation" value="<%= productinformation %>">
		<input type=hidden name="ProductMinimumQuantity" value="<%= productminimumquantity %>">
		<input type=hidden name="ProductMaximumQuantity" value="<%= productmaximumquantity%>">

	</form>
	<script>document.uploadform.submit();</script>
</body>
</html>