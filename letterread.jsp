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
			<li><a href="letterreceive.jsp">받은쪽지함</a></li>
			<li><a href="lettersend.jsp">보낸쪽지함</a></li>
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
					<th>보낸사람</th>
					<td><%= sender %></td>
				</tr>
				<tr>
					<th>받는사람</th>
					<td><%= receiver %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%= title %></td>
				</tr>
				<tr>
					<th>날짜</th>
					<td><%= time %></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%= content %></td>
				</tr>
			</table>
	
	<input type= "button" value="확인" class="back2"  onclick="history.go(-1)">
	<input type= "button" value="삭제" class="back2"  onclick="location='letterprocess.jsp?idx=<%=idx%>&menu=<%=a%>'">


	</div>
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>