function searchcheck() {
	if ( document.searchform.word.value=="" ) {
		alert("�˻�� �Է��� �ּ���!");
		document.searchform.id.focus();
		return;
	}
	document.searchform.submit();
}