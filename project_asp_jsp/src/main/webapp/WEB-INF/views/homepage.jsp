<!-- W3hubs.com - Download Free Responsive Website Layout Templates designed on HTML5 
  CSS3,Bootstrap,Tailwind CSS,Shoelace Style which are 100% Mobile friendly. w3Hubs all Layouts are responsive 
  cross browser supported, best quality world class designs. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<title>M2M Servicing Center Login Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="w3hubs.com">
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:300i,400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
<style type="text/css">
body, html {
	background-image:
		url("https://img.freepik.com/free-vector/motorcycle-repair-maintenance-service_1150-43150.jpg?w=996&t=st=1664291491~exp=1664292091~hmac=2c4636a03c87f8b7f9416e02b78b37df63e8fcafc94794a98a18e6b49ca49807");
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
}

.login-form {
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, .1), 0 8px 16px rgba(0, 0, 0, .1);
	background-color: #fff;
	padding: 25px;
}

h3 {
	padding-left: 30px;
	padding-right: 20px;
}

.btn-custom {
	background-color: #1877f2;
	border: none;
	border-radius: 6px;
	font-size: 20px;
	line-height: 28px;
	color: #fff;
	font-weight: 700;
	height: 48px;
}

.btn-custom {
	color: #fff !important;
}

input {
	height: 52px;
	font-size: 18px !important;
	color: #f2f2f2;
}

.form-control:focus {
	box-shadow: 0 0 0 0 rgba(13, 110, 253, .25);
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

@media ( max-width : 768px) {
	.col-md-7, p {
		display: none;
	}
	input {
		font-size: 16px !important;
	}
	.login-form {
		box-shadow: none;
	}
}
</style>
<script>
	function myFunction() {
		var x = document.getElementById("myInput");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>
</head>
<body>
	<spring:url var="url1" value="/user/login"></spring:url>
	<spring:url var="url2" value="/user/forget"></spring:url>
	<spring:url var="url3" value="/user/register"></spring:url>
	<div class="container">
		<div class="row align-items-center justify-content-center vh-100">
			<div class="col-md-7">
				<!-- <img src="G:/Images/m2m.jpeg" class="w-50"> -->
				<h1
					style="color: white; text-shadow: 5px 5px 5px black; font: bolder; font-size: 1.5cm; font-family:">
					<b>&nbsp;&nbsp;M2M Servicing Center</b>
				</h1>
				<h3 style="color: white; text-shadow: 5px 5px 5px black;">M2M
					helps you to serve you and your vehicles.</h3>
			</div>
			<div class="col-md-5" style="box-shadow: 5px 5px 5px black">
				<h5 style="color: green; font: italic;">${ncmsg}</h5>
				<h5 style="color: red; font: italic;">${msg}</h5>
				<form class="login-form" action="${url1}" method="post">
					<div class="mb-3">
						<input type="text" class="form-control" name="email"
							placeholder="Email address" required>
					</div>
					<div class="mb-3">
						<input type="password" class="form-control" name="pass"
							placeholder="Password" id="myInput" required>

					</div>
					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1"
							onclick="myFunction()"> <label class="form-check-label"
							for="exampleCheck1">Show Password</label>
					</div>

					<button type="submit" class="btn btn-custom btn-lg btn-block mt-3">Login</button>


					<div class="text-center pt-3 pb-3">
						<a href="${url2}" class="">Forgotten password?</a>
						<hr>
						<a class="btn btn-success btn-lg mt-3" href="${url3}">New
							Customer Registration</a>
					</div>
				</form>
				<p class="pt-3 text-center">
					<b>Contact us</b> <a href="mailto:mayurwadkar44@gmail.com">@m2mautoservice</a>
				</p>
			</div>
		</div>
	</div>

</body>
</html>