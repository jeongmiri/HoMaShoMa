function insertcheck() {
	if ( document.joinForm.id.value=="" ) {
		alert("아이디를 입력해 주세요.");
		document.joinForm.id.focus();
		return;
	}
	if ( document.joinForm.password.value=="" ) {
		alert("비밀번호를 입력해 주세요.");
		document.joinForm.password.focus();
		return;
	}
	if ( document.joinForm.passwordconfirm.value=="" ) {
		alert("비밀번호 확인을 입력해 주세요.");
		document.joinForm.passwordconfirm.focus();
		return;
	}
	if ( document.joinForm.name.value=="" ) {
		alert("이름을 입력해 주세요.");
		document.joinForm.name.focus();
		return;
	}
	if ( document.joinForm.address.value=="" ) {
		alert("주소를 입력해 주세요.");
		document.joinForm.postcodebutton.focus();
		return;
	}
	if ( document.joinForm.phone2.value=="" || document.joinForm.phone3.value=="") {
		alert("전화번호를 입력해 주세요.");
		if(document.joinForm.phone2.value=="") {
			document.joinForm.phone2.focus();
			return;}
		else if(document.joinForm.phone3.value=="") {
			document.joinForm.phone3.focus();
			return;}
		
	}
	if ( document.joinForm.email.value=="" ) {
		alert("이메일을 입력해 주세요.");
		document.joinForm.email.focus();
		return;
	}
	
	var fulladdress = document.getElementById("fulladdress");
	var address = document.getElementById("address"), extraaddress  = document.getElementById("extraaddress"), detailaddress = document.getElementById("detailaddress");

	fulladdress.value = address.value + " " + extraaddress.value + " " + detailaddress.value;
	
	var phonenum = document.getElementById("phonenum");
	var phone1 = document.getElementById("phone1"), phone2 = document.getElementById("phone2"), phone3 = document.getElementById("phone3");
	
	phonenum.value = phone1.value + "-" + phone2.value + "-" + phone3.value;
	
	document.joinForm.submit();
}

function idDuplicateCheck() {
	
	var id = document.getElementById("idid").value;
	
	var param = "id=" + id;
	httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = callback;
	httpRequest.open("POST", "processJoin.jsp", true);
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	httpRequest.send(param);
}

function callback() {
	if(httpRequest.readyState == 4) {
		var resultText = httpRequest.responseText;
		console.log(resultText);
		if(resultText == 0) {
			console.log(resultText);
			document.getElementById("idmsg").innerHTML = "중복된 아이디입니다";
			document.getElementById("idid").value = "";
		}
		else if(resultText == 1){
			console.log(resultText);
			document.getElementById("idmsg").innerHTML = "";
		}
	}
}

function passwordEqualCheck() {
	 
	 var password = document.getElementById("password").value;
	 var passwordconfirm = document.getElementById("passwordconfirm").value;
	 
	 if(password != passwordconfirm) {
		 document.getElementById("passwordmsg").innerHTML = "비밀번호가 일치하지 않습니다";
			document.getElementById("passwordconfirm").value = "";
	 }
	 else
		 document.getElementById("passwordmsg").innerHTML = "";
	 
}