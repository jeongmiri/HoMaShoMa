<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script language=JavaScript src="productform.js"></script>
</head>
<body>
	
	<%@ page import="hsboard.*" %>
	
	<%
		request.setCharacterEncoding("euc-kr");
	
		String productnumber = request.getParameter("ProductNumber");
		String success = "0";
	
		int num = Integer.parseInt(productnumber);
		ProductDBCP prodb = new ProductDBCP();
		ProductEntity pro = prodb.getProduct(num);
		
		String pname = pro.getProductname();
		String price = pro.getProductprice();
	
	%>

    <script charset="EUC-KR">
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init("imp88648066"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '<%= pname %>',
            amount : '<%= price %>',
            buyer_email : 'test@test.com',
            buyer_name : 'test',
            buyer_tel : '01012345678',
            buyer_addr : 'test',
            buyer_postcode : '123-456'
        }, function(rsp) {
            if ( rsp.success ) {
     
                jQuery.ajax({
                    url: "complete.jsp", 
                    contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
                    type: 'POST',
                    dataType: 'json',
             		data: {
        	    		imp_uid : rsp.imp_uid
            		}
                }).done(function(data) {
     
                    if ( everythings_fine ) {

                    } else {
                    	
                    }
                });
				

                <% success = "1";%>
                location.href='productinfo.jsp?ProductNumber=<%=productnumber%>&success=<%=success%>';
                
                alert("Success!");
            } else {
                msg = rsp.error_msg;

                alert(msg);
                location.href='productinfo.jsp?ProductNumber=<%=productnumber%>';
            }
        });
    });
    </script>
 
</body>
</html>
