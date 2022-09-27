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
		<spring:url var="url1" value="/admin/viewallappointments"></spring:url>
		<spring:url var="url2" value="/admin/viewpendingappointments"></spring:url>
		<spring:url var="url4" value="/admin/viewcompletedappointments"></spring:url>
		<spring:url var="url3" value="/admin/home"></spring:url>
		<h4 style="color: green;">${msg}</h4>
		<h4>
			<a href="${url3}" class="btn btn-outline-info">Back</a>
		</h4>

		<fieldset class="p-2">
			<legend>
				<label class="display-4"> <b> <small
						style="color: #4C0033"> Appointments </small>
				</b>
				</label>
				<div class="row m-4 ">
					<div class="col ">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">View All Appointments</h5>

								<a href="${url1}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>

					<div class="col ">
						<div class="card" style="width: 20rem;">
							<div class="card-body">
								<h5 class="card-title">View Pending Appointments</h5>

								<a href="${url2}" class="btn btn-primary">proceed</a>
							</div>
						</div>
					</div>

					<div class="col ">
						<div class="card" style="width: 22rem;">
							<div class="card-body">
								<h5 class="card-title">View Completed Appointments</h5>

								<a href="${url4}" class="btn btn-primary">proceed</a>
							</div>
						</div>
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