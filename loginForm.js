function logincheck() {
	if ( document.loginForm.id.value=="" ) {
		alert("���̵� �Է��� �ּ���.");
		document.loginForm.id.focus();
		return;
	}
	if ( document.loginForm.password.value=="" ) {
		alert("��й�ȣ�� �Է��� �ּ���.");
		document.loginForm.password.focus();
		return;
	}
	 
	document.loginForm.submit();
}

function onEnterSubmit() {
	
	if(window.event.keyCode == 13) {
		if ( document.loginForm.id.value=="" ) {
			alert("���̵� �Է��� �ּ���.");
			document.loginForm.id.focus();
			return;
		}
		if ( document.loginForm.password.value=="" ) {
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.loginForm.password.focus();
			return;
		}
		
		document.loginForm.submit();
	}
	
}