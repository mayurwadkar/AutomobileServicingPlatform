<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
			<a href="http://localhost:8080/asp_jsp/mechanic/home"  class="navbar-brand">M2M Servicing
				Center</a>
				<form class="form-inline">
     <a class="btn btn-outline-danger my-2 my-sm-0" href="${url6}" role="button">Log Out</a>
     </form>
    
  
		</nav>
	</header>
	<div class="jumbotron" style="height:">
		<spring:url var="url1"
			value="/mechanic/appointments?id=${appointment_details.id}"></spring:url>
		<h4>
			<a href="${url1}" class="btn btn-outline-info" role="button" >Back</a>
		</h4>
		<h4 style="color: red;">${profilemsg}</h4>
		<h4 style="color: green;">${update_msg}</h4>
		<h4 style="color: green;">${cpmsg}</h4>
		<h2>Appointment Details</h2>

		<p>
			<b>Appointment ID :</b> ${appointment_details.id}
		</p>
		<p>
			<b>Vehicle Number :</b> ${appointment_details.vehicle.vehicleNumber}
		</p>
		<p>
			<b>Vehicle Model :</b> ${appointment_details.vehicle.vehicleModel}
		</p>

		<p>
			<b>Vehicle Company : </b>
			${appointment_details.vehicle.vehicleCompany}
		</p>
		<p>
			<b>Booking Date : </b> ${appointment_details.receivedDate}
		</p>
		<p>
			<b>Booking Time : </b> ${appointment_details.receivedTime}
		</p>
		<p>
			<b>Status : </b> ${appointment_details.status}
		</p>
		<p>
			<b>Work to be carried : </b>
			<c:forEach var="s" items="${services}">
			<ul>
			<li>${s.serviceName}</li>
			</ul>
			</c:forEach>
		</p>
		<p>
			<a href="updateappointmentstatus?id=${appointment_details.id}">Update Status</a>
		</p>
	</div>
	 <div>
                <footer class='footer'>
                    <span class='text-muted'> &#169;All Rights Reserved  <%= (new java.util.Date()).getYear()+1900%> | contact us  <a href='mailTo:mayur.gaikwad097@gmail.com'>M2M Service</a> </span>
                </footer>
            </div>
</body>
</html>