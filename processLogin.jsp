<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");%>
	<jsp:useBean id="homashomaDB" class="homashoma.HoMaShoMaDBCP" scope="page" />
	
	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		String role = homashomaDB.loginCheck(id, password);
		response.setContentType("text/html;charset=euc-kr");
		
		if("Buyer".equals(role) || "Seller".equals(role)) {
			session.setAttribute("id", id);
			session.setAttribute("role", role);
		    session.setMaxInactiveInterval(60*60);
		    response.sendRedirect("product.jsp");	
		}
		else { out.println("����");%>
		<script>alert("���̵� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
		location.href = "login.jsp";
		</script>
	<% 
		}
	%>