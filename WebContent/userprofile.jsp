<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import='com.ecom.UserProfile' %>
  <jsp:include page="./navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body style="color:black;background:url(https://images.unsplash.com/photo-1497327632474-4a13f2340887?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80);background-repeat:no-repeat;background-size: cover;">
<div class='alert alert-info mt-3 text-center'>Your Details</div>

<%
String userName=null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user"))
	userName = cookie.getValue();
	
}
}
%>
<%if(userName==null){
	RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
	rd.forward(request, response);
} %>
<div class='container'>
<form  action ='./updateDetails'method="post">
 <ul class="list-group ">
<% String[] ar= UserProfile.getUser(userName);

	out.print( 
"  <li class=\"list-group-item  ml-3 my-2\">"+ar[0]+ "<span>"+"<i onClick=toggle() class='fas fa-pen'></i>"+"</span>"+"</li>\r\n" +
"<input id='f1' style='display:none;' type='text' placeholder="+ar[0]+"   name='firstname' />"+
"<button style='display:none; width:5rem;' id='f1b' type='submit' name='update' value='firstname' class='btn btn-primary mt-1' '>Update</button>"+
"  <li class=\"list-group-item  ml-3 my-2\">"+ar[1]+ "<span>"+"<i onClick=toggle1() class='fas fa-pen'></i>"+"</span>"+"</li>\r\n" +
"<input id='f2' style='display:none;' type='text' placeholder="+ar[1]+"  name='lastname' />"+
"<button style='display:none; width:5rem;' id='f2b' type='submit'name='update' value='lastname' class='btn btn-primary mt-1' >Update</button>"+
"  <li class=\"list-group-item  ml-3 my-2\">"+ar[2]+ "<span>" +"<i onClick=toggle2() class='fas fa-pen'></i>"+"</span>"+"</li>\r\n" +
"<input style='display:none;' id='f3' style='display:none;' type='number' placeholder="+ar[2]+" name='dob' />"+
"<button style='display:none; width:5rem' id='f3b type='submit'name='update' value='dob' class='btn btn-primary mt-1'>Update</button>"+
"  <li class=\"list-group-item  ml-3 my-2\">"+ar[3]+ "<span>" +"<i onClick=toggle3() class='fas fa-pen'></i>"+"</span>"+"</li>\r\n" +
"<input style='display:none;' id='f4' style='display:none;' type='email' placeholder="+ar[3]+" name='email' />"+
"<button style='display:none; width:5rem;' id='f4b' type='submit'name='update' value='email' class='btn btn-primary mt-1' >Update</button>"
);

%>
</ul>
</form>
</div>











<script type="text/javascript">
function toggle(){
var f1=	document.getElementById("f1");
var f1b=	document.getElementById("f1b");
f1.style.display='block';
f1b.style.display='block';
}
function toggle1(){
	var f2=	document.getElementById("f2");
	var f2b=	document.getElementById("f2b");
	f2.style.display='block';
	f2b.style.display='block';
	}
function toggle2(){
	var f3=	document.getElementById("f3");
	var f3b=	document.getElementById("f3b");
	f3.style.display='block';
	f3b.style.display='block';
	}
function toggle3(){
	var f4=	document.getElementById("f4");
	var f4b=	document.getElementById("f4b");
	f4.style.display='block';
	f4b.style.display='block';
	}
</script>
</body>
</html>