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

	<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
	<jsp:useBean id="lte" class="letter.LetterEntity" scope="page" />
	<jsp:useBean id="ltedb" class="letter.LetterDBCP" scope="page" />
	<%@page import="hsboard.*" %>
	<%

		request.setCharacterEncoding("euc-kr");
		String productnumber= request.getParameter("ProductNumber");
		String sellerid = request.getParameter("Sellerid");
		String userid = (String)session.getAttribute("id");
		String title = request.getParameter("Title");
		String content = request.getParameter("Content");
		String menu = request.getParameter("menu");
		int score = 1;
	%>
	

	<div class =" container">

	<h2>���侲��</h2>

		<form name="reviewform" method="post" action="reviewinput.jsp?ProductNumber=<%= productnumber %>&Sellerid=<%=sellerid%>" >
		<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
		<input type=hidden name="menu" value="ok">
		<table class="ad">
			<tr>
				<th>��ǰ��ȣ</th>
				<td><%= productnumber %></td>
			</tr>
			<tr>
				<th>�Ǹ���</th>
				<td><%= sellerid %></td>
			</tr>
			<tr>
				<th>������</th>
				<td><%= userid %></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="Title" style="width:98%;"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><textarea wrap="on" name="Content" style="width:98%; height:200px;" charset="EUC-KR"></textarea></td>
			</tr>
			<tr>
				<th>����</th>
				<td></td>
			</tr>

			</table>
			<br>
		<div class="inputSub">
		<input type="submit" class="back2" value="�ۼ�" style="float:middle">
		<input type= "button" value="���" class="back2"  onclick="history.go(-1)">
		</div>
		</form>

		<%
			if(menu != null)
			{ 
				int num = Integer.parseInt(productnumber);
				%>
				
				<jsp:setProperty name="lte" property="productnumber" value="<%= num %>" />
				<jsp:setProperty name="lte" property="id" value="<%= userid %>" />
				<jsp:setProperty name="lte" property="title" value="<%= title %>" />
				<jsp:setProperty name="lte" property="content" value="<%= content %>" />
				<jsp:setProperty name="lte" property="score" value="<%= score %>" />
				<jsp:setProperty name="lte" property="sellerid" value="<%= sellerid %>" /> <%

				ltedb.insertReviewDB(lte);
				response.sendRedirect("productinfo.jsp?ProductNumber="+num);
			}
			%>


	</div>
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>