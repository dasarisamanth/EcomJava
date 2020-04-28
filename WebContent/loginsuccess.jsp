<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="./navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
String email=(String)session.getAttribute("user");
Cookie refresh = new Cookie("user",email);
refresh.setMaxAge(60*60);
response.addCookie(refresh);
response.sendRedirect("./success.jsp");
%>

</body>
</html>