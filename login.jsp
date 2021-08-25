<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HoMaShoMa</title>
<style>
@import "login.css";
</style>

<script type=text/javascript src="loginForm.js"></script>

</head>
<body>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

 <% if(session.getAttribute("id")!=null) {
	session.invalidate();
	}%>
	
	<%--위의 코드 옮기지 않기 ㄱ 바보 멍청이 신혜쑤--%>
	
	<jsp:include page="header.jsp" flush="false" />

	<div class =" container">


<form class = "loginForm" name = loginForm method = POST action = "processLogin.jsp">
<h4> MEMBER LOGIN </h4>
<table class="a">
	
  <tr>
    <th>ID</th>
	<td><input class = "id" type = "text" name = "id" id = "id"> </td>
  </tr>
  <tr>
    <th>PASSWORD</th>
	<td><input class = "password" type = "password" name = "password" id = "password" autocomplete="off"> </td>
  </tr>
  <tr> 
  <td colspan="2" class = "loginbutton"><input type = "button" class = "login" value = "LOGIN" onClick="logincheck()"></td>
  </tr>
  <tr> 
  <td colspan="2" class = "joinbutton"><input type = "button" class = "join" value = "JOIN" onClick="location.href='selectJoin.jsp'"></td>
  </tr>
 
  
</table>

</form>
</div>
<hr width="90%">
<jsp:include page="footer.jsp" flush="false" />
</body>
</html>