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
	<header>
		<nav class="navbar navbar-dark bg-dark">
			<a href="http://localhost:8080/asp_jsp/" class="navbar-brand">M2M
				Servicing Center</a>
		</nav>
	</header>
	<div class="jumbotron" style="height: 699px">
		<h3>Forget Password</h3>
		<form method="post" class="m-5" style="width: 50%">
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-4 col-form-label">Email
					:</label>
				<div class="col-sm-6">
					<input type="email" class="form-control" id="inputEmail3"
						name="email" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="dob" class="col-sm-4 col-form-label">Date of
					Birth :</label>
				<div class="col-sm-6">
					<input type="date" class="form-control" id="dob" name="dob"
						required>
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-4 col-form-label">Password</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="inputPassword3"
						name="pass" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
															title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
				</div>
			</div>


			<div class="form-group row text-center">
				<div class="col-sm-11">
					<button type="submit" class="btn btn-primary">Update
						Password</button>
				</div>
			</div>
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