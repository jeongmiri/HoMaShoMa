<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
	<head>
		<title>HoMaShoMa</title>
		
		<meta http-equiv="content-type" content="text/html; charset=EUC-KR" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
		
		<script language=JavaScript src="searchForm.js"></script>
	</head>
	<body class="homepage">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
    <nav id="nav2">
		          <ul>
								<li><a href="login.jsp">LOGIN</a></li>
								<li>
								  <a href="../HoMaShoMa/selectJoin.jsp">JOINUS</a>
								</li>
								<li><a href="login.jsp" id = "id">MY PAGE</a></li>
								<li><a href=""> <% String userid = (String)session.getAttribute("id");

									if(userid != null) { %>
								
								<%= userid %> 님 안녕하세요 :)</a> <% } %></li>
								<li style="float:right;">
									<% if(userid == null) { %>
									<a href="login.jsp">MESSAGE</a> <% } else { %>
									<a href="letterreceive.jsp">MESSAGE</a> <% } %>
								</li>
							</ul>
			</nav>
			
					    <% if(session.getAttribute("id")!=null) {%>
		        	  	<script>
		        	  	var ss = document.getElementsByTagName("a");
		        	  		ss[0].innerHTML="LOGOUT"</script>
		        	  	<%}%>
		        	  	
		        	  	<% if("Buyer".equals(session.getAttribute("role"))) {%>
		        	  	   <script type="text/javascript">
          								$('#id').attr({
								            'href' : 'buyerpage.jsp'});
          									</script><%}%>

						<% if("Seller".equals(session.getAttribute("role"))) {%>
		        	  	   <script type="text/javascript">
          								$('#id').attr({
								            'href' : 'sellerpage.jsp'});
          									</script><%}%>
						
		<!-- Header -->
			<div id="header">
			
					<!-- Logo -->
						<h1><a href="product.jsp" id="logo">HoMaShoMa</a></h1>
						
			<DIV class='search'>
			  <FORM name='searchform' method='post' action="processSearch.jsp">
   				 <table class= 'search_table'> 
   				 <tr>
   				 <th> <input class = 'search_word' type='text' name='word' value=''> </th>
   				 <td> <input class = 'search_submit' type='button' value="&#xf002" onClick="searchcheck()"> </td>
   				 </tr>
   			</table>  
 		 </FORM>
		</DIV>
			
					
					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="product.jsp">HOME</a></li>
								<li>
									<a href="clothes_ing.jsp">CLOTHES</a>
									<ul>
										<li><a href="clothes_pre.jsp">판매예정</a></li>
										<li><a href="clothes_ing.jsp">판매중</a></li>
										<li><a href="clothes_com.jsp">판매완료</a></li>
									</ul>
								</li>
								<li>
								  <a href="food_ing.jsp">FOOD</a>
								  <ul>
										<li><a href="food_pre.jsp">판매예정</a></li>
										<li><a href="food_ing.jsp">판매중</a></li>
										<li><a href="food_com.jsp">판매완료</a></li>
									</ul>
								</li>
								<li>
								  <a href="decoration_ing.jsp">DECORATION</a>
								  <ul>
										<li><a href="decoration_pre.jsp">판매예정</a></li>
										<li><a href="decoration_ing.jsp">판매중</a></li>
										<li><a href="decoration_com.jsp">판매완료</a></li>
									</ul>
								</li>
								<li> 
								  <a href="diy_ing.jsp">DIY</a>
								  <ul>
										<li><a href="diy_pre.jsp">판매예정</a></li>
										<li><a href="diy_ing.jsp">판매중</a></li>
										<li><a href="diy_com.jsp">판매완료</a></li>
									</ul>
								</li>
							</ul>
						</nav>
			</div>

</body>
</html>