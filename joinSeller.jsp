<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HoMaShoMa</title>
<style>

</style>

<script type=text/javascript src="joinForm.js"></script>

</head>
<body>

<jsp:include page="header.jsp" flush="false" />
<div class="container">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<h2> SELLER SIGN UP </h2>
<form name = joinForm method = POST action = "processJoin.jsp">
<input type=hidden name="role" id = "role" value="Seller">
<table class="ad">
  <tr>
    <th>���̵�</th>
	<td><input type = "text" name = "id" id = "idid" onchange=idDuplicateCheck() autocomplete="off"> <br> <div style= "margin:5px -5px 0 0;color:red;" id = idmsg></div> </td>
  </tr>
  <tr>
    <th>��й�ȣ</th>
    <td><input type = "password" name = "password" id = "password" autocomplete="off"> </td>
  </tr>
  <tr>
    <th>��й�ȣ Ȯ��</th>
    <td><input type = "password" name = "passwordconfirm" id = "passwordconfirm" onchange=passwordEqualCheck() autocomplete="off"> <br> <div style= "margin:5px -5px 0 0;color:red;" id = passwordmsg></div> </td>
  </tr>
    <tr>
    <th>�̸�</th>
    <td><input type = "text" name = "name"autocomplete="off"></td>
  </tr>
    <tr>
    <th>�ּ�</th>
    <td> <input type="text" id="postcode" placeholder="�����ȣ"autocomplete="off">
		 <input type="button" id="postcodebutton" onclick="execDaumPostcode()" value="�����ȣ ã��"autocomplete="off"> <br>
	 	 <input type="text" name = "address" id="address" placeholder="�ּ�"autocomplete="off"> <br>
		 <input type="text" name = "detailaddress" id="detailaddress" placeholder="���ּ�"autocomplete="off">
	 	 <input type="text" name = "extraaddress" id="extraaddress" placeholder="�����׸�"autocomplete="off">
		 <input type="hidden" name = "fulladdress" id = "fulladdress">
		 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("extraaddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraaddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
</script> </td>
  </tr>
  <tr>
    <th>�޴� ��ȭ</th>
    <td><select name = "phone1" id = "phone1"> <option value="010" selected = "selected">010</option>
    			 <option value="016">016</option>
    			 <option value="017">017</option>
    			 <option value="018">018</option>
    			 <option value="019">019</option> </select> - 
    	<input type='text' name = "phone2" id = "phone2" size="3" maxlength="4"  autocomplete="off"/> - <input type='text' name = "phone3" id = "phone3" size="3" maxlength="4"autocomplete="off"  />
    	<input type='hidden' name = "phonenum" id = "phonenum"autocomplete="off"> </td>
  </tr>
  <tr>
    <th>�̸���</th>
    <td><input type = "email" name = "email" autocomplete="off"></td>
  </tr>
</table>
</form>
  <br>
  <div class = "inputSub">
  	<input type = 'button' value = "&#xf00c ȸ�� ����" class="signUp" onClick= "insertcheck()"autocomplete="off">
  	<input type = 'button' value = "���" class="back" onClick="location='selectJoin.jsp'"autocomplete="off">
  </div>
	</div>
	<hr width="90%">
  <jsp:include page="footer.jsp" flush="false" />
</body>
</html>