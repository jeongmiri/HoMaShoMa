function searchcheck() {
	if ( document.searchform.word.value=="" ) {
		alert("검색어를 입력해 주세요!");
		document.searchform.id.focus();
		return;
	}
	document.searchform.submit();
}