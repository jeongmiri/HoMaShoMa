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
    <th>아이디</th>
	<td><input type = "text" name = "id" id = "idid" onchange=idDuplicateCheck() autocomplete="off"> <br> <div style= "margin:5px -5px 0 0;color:red;" id = idmsg></div> </td>
  </tr>
  <tr>
    <th>비밀번호</th>
    <td><input type = "password" name = "password" id = "password" autocomplete="off"> </td>
  </tr>
  <tr>
    <th>비밀번호 확인</th>
    <td><input type = "password" name = "passwordconfirm" id = "passwordconfirm" onchange=passwordEqualCheck() autocomplete="off"> <br> <div style= "margin:5px -5px 0 0;color:red;" id = passwordmsg></div> </td>
  </tr>
    <tr>
    <th>이름</th>
    <td><input type = "text" name = "name"autocomplete="off"></td>
  </tr>
    <tr>
    <th>주소</th>
    <td> <input type="text" id="postcode" placeholder="우편번호"autocomplete="off">
		 <input type="button" id="postcodebutton" onclick="execDaumPostcode()" value="우편번호 찾기"autocomplete="off"> <br>
	 	 <input type="text" name = "address" id="address" placeholder="주소"autocomplete="off"> <br>
		 <input type="text" name = "detailaddress" id="detailaddress" placeholder="상세주소"autocomplete="off">
	 	 <input type="text" name = "extraaddress" id="extraaddress" placeholder="참고항목"autocomplete="off">
		 <input type="hidden" name = "fulladdress" id = "fulladdress">
		 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraaddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraaddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
</script> </td>
  </tr>
  <tr>
    <th>휴대 전화</th>
    <td><select name = "phone1" id = "phone1"> <option value="010" selected = "selected">010</option>
    			 <option value="016">016</option>
    			 <option value="017">017</option>
    			 <option value="018">018</option>
    			 <option value="019">019</option> </select> - 
    	<input type='text' name = "phone2" id = "phone2" size="3" maxlength="4"  autocomplete="off"/> - <input type='text' name = "phone3" id = "phone3" size="3" maxlength="4"autocomplete="off"  />
    	<input type='hidden' name = "phonenum" id = "phonenum"autocomplete="off"> </td>
  </tr>
  <tr>
    <th>이메일</th>
    <td><input type = "email" name = "email" autocomplete="off"></td>
  </tr>
</table>
</form>
  <br>
  <div class = "inputSub">
  	<input type = 'button' value = "&#xf00c 회원 가입" class="signUp" onClick= "insertcheck()"autocomplete="off">
  	<input type = 'button' value = "취소" class="back" onClick="location='selectJoin.jsp'"autocomplete="off">
  </div>
	</div>
	<hr width="90%">
  <jsp:include page="footer.jsp" flush="false" />
</body>
</html>