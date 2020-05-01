<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import='com.ecom.UserProfile' %>
  <jsp:include page="./navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body style="color:black;background:url(https://images.unsplash.com/photo-1497327632474-4a13f2340887?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80);background-repeat:no-repeat;background-size: cover;">
<div class='alert alert-info mt-3'>Your Details</div>

<%
String userName=null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user"))
	userName = cookie.getValue();
	
}
}
%>
<%if(userName==null){
	RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
	rd.forward(request, response);
} %>

<% String[] ar= UserProfile.getUser(userName);

	out.print("  <ul class=\"list-group row\">\r\n" + 
			"  <li class=\"list-group-item col-lg-3 ml-6 my-2\">"+ar[0]+"</li>\r\n" + 
			"  <li class=\"list-group-item col-lg-3 ml-6 my-2\">"+ar[1]+"</li>\r\n" +
			"  <li class=\"list-group-item col-lg-3 ml-6 my-2\">"+ar[2]+"</li>\r\n" +
			"  <li class=\"list-group-item col-lg-3 ml-6 my-2\">"+ar[3]+"</li>\r\n" +
			 "</ul>");

%>














</body>
</html>