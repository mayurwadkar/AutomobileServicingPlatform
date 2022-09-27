

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
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
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
	height: 40px;
	background-color: black;
	text-align: center;
	color: white;
}

@import
	url("https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap")
	;

body {
	background: #f5f5f5;
	font-family: "Roboto", sans-serif;
}

.shadow {
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06) !important;
}

.main-content {
	padding-top:;
	padding-bottom:;
}

.banner {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 200px;
	background-color: aqua;
	background-position: center;
	background-size: cover;
}

.img-circle {
	height: 150px;
	width: 150px;
	border-radius: 150px;
	border: 3px solid #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	z-index: 1;
}

.social-links a {
	transition: all 0.2s;
}

.social-links a img {
	height: 30px;
}

.social-links a:hover {
	transform: translateY(-3px);
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
	<spring:url var="url1" value="/admin/viewactivecustomers"></spring:url>
	<spring:url var="url2" value="/admin/editprofile?id=${user_details.id}"></spring:url>
	<spring:url var="url3" value="/admin/changepassword?id=${user_details.id}"></spring:url>
	<div class="jumbotron" style="height:">


		<a class="btn btn-outline-info" href="${url1}" role="button">Back</a>
		<section class="main-content">
			<div class="container">
				<%-- <h4 style="color: red;">${profilemsg}</h4> --%>
				<h4 style="color: red;">${profilemsg}</h4>
				<h4 style="color: green;">${update_msg}</h4>
				<h4 style="color: green;">${cpmsg}</h4>
				<div class="row">

					<div
						class="col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-4 offset-lg-4">
						<div
							class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
							<!-- <div class="banner">
								<h1 class="text-center" style="margin-top: 10px">Profile</h1>
								
							</div> -->
							<!-- 	<img src="img/user1.jpg" alt="" class="img-circle mx-auto mb-3"> -->
							<div class="banner"
								style="background-color: #4835d4; color: white;">
								<br>
								<h3 class="mb-4">${user_details.firstName}
									${user_details.lastName}</h3>

								<p class="mb-2">
									<i class="fa fa-envelope mr-2"></i> ${user_details.email}
								</p>
								<p class="mb-2">
									<i class="fa fa-phone mr-2"></i> +91
									${user_details.mobileNumber}
								</p>
								<p class="mb-2">
									<i class="fa fa-birthday-cake"></i>
									&nbsp;&nbsp;${user_details.dob}
								</p>
							</div>
							<br> <br> <br> <br> <br> <br> <br>

							<div class="text-left mb-0">
								<!-- <p class="mb-2"><b>Address Details</b></p> -->
								<p class="mb-2">
									<b>Address : </b> ${address_details.address}
								</p>
								<p class="mb-2">
									<b>House No. : </b> ${address_details.houseNo}
								</p>
								<p class="mb-2">
									<b>Landmark : </b> ${address_details.landmark}
								</p>
								<p class="mb-2">
									<b>City : </b> ${address_details.city}
								</p>
								<p class="mb-2">
									<b>District : </b> ${address_details.district}
								</p>
								<p class="mb-2">
									<b>State : </b> ${address_details.state}
								</p>
								<p class="mb-2">
									<b>Zip Code : </b> ${address_details.zipCode}
								</p>
								<p>
									<a href="${url2}">Edit Profile</a> <br> <%-- <a href="${url3}">Change
										Password</a> --%>
								</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>

		<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script> -->
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