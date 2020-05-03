<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import='com.ecom.Addresses' %>

<%@page import="java.util.*"%> 
<%@page import ='com.ecom.Address' %>


<jsp:include page="./navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

</head>
<body style="color:black;background:url(https://images.unsplash.com/photo-1497327632474-4a13f2340887?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80);background-repeat:no-repeat;background-size: cover;">

<%
String userName=null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	
}
}
%>
<%if(userName==null){
	RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
	rd.forward(request, response);
} %>
<div class='container'>
<form action='./delete' method='post'>
<div class='row'>
<%
ArrayList<Address> adr = Addresses.getAddress(userName);

for(Address addr : adr) {
	   String val=addr.getNickName();

	   out.print(
             " <div style='margin-left:5rem; margin-right:5rem'  class='mt-3 mb-3 card-border-dark text-white bg-secondary col-lg-4'>\r\n" + 
             
            	"  <div class='card-header m-2'>"+addr.getNickName()+
            	"<input class='m-2' type='checkbox'value="+val+" name='names' />"+
            	"</div>\r\n" +
				"  <div class=\"card-body m-2\">\r\n" + 
			     
				"  <p class='card-text text-center'>"+addr.getAddressLine_1()+"</p>\r\n" + 
				"  <p class='card-text text-center'>"+addr.getCity()+"</p>\r\n" + 
				"  <p class='card-text text-center'>"+addr.getState()+"</p>\r\n" + 
				"  <p class='card-text text-center'>"+addr.getCountry()+"</p>\r\n" + 
				"  <p class='card-text text-center'>"+addr.getZipCode()+"</p>\r\n" + 
				 
				"  </div>\r\n" +
				"  </div>" 
				);
	} %>
</div>

<% if(adr.size()!=0){ %>
<button style='width:5rem'type='submit' class='btn btn-primary text-center'>Delete</button>
<%} %>
</form>
<button style='width:5rem' class='btn btn-primary mt-2 text-center' id='addButton' style='display:block' onClick=toggle()>Add</button>
 <div class='container'>

<form  id='myform' style='display:none;margin-left:3rem;' action="./add" method="post">
        <div   class="form-row  d-flex flex-lg-column justify-content-center align-items-start">
        <div class="form-group col-3 ">
            <label for="inputNick">NickName</label>
            <input type="text" class="form-control" id="inputNick" name="nickname" placeholder="Home/Office" required>
          </div>
         <div class="form-group col-3 ">
            <label for="inputName">AddressLine1</label>
            <input type="text" class="form-control" id="inputName" name="aline1" placeholder="Address.." required>
          </div>
          <div class="form-group col-3" >
            <label for="inputLast">AddressLine2</label>
            <input type="text" class="form-control" id="inputLast" name="aline2"placeholder="Address..">
          </div>
          <div class="form-group col-3 ">
            <label for="dob">City</label>
            <input type="text" class="form-control" name="city"id="dob" placeholder="City" required>
          </div>
          <div class="form-group col-3 ">
            <label for="inputEmail4">State</label>
            <input type="text" class="form-control" name="state"id="inputEmail4" placeholder="State" required>
          </div>
          <div class="form-group col-3 ">
            <label for="inputE">Country</label>
            <input type="text" class="form-control" name="country"id="inputE" placeholder="Country" required>
          </div>
          <div class="form-group  col-3 ">
            <label for="inputPassword4">ZipCode</label>
            <input type="number" class="form-control" id="inputPassword4" name="zip"placeholder="ZipCode" required>
          </div>
         <button type="submit" class="btn btn-primary ml-1">Submit</button>
        </div>
       
        
      </form>

</div>
</div>
<script type="text/javascript">
function toggle(){
	var form = document.getElementById('myform');
	var button =document.getElementById('addButton');
	form.style.display='block';
	button.style.display='none';
};
</script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>


</html>