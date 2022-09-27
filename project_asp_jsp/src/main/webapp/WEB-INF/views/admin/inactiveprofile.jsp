<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
			<a href="http://localhost:8080/asp_jsp/admin/home"  class="navbar-brand">M2M Servicing
				Center</a>
				<form class="form-inline">
     <a class="btn btn-outline-danger my-2 my-sm-0" href="${url6}" role="button">Log Out</a>
     </form>
    
  
		</nav>
	</header>
	<div class="jumbotron" style="height: 699px">
		<spring:url var="url1" value="/admin/viewinactivecustomers"></spring:url>
		<h4>
			<a href="${url1}">Back</a>
		</h4>
		<h4 style="color: red;">${profilemsg}</h4>
		<h4 style="color: green;">${update_msg}</h4>
		<h4 style="color: green;">${cpmsg}</h4>
		<!--<h2>User Profile</h2>-->
		<h2 style="color: navy; font-weight: bolder;">
			${user_details.firstName} ${user_details.lastName}</h2>
		<p>
			<b>Email :</b> ${user_details.email}
		</p>
		<p>
			<b>Mobile Number :</b> ${user_details.mobileNumber}
		</p>
		<p>
			<b>Date of Birth :</b> ${user_details.dob}
		</p>
		<hr>
		<h3>Address Details</h3>
		<p>
			<b>Address : </b> ${address_details.address}
		</p>
		<p>
			<b>House No. : </b> ${address_details.houseNo}
		</p>
		<p>
			<b>Landmark : </b> ${address_details.landmark}
		</p>
		<p>
			<b>City : </b> ${address_details.city}
		</p>
		<p>
			<b>District : </b> ${address_details.district}
		</p>
		<p>
			<b>State : </b> ${address_details.state}
		</p>
		<p>
			<b>Zip Code : </b> ${address_details.zipCode}
		</p>

	</div>
	
	 <div>
                <footer class='footer'>
                    <span class='text-muted'> &#169;All Rights Reserved  <%= (new java.util.Date()).getYear()+1900%> | contact us  <a href='mailTo:mayur.gaikwad097@gmail.com'>M2M Service</a> </span>
                </footer>
            </div>
</body>
</html>