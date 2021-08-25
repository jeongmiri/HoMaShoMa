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

	<div class =" container">

	<nav id ="nav3">
		<ul>
			<li><a href="letterreceive.jsp">����������</a></li>
			<li><a href="lettersend.jsp">����������</a></li>
		</ul>
	</nav>

	<%@ page import="letter.*" %>
	<%@ page import="java.sql.*"%>
	<%
		request.setCharacterEncoding("euc-kr");

		String idx = request.getParameter("Idx");

		int num = Integer.parseInt(idx);
		LetterDBCP ltedb = new LetterDBCP();
		LetterEntity lte = ltedb.getLetter(num);
		
		String sender = lte.getSend_id();
		String receiver = lte.getRecv_id();
		String title = lte.getTitle();
		String content = lte.getContent();
		Timestamp time = lte.getDatetime();

		String a="delete";
	%>

	<table class="productinfo">
			<colgroup>
				<col width="20%">
				<col width="60%">
			</colgroup>
				<tr>
					<th>�������</th>
					<td><%= sender %></td>
				</tr>
				<tr>
					<th>�޴»��</th>
					<td><%= receiver %></td>
				</tr>
				<tr>
					<th>����</th>
					<td><%= title %></td>
				</tr>
				<tr>
					<th>��¥</th>
					<td><%= time %></td>
				</tr>
				<tr>
					<th>����</th>
					<td><%= content %></td>
				</tr>
			</table>
	
	<input type= "button" value="Ȯ��" class="back2"  onclick="history.go(-1)">
	<input type= "button" value="����" class="back2"  onclick="location='letterprocess.jsp?idx=<%=idx%>&menu=<%=a%>'">


	</div>
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>