<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

</head>
<body>
<%
String userName=null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	
}
}
%>

<nav  class="navbar navbar-expand navbar-light bg-dark sticky-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a style="color:whitesmoke;text-decoration:none" href='/Ecom/' class='navbar-brand'>
                         The Florist's   
                        </a>
                    </div>
             
                    <div class="d-flex justify-content-between">
                  
                         <% 
                         if(session.getAttribute("user")!=null || userName!=null){
                         %>
                        <ul class='nav navbar-nav navbar-right'>
                        <li>
                            <a style="color:whitesmoke;text-decoration:none" class='mr-2' href="#"><%= userName %></a>
                        </li>
                         <li>
                            <a style="color:whitesmoke;text-decoration:none" class='mr-2' href="./logout">LogOut</a>
                        </li>
                       

                        </ul>
                        <%}else{ %>
                        
                        
                   
                        <ul class='nav navbar-nav navbar-right'>
                           
                            <li>
                                <a style="color:whitesmoke;text-decoration:none" class='ml-2' href='./login.jsp'>Log In</a>
                            </li>

                        </ul>
                       <%} %>
    
                    </div>
    
                   
                </div>
           


            </nav>

</body>
</html>