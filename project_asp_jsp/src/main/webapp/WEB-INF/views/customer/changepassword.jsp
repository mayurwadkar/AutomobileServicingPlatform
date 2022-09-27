
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
		<spring:url var="url1" value="/customer/profile"></spring:url>
		<p>
			<a href="${url1}" class="btn btn-outline-info">Back</a>
		</p>
		<h4 style="color: red;">${cpmsg}</h4>
		<h3>Change Password</h3>

		<form method="post" class="m-2" style="width: 50%">
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-4 col-form-label">Email
					:</label>
				<div class="col-sm-8">
					<input type="email" class="form-control" id="inputEmail3"
						name="email" value="${user_details.email}" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-4 col-form-label">Old
					Password :</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="inputPassword3"
						name="opass" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-4 col-form-label">New
					Password :</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="inputPassword3"
						name="npass" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-4 col-form-label">Confirm
					New Password :</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="inputPassword3"
						name="cnpass" required>
				</div>
			</div>


			<div class="form-group row text-center">
				<div class="col-sm-10">
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