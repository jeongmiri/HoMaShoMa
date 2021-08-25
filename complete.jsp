<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

<%
	String impUid = request.getParameter("imp_uid");
%>

var imp_uid = <%=impUid%>;
var payment_result = rest_api_to_find_payment(imp_uid); //imp_uid로 아임포트로부터 결제정보 조회

$(document).ready(function(){

    
    $.ajax({
        type:"GET",
        dataType : "json",
        url:"https://api.iamport.kr/payments/",
        success:function(data){
            consol.log(data);
        },
        error:function(error) {
        	}
        }
});


</script>
</head>
<body>
</body>
</html>


