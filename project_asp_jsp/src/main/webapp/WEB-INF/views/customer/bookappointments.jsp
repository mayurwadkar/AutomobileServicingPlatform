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
			<a href="http://localhost:8080/asp_jsp/customer/home"
				class="navbar-brand">M2M Servicing Center</a>
			<form class="form-inline">
				<a href="${url6}" class="btn btn-outline-danger my-2 my-sm-0"
					role="button">Log Out</a>
			</form>


		</nav>
	</header>


	<div class="jumbotron" style="height: 699px">
		<spring:url var="url1" value="/customer/home"></spring:url>
		<h4>
			<a href="${url1}" class="btn btn-outline-info" role="button">Back</a>
		</h4>
		<h3>Book Appointment</h3>
		<br />
		<div class="container m-5">
			<form method="post">
				<div class="form-group row">
					<input type="hidden" name="userId" value="${user_details.id}"
						readonly="readonly"> <label for="user"
						class="col-sm-2 col-form-label">User :</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="user" name="userName"
							placeholder="${user_details.firstName} ${user_details.lastName}"
							readonly="readonly">
					</div>
				</div>
				<div class="form-group row ">
					<label for="vmno" class="col-sm-2 col-form-label">Vehicle
						No :</label>
					<div class="col-sm-10">
						<select name="vehicleId" class="form-control">
							<c:forEach var="v" items="${sessionScope.vehicles}">
								<option value="${v.id}">${v.vehicleNumber}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group row ">
					<label for="model" class="col-sm-2 col-form-label">Services
						:</label>
					<div class="col-sm-10">
						<c:forEach var="s" items="${service_details}">
							<input type="checkbox" value="${s.id}" name="services">&nbsp;&nbsp;${s.serviceName}&nbsp;&nbsp;&nbsp;&nbsp;<%-- Rs.${s.amount} --%>
							<br />
						</c:forEach>
					</div>
				</div>
				<div class="text-center">
					<input type="submit" value="Book" class="btn btn-primary">
				</div>
			</form>
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