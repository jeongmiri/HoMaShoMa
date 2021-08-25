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


	<%@ page import="java.util.ArrayList, letter.LetterEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="ltedb" class="letter.LetterDBCP" scope="page" />
		<% 

		request.setCharacterEncoding("euc-kr");
		String userid = (String)session.getAttribute("id");
	
		ArrayList<LetterEntity> list = ltedb.getLetterSenderList(userid);

	%>

	<div class =" container">

	<nav id ="nav3">
		<ul>
			<li><a href="letterreceive.jsp">����������</a></li>
			<li style="background-color:#aaa"><a href="lettersend.jsp" style="color:#fff">����������</a></li>
		</ul>
	</nav>

	<table class="tbl-list">
					<colgroup><col width="20%"><col width="60%"><col width="20%"></colgroup>
					<tr>
						<th>�޴»��</th>
						<th>����</th>
						<th>��¥</th>
					</tr>
	</table>

	<%
	for(LetterEntity lte : list) { %>
		<table class="tbl-list">
					<colgroup><col width="20%"><col width="60%"><col width="20%"></colgroup>
					<tr>
						<td><%= lte.getRecv_id() %></td>
						<td><a href="letterread.jsp?Idx=<%=lte.getIdx() %>"><%= lte.getTitle() %></a></td>
						<td><%= lte.getDatetime() %></td>
					</tr>
		</table> <% } %>
	<br />
	<input type= "button" value="����������" class="back2"  onclick="location='letterwrite.jsp'">

	</div>
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>