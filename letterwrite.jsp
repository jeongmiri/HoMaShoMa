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

	<div class =" container">

	<nav id ="nav3">
		<ul>
			<li><a href="letterreceive.jsp">����������</a></li>
			<li><a href="lettersend.jsp">����������</a></li>
		</ul>
	</nav>

	<h2>����������</h2>

		<form name="letterform" method=post action="letterprocess.jsp" >
		<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
		<input type=hidden name="menu">
		<table class="ad">
			<tr>
				<th>�޴»��</th>
				<td><input type="text" name="Recv_Id" style="width:98%;"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="Title" style="width:98%;"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><textarea wrap="on" name="Content" style="width:98%; height:200px;"></textarea></td>
			</tr>

			</table>
			<br>
		<div class="inputSub">
		<input type="button" class="back2" value="������" style="float:middle" onClick="sendcheck()">
		<input type= "button" value="���" class="back2"  onclick="history.go(-1)">
		</div>
		</form>


	</div>
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>