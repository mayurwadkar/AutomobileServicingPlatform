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
	<div class="jumbotron" style="height: 100%">
		<spring:url var="url1" value="/admin/viewappointments"></spring:url>
		<spring:url var="url2" value="/admin/appointmechanic"></spring:url>
		<spring:url var="url3" value="/admin/deleteappointment?i"></spring:url>

		
			<a href="${url1}"  class="btn btn-outline-info">Back</a>
	
		<h4 style="color: red;">${noappmsg}</h4>
		<h4 style="color: green;">${mechassign}</h4>
		<h4 style="color: green;">${status_msg}</h4>
		<h4 style="color: red;">${delete_msg}</h4>
		<table class="table table-hover">
			<caption>ALL APPOINTMENTS</caption>
			<thead>

			<tr align="center">
				<th scope="col">Appointment Id</th>
				<th scope="col">Customer Name</th>
				<th scope="col">Mechanic Assigned</th>
				<th scope="col">Vehicle Number</th>
				<th scope="col">Booking Date</th>
				<th scope="col">Booking Time</th>
				<th scope="col">Status</th>
				<th scope="col">Completed Date</th>
				<th scope="col">Completed Time</th>
				<th colspan="3" scope="col" >Actions</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="a" items="${requestScope.appointment_details}">
				<tr align="center">
					<td>${a.id}</td>
					<td>${a.vehicle.user.firstName} ${a.vehicle.user.lastName}</td>
					<td>${a.mechanic.firstName} ${a.mechanic.lastName}</td>
					<td>${a.vehicle.vehicleNumber}</td>
					<td>${a.receivedDate}</td>
					<td>${a.receivedTime}</td>
					<td>${a.status}</td>
					<td>${a.completedDate}</td>
					<td>${a.completedTime}</td>
					<td><a href="appointmechanic?id=${a.id}" class="btn btn-success">Assign Mechanic</a></td>
					<td><a href="deleteappointment?id=${a.id}" class="btn btn-danger">Delete</a></td>
					<td><a href="updateappointmentstatus?id=${a.id}" class="btn btn-info">Update Status</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
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