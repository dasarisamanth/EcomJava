<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <jsp:include page="./navbar.jsp"/>
<%@page import='com.ecom.CartProducts' %>
<%@page import='com.ecom.Product' %>
<%@page import="java.util.*"%> 
<%@ page isELIgnored = "false" %>

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

<div class='alert alert-info mt-2'>Invoice</div>
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Product</th>
      <th scope="col">Quantity</th>
      <th scope="col">Amount</th>
    </tr>
  </thead>
  <tbody>
<% ArrayList<Product> cart= CartProducts.getCart(userName);
int sum=0;
int count=1;
for(Product product:cart){
	
	out.print(" <tr>\r\n" + 
			"      <th scope=\"row\">"+count+"</th>\r\n" + 
			"      <td>"+product.getP_name()+"</td>\r\n" + 
			"      <td>"+product.getP_qty()+"</td>\r\n" + 
			"      <td>"+"$"+product.getP_qty()*product.getP_price()+"</td>\r\n" + 
			"    </tr>");
	count++;
	sum=sum+(product.getP_qty()*product.getP_price());
	
}
%>
<tr>
      <th scope="row">#</th>
      <td></td>
      <td>Total</td>
      <td>$<%= sum %></td>
    </tr>
 </tbody>
</table>
<div class='alert alert-info'>Estimated Delivery Is Within 3-4hrs From Order Placement </div>
<a class='btn btn-primary mt-2' href='#'>Proceed For Payment</a>
</div>

 
<%} %>
</body>
</html>
