<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <jsp:include page="./navbar.jsp"/>

<html>
<head>
<meta charset="ISO-8859-1">
<title>LogIn</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body style="color:black;background:url(https://images.unsplash.com/photo-1497327632474-4a13f2340887?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80);background-repeat:no-repeat;background-size: cover;">
    <div class="container mt-4"> 
        <h1 class="jumbotron text-center">Login</h1>
    </div>
    
    <div style="margin: 4rem 25rem;">
        
    <form action="./success" method='post' >
        <div   class="form-row">
          <div class="form-group col-md-5">
            <label for="inputEmail4">Email</label>
            <input type="email" class="form-control" name="email"id="inputEmail4" placeholder="Email">
          </div>
          <div class="form-group col-md-5">
            <label for="inputPassword4">Password</label>
            <input type="password" class="form-control" id="inputPassword4" name="pswd"placeholder="Password">
          </div>
        </div>
        
      <button style='width:8.5rem' type="submit" class="btn btn-primary text-center">Sign in</button>
      </form>
        <a style='width:8.5rem'  class='btn btn-primary mt-2 text-center' href='./reset.html'>Reset Password</a>
      </div>

</body>
</html>