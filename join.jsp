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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<table class="a">
  <tr>
    <th>���̵�</th>
	<td><input type = "text" name = "id"> (���� �ҹ��� / ����, 4~16��)</td>
  </tr>
  <tr>
    <th>��й�ȣ</th>
    <td><input type = "text" name = "Password"> (���� ��ҹ��� / ���� / Ư�� ���� �� 2���� �̻� ����, 8��~16��)</td>
  </tr>
  <tr>
    <th>��й�ȣ Ȯ��</th>
    <td><input type = "text" name = "PasswordConfirm"></td>
  </tr>
    <tr>
    <th>��й�ȣ Ȯ�� ����</th>
    <td><input type = "text" name = "PasswordConfirmQuestion"></td>
  </tr>
    <tr>
    <th>��й�ȣ Ȯ�� �亯</th>
    <td><input type = "text" name = "PasswordConfirmAnswer"></td>
  </tr>
    <tr>
    <th>�̸�</th>
    <td><input type = "text" name = "Name"></td>
  </tr>
    <tr>
    <th>�ּ�</th>
    <td> <input type="text" id="sample6_postcode" placeholder="�����ȣ">
		 <input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"> <br>
	 	 <input type="text" id="sample6_address" placeholder="�ּ�"> <br>
		 <input type="text" id="sample6_detailAddress" placeholder="���ּ�">
	 	 <input type="text" id="sample6_extraAddress" placeholder="�����׸�">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
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
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script> </td>
  </tr>
  <tr>
    <th>�޴� ��ȭ</th>
    <td><select> <option value="010" selected = "selected">010</option>
    			 <option value="016">016</option>
    			 <option value="017">017</option>
    			 <option value="018">018</option>
    			 <option value="019">019</option> </select> - 
    	<input type='text' size="3" maxlength="4" /> - <input type='text' size="3" maxlength="4" /></td>
  </tr>
  <tr>
    <th>�̸���</th>
    <td><input type = "email" name = "Email"></td>
  </tr>
</table>
  <br>
  <div class = "inputSub">
  	<input type = 'submit' value = "&#xf00c ȸ�� ����" class="signUp">
  	<input type = 'submit' value = "���" class="back">
  </div>
</body>
</html>