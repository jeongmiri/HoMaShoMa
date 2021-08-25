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

		<%@ page import="java.util.ArrayList, letter.LetterEntity, java.text.SimpleDateFormat" %>
		<jsp:useBean id="ltedb" class="letter.LetterDBCP" scope="page" />
		<% 

		request.setCharacterEncoding("euc-kr");
		String userid = (String)session.getAttribute("id");
	
		ArrayList<LetterEntity> list = ltedb.getLetterReceiverList(userid);

		%>

	<div class =" container">
	<nav id ="nav3">
		<ul>
			<li style="background-color:#aaa"><a href="letterreceive.jsp" style="color:#fff">받은쪽지함</a></li>
			<li><a href="lettersend.jsp">보낸쪽지함</a></li>
		</ul>
	</nav>

	<table class="tbl-list">
					<colgroup><col width="20%"><col width="60%"><col width="20%"></colgroup>
					<tr>
						<th>보낸사람</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
	</table>

	<%
	for(LetterEntity lte : list) { %>
		<table class="tbl-list">
					<colgroup><col width="20%"><col width="60%"><col width="20%"></colgroup>
					<tr>
						<td><%= lte.getSend_id() %></td>
						<td><a href="letterread.jsp?Idx=<%=lte.getIdx() %>"><%= lte.getTitle() %></a></td>
						<td><%= lte.getDatetime() %></td>
					</tr>
		</table> <% } %>

	</div>
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>