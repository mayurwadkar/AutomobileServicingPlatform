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
</style>
</head>
<body>

	<spring:url var="url6" value="/user/logout"></spring:url>
	<header>
		<nav class="navbar navbar-dark bg-dark">
			<a href="http://localhost:8080/asp_jsp/admin/home"
				class="navbar-brand">M2M Servicing Center</a>
			<form class="form-inline">
				<a class="btn btn-outline-danger my-2 my-sm-0" href="${url6}"
					role="button">Log Out</a>
			</form>


		</nav>
	</header>
	<div class="jumbotron" style="height: 699px">
		<spring:url var="url1" value="/admin/viewcustomers"></spring:url>
		<spring:url var="url2" value="/admin/registermechanic"></spring:url>
		<spring:url var="url3" value="/admin/viewmechanics"></spring:url>

		<spring:url var="url7" value="/admin/viewappointments"></spring:url>

		<spring:url var="url8" value="/admin/addservices"></spring:url>


		<h4 style="color: green;">${mechanic_msg}</h4>
		<h4 style="color: green;">${ser_msg}</h4>
		<h3>Admin Home Page</h3>
		<h3>Hello ${user_details.firstName},</h3>


		<fieldset>
			<legend>
				<label class="display-4"> <b> <small
						style="color: #4C0033"> Customer Portal </small>
				</b>
				</label>
				<div class="row ">
					<div class="col ">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">View All Customers</h5>

								<a href="${url1}" class="btn btn-primary">proceed</a>
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
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">Add new Services</h5>

								<a href="${url8}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>
				</div>

			</legend>
		</fieldset>

		<fieldset class="p-2">
			<legend>
				<label class="display-4"> <b> <small
						style="color: #4C0033"> Mechanic Portal </small>
				</b>
				</label>
				<div class="row ">
					<div class="col">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">View All Mechanics</h5>

								<a href="${url3}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>

					<div class="col ">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">Register Mechanic</h5>

								<a href="${url2}" class="btn btn-primary">proceed</a>
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