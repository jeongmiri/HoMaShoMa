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
    <th>아이디</th>
	<td><input type = "text" name = "id"> (영문 소문자 / 숫자, 4~16자)</td>
  </tr>
  <tr>
    <th>비밀번호</th>
    <td><input type = "text" name = "Password"> (영문 대소문자 / 숫자 / 특수 문자 중 2가지 이상 조합, 8자~16자)</td>
  </tr>
  <tr>
    <th>비밀번호 확인</th>
    <td><input type = "text" name = "PasswordConfirm"></td>
  </tr>
    <tr>
    <th>비밀번호 확인 질문</th>
    <td><input type = "text" name = "PasswordConfirmQuestion"></td>
  </tr>
    <tr>
    <th>비밀번호 확인 답변</th>
    <td><input type = "text" name = "PasswordConfirmAnswer"></td>
  </tr>
    <tr>
    <th>이름</th>
    <td><input type = "text" name = "Name"></td>
  </tr>
    <tr>
    <th>주소</th>
    <td> <input type="text" id="sample6_postcode" placeholder="우편번호">
		 <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"> <br>
	 	 <input type="text" id="sample6_address" placeholder="주소"> <br>
		 <input type="text" id="sample6_detailAddress" placeholder="상세주소">
	 	 <input type="text" id="sample6_extraAddress" placeholder="참고항목">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
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
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script> </td>
  </tr>
  <tr>
    <th>휴대 전화</th>
    <td><select> <option value="010" selected = "selected">010</option>
    			 <option value="016">016</option>
    			 <option value="017">017</option>
    			 <option value="018">018</option>
    			 <option value="019">019</option> </select> - 
    	<input type='text' size="3" maxlength="4" /> - <input type='text' size="3" maxlength="4" /></td>
  </tr>
  <tr>
    <th>이메일</th>
    <td><input type = "email" name = "Email"></td>
  </tr>
</table>
  <br>
  <div class = "inputSub">
  	<input type = 'submit' value = "&#xf00c 회원 가입" class="signUp">
  	<input type = 'submit' value = "취소" class="back">
  </div>
</body>
</html>