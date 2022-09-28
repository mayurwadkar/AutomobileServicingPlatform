<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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

body,html{
  background-image      : url("https://img.freepik.com/free-vector/motorcycle-repair-maintenance-service_1150-43150.jpg?w=996&t=st=1664291491~exp=1664292091~hmac=2c4636a03c87f8b7f9416e02b78b37df63e8fcafc94794a98a18e6b49ca49807");
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
  
}

.card{
   rgba(0, 0, 0, 0.25) 0px 54px 55px,
    rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px,
    rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
   
    box-shadow:  15px 15px 15px black;
    
    border-radius: 20px;
}
</style>
</head>

<body>
	<spring:url var="url6" value="/user/logout"></spring:url>
	<header>
		<nav class="navbar navbar-dark bg-dark">
			<a href="http://localhost:8080/asp_jsp/customer/home"
				class="navbar-brand">M2M Servicing Center</a>
			<form class="form-inline">
				<a class="btn btn-outline-danger my-2 my-sm-0" href="${url6}"
					role="button">Log Out</a>
			</form>


		</nav>
	</header>
	<div >

		<h4 style="color: green;">${requestScope.msg}</h4>
		<h4 style="color: green;">${requestScope.apmsg}</h4>
		<h4 style="color: green;">${requestScope.vehicle_msg}</h4>
		<spring:url var="url1" value="/customer/profile"></spring:url>
		<spring:url var="url2" value="/customer/address"></spring:url>
		<spring:url var="url3" value="/customer/newvehicle"></spring:url>
		<spring:url var="url4" value="/customer/bookappointment"></spring:url>
		<spring:url var="url5"
			value="/customer/viewvehicles?id=${user_details.id}"></spring:url>

		<spring:url var="url7" value="/customer/appointments"></spring:url>

		<fieldset class="p-2">
			<legend>
				<label class="display-4"> <b> <small
						style="color:white; text-shadow:5px 5px 5px black;  font: bolder;"> Customer Home Page </small>
				</b>
				</label>
				<h3 style="color:white; text-shadow:5px 5px 5px black;  font: bolder;">Hello ${user_details.firstName},</h3>
				<div class="row m-5">
					<div class="col ">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">View Profile</h5>

								<a href="${url1}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>

					<div class="col ">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">View All Vehicles</h5>

								<a href="${url5}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>
					<div class="col ">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">Add New Vehicle</h5>

								<a href="${url3}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>

				</div>
				<div class="row m-5">
					

					<div class="col  ">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">Book AppointMent</h5>

								<a href="${url4}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>
					<div class="col ">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">View Appointments</h5>

								<a href="${url7}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>
					<div class="col ">
					</div>

				</div>
			</legend>
		</fieldset>
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