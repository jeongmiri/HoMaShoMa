<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>HoMaShoMa</title>
		
</head>

<body>

	<!-- 게시의 등록, 수정, 삭제를 위한 자바빈즈 이용 선언-->
	<%@ page import="java.util.ArrayList, hsboard.ProductEntity, java.text.SimpleDateFormat" %>
	<jsp:useBean id="lte" class="letter.LetterEntity" scope="page" />
	<jsp:useBean id="ltedb" class="letter.LetterDBCP" scope="page" />
	
	<jsp:useBean id="prodb" class="hsboard.ProductDBCP" scope="page" />

	<%@ page import="letter.*" %>
	<%
		request.setCharacterEncoding("euc-kr");
		
		String productnumber = request.getParameter("ProductNumber");
		String idx = request.getParameter("idx");
		String menu = request.getParameter("menu");
		String sender_id = (String)session.getAttribute("id");
		String receiver_id = request.getParameter("Recv_Id");
		String title = request.getParameter("Title");
		String content = request.getParameter("Content");
		String sellerid = request.getParameter("Sellerid");
		int recv_chk = 0;

		if(menu.equals("lettersend")) {
		%>
			<jsp:setProperty name="lte" property="send_id" value="<%= sender_id %>" />
			<jsp:setProperty name="lte" property="recv_id" value="<%= receiver_id %>" />
			<jsp:setProperty name="lte" property="title" value="<%= title %>" />
			<jsp:setProperty name="lte" property="content" value="<%= content %>" />
			<jsp:setProperty name="lte" property="checkflag" value="<%= recv_chk %>" />
		<%

			ltedb.insertDB(lte);

			response.sendRedirect("lettersend.jsp");

		} 
		if(menu.equals("delete")) {
			
			int num = Integer.parseInt(idx);
			ltedb.deleteDB(num);
			
			response.sendRedirect("lettersend.jsp"); }
			
		if(menu.equals("goflag")) {
			int num = Integer.parseInt(productnumber);

			ArrayList<ProductEntity> list = prodb.getBuyerProductListNum(num);

			for(ProductEntity pro : list) {
			%>
			<jsp:setProperty name="lte" property="send_id" value="admin" />
			<jsp:setProperty name="lte" property="recv_id" value="<%= pro.getId() %>" />
			<jsp:setProperty name="lte" property="title" value="예약하신 상품이 구매 가능합니다." />
			<jsp:setProperty name="lte" property="content" value="감사합니다. 고객님이 예약하신 상품이 구매완료 상태로 변경 되었습니다. 지금 마이페이지로 가서 확인 해 주세요 :)" />
			<jsp:setProperty name="lte" property="checkflag" value="<%= recv_chk %>" />
			<%

			ltedb.insertDB(lte);

			}
			response.sendRedirect("productinfo.jsp?ProductNumber="+num);
		}

		%>


</body>
</html>