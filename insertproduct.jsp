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

	<div class ="container">

	<h2>��ǰ���</h2>

		<form name="productform" method=post action="upload.jsp" enctype="multipart/form-data" >
		<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
		
		<input type=hidden name="menu" value="insert">
		<table class="ad">
			<tr>
				<th>��ǰ�̸�</th>
				<td><input type="text" name="ProductName"></td>
			</tr>
			<tr>
				<th>ī�װ�</th>
				<td><select name="Category"> <option value="clothes" selected = "selected">clothes</option>
    			 <option value="food">food</option>
    			 <option value="decoration">decoration</option>
    			 <option value="diy">diy</option></select></td>
			</tr>
			<tr>
				<th>��ǰ�̹���</th>
				<td><input type="file" name="ProductImage"></td>
			</tr>
			<tr>
				<th>��ǰ����</th>
				<td><input type="text" name="ProductPrice"></td>
			</tr>
			<tr>
				<th>��ǰ����</th>
				<td><textarea name="ProductInformation" cols = "40" rows="5" autofocus required wrap = "hard" ></textarea></td>
			</tr>
			<tr>
				<th>�ּ��Ǹż���</th>
				<td><input type="text" name="ProductMinimumQuantity"></td>
			</tr>
			<tr>
				<th>�ִ��Ǹż���</th>
				<td><input type="text" name="ProductMaximumQuantity"></td>
			</tr>
			</table>
			<br>
		<div class="inputSub">
		<input type="button" class="back2" value="���" style="float:middle" onClick="insertcheck()">
		<input type= "button" value="���" class="back2"  onclick="history.go(-1)">
		</div>
		</form>
		
	</div>
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />


</body>
</html>