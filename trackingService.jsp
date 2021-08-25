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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
 
 	<%@ page import="hsboard.*" %>
	<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />
 <%
	String ProductNumber = request.getParameter("ProductNumber");
 	int pnumber = Integer.parseInt(ProductNumber);
 	ProductEntity pro = prodb.getComProduct(pnumber);
 	String code = pro.getCompany();
 	String invoice = pro.getTrackingnumber();
 %>
 
<script type="text/javascript" language="javascript">
 
$(document).ready(function(){

           
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=Sg3xdqCJoGYlDIGPTo3eZQ"+"&t_code="+"<%=code%>"+"&t_invoice="+"<%=invoice%>",
                success:function(data){
                    console.log(data);
                    var myInvoiceData = "";
                    if(data.status == false){
                        myInvoiceData += ('<p>'+data.msg+'<p>');
                    }else{
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"발송인 "+'</td>');                     
                        myInvoiceData += ('<th>'+data.senderName+'</td>');                                         
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');
                        myInvoiceData += ('<th>'+"상품 정보"+'</td>');                     
                        myInvoiceData += ('<th>'+data.itemName+'</td>');   
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');   
                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
                        myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"수령인 주소"+'</td>');                     
                        myInvoiceData += ('<th>'+data.receiverAddr+'</td>');                     
                        myInvoiceData += ('</tr>');                                       
                    }
                    
                    $("#postInfo").html(myInvoiceData)
                    
                    var trackingDetails = data.trackingDetails;
                    
                    var myTracking="";
                    var header ="";
                    header += ('<tr>');                
                    header += ('<th>'+"시간"+'</th>');
                    header += ('<th>'+"장소"+'</th>');
                    header += ('<th>'+"유형"+'</th>');
                    header += ('<th>'+"전화번호"+'</th>');                     
                    header += ('</tr>');     
                    
                    $.each(trackingDetails,function(key,value) {
                        myTracking += ('<tr>');                
                        myTracking += ('<td>'+value.timeString+'</td>');
                        myTracking += ('<td>'+value.where+'</td>');
                        myTracking += ('<td>'+value.kind+'</td>');
                        myTracking += ('<td>'+value.telno+'</td>');                     
                        myTracking += ('</tr>');                                    
                    });
                    
                    $("#postWhere").html(header+myTracking);
                    
                }
            });
      
        
});

</script>
</head>

<body>

<jsp:include page="header.jsp" flush="false" />
<div class="container">

<h2> 배송상태</h2>

<div>
	<table id="postInfo"></table>
</div>

<br>

<div>
	<table id="postWhere"></table>
</div>

</div>

	
	<hr width="90%">
	<jsp:include page="footer.jsp" flush="false" />

</body>
</html>