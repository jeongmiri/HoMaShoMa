function insertcheck() {
	if ( document.productform.ProductName.value=="" ) {
		alert("상품이름을 입력해 주세요.");
		document.productform.ProductName.focus();
		return;
	}
	document.productform.menu.value='insert';
	document.productform.submit();
}

function preupdate() {
	document.productinfoform.menu.value='preflag';
	document.productinfoform.submit();
}

function ingupdate() {
	document.productinfoform.menu.value='ingflag';
	document.productinfoform.submit();
}

function comupdate() {
	document.productinfoform.menu.value='comflag';
	document.productinfoform.submit();
}

function predelete() {
	document.productinfoform.menu.value='predelflag';
	document.productinfoform.submit();
}

function ingdelete() {
	document.productinfoform.menu.value='ingdelflag';
	document.productinfoform.submit();
}

function tracking() {
	document.tracking.menu.value='trackingflag';
	document.tracking.submit();
}

function sendcheck() {
	document.letterform.menu.value='lettersend';
	document.letterform.submit();
}

function letterdel() {
	document.letterform.menu.value='letterdel';
	document.letterform.submit();
}
