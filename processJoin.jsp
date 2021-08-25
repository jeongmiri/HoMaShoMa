<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");%>
	<jsp:useBean id="joinBuyer" class="homashoma.BuyerEntity" scope="page" />
	<jsp:useBean id="joinSeller" class="homashoma.SellerEntity" scope="page" />
	<jsp:useBean id="homashomaDB" class="homashoma.HoMaShoMaDBCP" scope="page" />
	
	
	<% 
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String phonenum = request.getParameter("phonenum");
	String email = request.getParameter("email");
	String fulladdress = request.getParameter("fulladdress");
	
	String role = request.getParameter("role");

	%>
	
	<jsp:setProperty name="joinBuyer" property="id" value="<%= id %>" />
	<jsp:setProperty name="joinBuyer" property="password" value="<%= password %>"/>
	<jsp:setProperty name="joinBuyer" property="name" value="<%= name %>"/>
	<jsp:setProperty name="joinBuyer" property="phonenum" value="<%= phonenum %>"/>
	<jsp:setProperty name="joinBuyer" property="email" value="<%= email %>"/>
	<jsp:setProperty name="joinBuyer" property="address" value="<%= fulladdress %>"/>
	
	<jsp:setProperty name="joinSeller" property="id" value="<%= id %>" />
	<jsp:setProperty name="joinSeller" property="password" value="<%= password %>"/>
	<jsp:setProperty name="joinSeller" property="name" value="<%= name %>"/>
	<jsp:setProperty name="joinSeller" property="phonenum" value="<%= phonenum %>"/>
	<jsp:setProperty name="joinSeller" property="email" value="<%= email %>"/>
	<jsp:setProperty name="joinSeller" property="address" value="<%= fulladdress %>"/>

	<% 	
	out.clear();
		

	boolean result = homashomaDB.idDuplicateCheck(id);
	response.setContentType("text/html;charset=euc-kr");

	if(result) out.println("0");
	else out.println("1");
	
	
	if("Buyer".equals(role)) {
		out.println(role);
		homashomaDB.insertBuyer(joinBuyer);
		out.println("<script>location.href = 'login.jsp'</script>");
	}
	else if("Seller".equals(role)) {
		out.println(role);
		homashomaDB.insertSeller(joinSeller);
		out.println("<script>location.href = 'login.jsp'</script>");
	}
	
	%>


	
	