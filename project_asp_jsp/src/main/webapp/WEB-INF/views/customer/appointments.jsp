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
			<a href="${url1}" class="btn btn-outline-info"
					role="button">Back</a>
		</h4>

		<h3>Appointments</h3>
		<form method="post">
			<table>
				<tr>
					<td>Status : &nbsp;&nbsp; </td>
					<td><select name="status" class="form-control">
							<option value="ALL">All</option>
							<option value="PENDING">Pending</option>
							<option value="COMPLETED">Completed</option>
					</select></td>
				</tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-primary" value="View Appointments"></td>
				</tr>
			</table>
		</form>
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