<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import "tracking.css";

</style>

<meta charset="EUC-KR">
<title>HoMaShoMa</title>
<script language=JavaScript src="productform.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
 
<script type="text/javascript" language="javascript">
$(document).ready(function(){
	
    $.ajax({
        type:"GET",
        dataType : "json",
        url:"https://info.sweettracker.co.kr/api/v1/companylist",
        data: {
        	t_key: "Sg3xdqCJoGYlDIGPTo3eZQ"
        },
        success:function(data){
                var parseData = JSON.parse(JSON.stringify(data));
                 console.log(parseData.Company);
                
                var CompanyArray = data.Company;
                console.log(CompanyArray); 
                
                var myData="";
                $.each(CompanyArray,function(key,value) {
                        myData += ('<option value='+value.Code+'>' +value.Name + '</option>');                        
                });
                $("#CompnayList").html(myData);
        },
        error : function(){
            alert('조회 실패!');
        }
    });

 
});
 </script>
 </head>
 <body>

 <jsp:include page="header.jsp" flush="false" />

<div class="container">
 <%
 	String num = request.getParameter("ProductNumber");
	String id = request.getParameter("Id");
	%>


<form name="tracking" method=post action="processproduct.jsp?ProductNumber=<%= num %>&Id=<%= id %>">
	<input type=hidden name="menu" value="trackingflag">
	<table class = "inputBox">
		<tr>
		<th><span id="CompnayName">택배 회사명 </span></th>
		<td><select id="CompnayList" name="CompnayList"></select></td>
		</tr>
		<tr>
		<th><span id="invoiceNumber">송장 번호 </span></th>
		<td><input type="text" id="invoiceNumberText" name="invoiceNumberText"></td>
		</tr>
	</table>


	<input type="submit" class="back2" value="번호입력">
</form>

<br>

</div>

	
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

 </body>
 </html>