<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <jsp:include page="./navbar.jsp"/>
<%
String userName=null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")){
		userName = cookie.getValue();
		}
	
	
}
}
else{
	
RequestDispatcher rd=	request.getRequestDispatcher("./login.jsp");
rd.forward(request, response);
		
}
if(userName==null){
	RequestDispatcher rd=	request.getRequestDispatcher("./login.jsp");
	rd.forward(request, response);
			
}
%>
<% if(userName!=null){
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class='container'>
<h1 class='display-1'>Flowers Unavailable Due To Covid-19! Will Update Shortly </h1>
<img class='img-thumbnail'src="https://images.unsplash.com/photo-1574086068064-81cb96f586fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" class="d-block w-100" alt="images">
</div>
<%} %>
</body>
</html>
