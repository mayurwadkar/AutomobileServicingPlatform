<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<spring:url var="url1" value="/customer/home"></spring:url>
		<h4>
			<a href="${url1}" class="btn btn-outline-info" role="button">Back</a>
		</h4>
		<h4 style="color: green;">${msg}</h4>
		<h4 style="color: red;">${errmsg}</h4>
		<h3>Register New Vehicle</h3>

		<div class="container m-5">
			<form method="post" style="width: 50%">
				<div class="form-group row text-center">
					<label for="vmno" class="col-sm-4 col-form-label">Vehicle
						Number :</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="vmno" name="vnumber"
							required>
					</div>
				</div>
				<div class="form-group row text-center">
					<label for="vmno" class="col-sm-4 col-form-label">Vehicle
						Company :</label>
					<div class="col-sm-8">
						<select name="vcompany" class="form-control">
							<c:forEach var="company" items="${requestScope.companies}">
								<option value="${company}">${company}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group row text-center">
					<label for="model" class="col-sm-4 col-form-label">Vehicle
						Model :</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="model" name="vmodel"
							required>
					</div>
				</div>
				<div class="text-center">
					<input type="submit" value="Add Vehicle" class="btn btn-primary">
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