<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
String userName=null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	
}
}
%>
<%
if(userName!=null){
	RequestDispatcher rd = request.getRequestDispatcher("./success.jsp");
	rd.forward(request, response);
}
else{
%>  

 <jsp:include page="./navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Florist's</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body style="color:black;background:url(https://images.unsplash.com/photo-1497327632474-4a13f2340887?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80);background-repeat:no-repeat;background-size: cover;">
<div class="container-fluid">

<div class="d-flex  justify-content-around mt-5">

<img style="height:30rem;width:40rem;" class="img-thumbnail d-none d-md-block" src="https://www.ftd.com/blog/content/uploads/2018/01/flower-quotes-4.jpg" alt="landing-quote"/>
<form action="./signup" method="post">
        <div   class="form-row  d-flex flex-lg-column align-items-start">
        
         <div class="form-group col-12 ">
            <label for="inputName">FirstName</label>
            <input type="text" class="form-control" id="inputName" name="fname" placeholder="FirstName">
          </div>
          <div class="form-group col-12" >
            <label for="inputLast">LastName</label>
            <input type="text" class="form-control" id="inputLast" name="lname"placeholder="LastName">
          </div>
          <div class="form-group col-12 ">
            <label for="dob">D.O.B</label>
            <input type="date" class="form-control" name="dob"id="dob" placeholder="DD/MM/YYYY">
          </div>
          <div class="form-group col-12 ">
            <label for="inputEmail4">Email</label>
            <input type="email" class="form-control" name="email"id="inputEmail4" placeholder="Email">
          </div>
          <div class="form-group  col-12 ">
            <label for="inputPassword4">Password</label>
            <input type="password" class="form-control" id="inputPassword4" name="pswd"placeholder="Password">
          </div>
         <button type="submit" class="btn btn-primary ml-1">Sign Me Up</button>
        </div>
       
        
      </form>
      </div>
  <div id="carouselExampleControls" class="carousel slide mt-3" data-ride="carousel"style="margin-left:5rem;margin-right:5rem;">
  <div class="carousel-inner ">
    <div class="carousel-item active">
      <img src="https://images.unsplash.com/photo-1585407357384-afa5cba90277?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" class="d-block w-100 " alt="imgae-1">
    </div>
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1564958068338-fe287bbcf87d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" class="d-block w-100" alt="image-2">
    </div>
    <div class="carousel-item" >
      <img src="https://images.unsplash.com/photo-1574086068064-81cb96f586fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" class="d-block w-100" alt="image-3">
    </div>
    <div class="carousel-item" >
      <img src="https://images.unsplash.com/photo-1560198654-b13282f1c0ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80" class="d-block w-100" alt="image-3">
    </div>
    <div class="carousel-item" >
      <img src="https://images.unsplash.com/photo-1549417743-14d2a1dcc102?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80" class="d-block w-100" alt="image-3">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</div>
<!-- Footer -->
<footer class="page-footer font-small unique-color-dark">

 
  <!-- Footer Links -->
  <div class="container text-center text-md-left mt-5">

    <!-- Grid row -->
    <div class="row mt-3">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

        <!-- Content -->
        <h6 class="text-uppercase font-weight-bold">The Florist's</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>Wide Variety Of Fresh Exotic Flowers At Your Doorstep</p>

      </div>
      <!-- Grid column -->

      

      

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Contact</h6>
        <hr class="deep-purple accent-2 mb-3 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
        <p>
          <i class="fas fa-envelope mr-3"></i> info@example.com</p>
        <p>
          <i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
        <p>
          <i class="fas fa-print mr-3"></i> + 01 234 567 89</p>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright:
    <a href="https://mdbootstrap.com/"> TheFlorist.com</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
<%} %>
</body>
</html>