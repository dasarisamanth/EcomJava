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
        
        <button type="submit" class="btn btn-primary">Sign in</button>
      </form>
      </div>

</body>
</html>