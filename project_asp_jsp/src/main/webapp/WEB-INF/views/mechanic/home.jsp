<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<style type="text/css">
header {
	background-color: #282c34;
	min-height: 10vh;
	display: flex;
	flex-direction: column;
	align-items: left;
	justify-content: center;
	font-size: calc(10px + 2vmin);
	color: white;
}

.footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	height: 33px;
	background-color: black;
	text-align: center;
	color: white;
}
.card{
   rgba(0, 0, 0, 0.25) 0px 54px 55px,
    rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px,
    rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
   
    box-shadow:  15px 15px 15px black;
    
    border-radius: 20px;
}

body,html{
  background-image      : url("https://img.freepik.com/free-vector/motorcycle-repair-maintenance-service_1150-43150.jpg?w=996&t=st=1664291491~exp=1664292091~hmac=2c4636a03c87f8b7f9416e02b78b37df63e8fcafc94794a98a18e6b49ca49807");
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
}


</style>
<body>

	<spring:url var="url6" value="/user/logout"></spring:url>
	<header>
		<nav class="navbar navbar-dark bg-dark">
			<a href="http://localhost:8080/asp_jsp/mechanic/home"
				class="navbar-brand">M2M Servicing Center</a>
			<form class="form-inline">
				<a class="btn btn-outline-danger my-2 my-sm-0" href="${url6}"
					role="button">Log Out</a>
			</form>


		</nav>
	</header>
	<div class="col-sm-6 offset-sm-3 mt-5" >
	  <div class="card mt-5" style="background-color:#E9F7EF;">

		<spring:url var="url1" value="/mechanic/profile"></spring:url>

		<spring:url var="url2" value="/mechanic/appointments"></spring:url>

		<fieldset class="p-2">
			<legend>
				<label class="display-4"> <b> <small
						style="color: #4C0033"> Mechanic Portal </small>
				</b>
				</label>
				<h3>Hello ${mechanic_details.firstName},</h3>
				<div class="row ">
					<div class="col ">
						<div class="card" style="width: 18rem;  " >
							<div class="card-body">
								<h5 class="card-title">View Appointments</h5>

								<a href="${url2}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>

					<div class="col ">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">View Profile</h5>

								<a href="${url1}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>
					
					<div class="col ">
						
					</div>

				</div>

			</legend>
		</fieldset>
		</div>
	</div>
	<div>
		<footer class='footer'>
			<span class='text-muted'> &#169;All Rights Reserved <%=(new java.util.Date()).getYear() + 1900%>
				| contact us <a href='mailTo:mayur.gaikwad097@gmail.com'>M2M
					Service</a>
			</span>
		</footer>
	</div>
</body>
</html>