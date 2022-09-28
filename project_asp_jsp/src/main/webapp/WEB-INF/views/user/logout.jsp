<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<style type="text/css">
	.footer {
  position: fixed;
  bottom: 0;
  width: 100%;
  height: 33px;
  background-color: black;
  text-align: center;
  color: white;
}

body,html{
  background-image      : url("https://img.freepik.com/free-vector/motorcycle-repair-maintenance-service_1150-43150.jpg?w=996&t=st=1664291491~exp=1664292091~hmac=2c4636a03c87f8b7f9416e02b78b37df63e8fcafc94794a98a18e6b49ca49807");
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
}
	</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-dark bg-dark">
			<a href="http://localhost:8080/asp_jsp/admin/home"
				class="navbar-brand">M2M Servicing Center</a>
		</nav>
	</header>
	<div class="col-sm-6 offset-sm-3 mt-5" >
	  <div class="card mt-5" style="background-color:#E9F7EF;">
		
		<h4>Hello ${requestScope.user_details.firstName} ${requestScope.mechanic_details.firstName},</h4>
		<h4>You have logged out...</h4>
		<h4>You will be auto taken to home page shortly....</h4>
		<h4>Visit again :-)</h4>
	</div>
	</div>
		 <div>
                <footer class='footer'>
                    <span class='text-muted'> &#169;All Rights Reserved  <%= (new java.util.Date()).getYear()+1900%> | contact us  <a href='mailTo:mayur.gaikwad097@gmail.com'>M2M Service</a> </span>
                </footer>
            </div>
</body>
</html>