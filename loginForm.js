function logincheck() {
	if ( document.loginForm.id.value=="" ) {
		alert("아이디를 입력해 주세요.");
		document.loginForm.id.focus();
		return;
	}
	if ( document.loginForm.password.value=="" ) {
		alert("비밀번호를 입력해 주세요.");
		document.loginForm.password.focus();
		return;
	}
	 
	document.loginForm.submit();
}

function onEnterSubmit() {
	
	if(window.event.keyCode == 13) {
		if ( document.loginForm.id.value=="" ) {
			alert("아이디를 입력해 주세요.");
			document.loginForm.id.focus();
			return;
		}
		if ( document.loginForm.password.value=="" ) {
			alert("비밀번호를 입력해 주세요.");
			document.loginForm.password.focus();
			return;
		}
		
		document.loginForm.submit();
	}
	
}