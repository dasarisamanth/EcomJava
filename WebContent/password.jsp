<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LogIn</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body style="color:black;background:url(https://images.unsplash.com/photo-1497327632474-4a13f2340887?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80);background-repeat:no-repeat;background-size: cover;">
   <% String isAuth ="false";
  isAuth=(String) session.getAttribute("auth"); %>
   
   <% 
	   if(isAuth!=null){ %>
   
    <div class="container mt-4"> 
        <h1 class="jumbotron text-center">Reset Password</h1>
    </div>
    
    <div style="margin: 4rem 25rem;">
        
    <form action="./password" method='post' >
        <div   class="form-row">
          <div class="form-group col-md-5">
            <label for="inputEmail4">Password</label>
            <input type="password" class="form-control" name="pswd"id="inputEmail4" placeholder="Email">
          </div>
            <div class="form-group col-md-5">
            <label for="inputEmail3">Confirm Password</label>
            <input type="password" class="form-control" name="rpswd"id="inputEmail3" placeholder="Email">
          </div>
         </div>
        
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
      
      </div>
      
<%}%>
<%if(isAuth==null){
RequestDispatcher rd =	request.getRequestDispatcher("./login.jsp");
response.setContentType("text/html");

out.print("<div class='alert alert-info'>Please Click On ResetPassword To Reset Password</div>");
rd.include(request, response);

	}
%>


</body>