
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="./navbar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<% if(session.getAttribute("user")==null){
response.sendRedirect("./login.jsp");
}
else{
	String user= (String)session.getAttribute("user");
	String userName=null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	
}
}
if(user.equals(userName)){
	response.sendRedirect("./success.jsp");
}
  
}
%>


</body>
</html>