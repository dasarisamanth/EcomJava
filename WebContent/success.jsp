<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <jsp:include page="./navbar.jsp"/>
<%@page import='com.ecom.DisplayProducts' %>
<%@page import='com.ecom.Product' %>
<%@page import="java.util.*"%> 
<%@ page isELIgnored = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<div class='row d-flex justify-content-center'>
<% ArrayList<Product> products=DisplayProducts.getProducts();

for(Product product:products){
	out.print("<form class='col-lg-3 m-3'  action='./addtocart'>"+
			"<div class=\"card\">\r\n" + 
			"  <img class=\"card-img-top p-3\" style='height:26rem'src="+product.getP_img()+" alt=\"Card image cap\">\r\n" + 
			"  <div class=\"card-body\">\r\n" + 
			"    <h5 class=\"card-title\">"+product.getP_name()+"</h5>\r\n" + 
			"    <p class=\"card-text\">Fresh Exotic Flowers.</p>\r\n" + 
			"    <p class=\"card-text\">"+"Qty:"+product.getP_qty()+"</p>\r\n" + 
			"    <p class=\"card-text\">"+"$"+product.getP_price()+"</p>\r\n" + 
					"<label for=\"cars\">Qty:</label>\r\n" + 
					"<select name='qty' class='btn btn-light' id=\"cars\">\r\n" + 
					"  <option value=\"1\">1</option>\r\n" + 
					"  <option value=\"2\">2</option>\r\n" + 
					"  <option value=\"3\">3</option>\r\n" + 
					"  <option value=\"4\">4</option>\r\n" + 
					"  <option value=\"5\">5</option>\r\n" + 
					"</select>"+
			" <button class='btn btn-primary' name='addtocart' value="+product.getP_id()+" type='submit'>Add</button>" +
			"  </div>\r\n" + 
			"  </div>\r\n" + 
			 
			"</form>");
}
%>
</div>
</div>
 
<%} %>
</body>
</html>
