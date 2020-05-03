<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/6b099d3937.js"></script>
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
                        <a  style='text-decoration:none;'href='./viewcart.jsp'><i class="fas fa-shopping-cart mr-2"></i></a>
                        </li>
                        <li>
                        <div class="dropdown text-white mr-2">
                       <a class=" dropdown-toggle" type="link" id="dropdownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%= userName %></a>
                       <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="./addresslist.jsp">Addresses</a>
                        <a class="dropdown-item" href="./userprofile.jsp">MyProfile</a>
                       </div>
                       </div>
                           
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
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>