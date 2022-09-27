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
			<a href="http://localhost:8080/asp_jsp/mechanic/home"  class="navbar-brand">M2M Servicing
				Center</a>
				<form class="form-inline">
     <a class="btn btn-outline-danger my-2 my-sm-0" href="${url6}" role="button">Log Out</a>
     </form>
     </nav>
     </header>
	<div class="jumbotron" style="height: 699px">
		<spring:url var="url1" value="/mechanic/profile"></spring:url>
		<p>
			<a href="${url1}"  role="button"  class="btn btn-outline-info" >Back</a>
		</p>
		<h4 style="color: red;">${cpmsg}</h4>
		<h3>Change Password</h3>
		<br>
		<div style="width: 37%">
			<form method="post">

				<div class="row mb-3">
					<label for="inputEmail" class="col-sm-5 col-form-label"
						style="font-size: 0.5cm;">Email : </label>
					<div class="col-sm-7">
						<input type="email" class="form-control" id="inputEmail"
							value="${mechanic_details.email}" placeholder="Email"
							name="email" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPassword" class="col-sm-5 col-form-label"
						style="font-size: 0.5cm;">Old Password :</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" id="inputPassword"
							placeholder="Old password" name="opass">
					</div>
				</div>
				<div class="row mb-3">
					<label for="newinputPassword" class="col-sm-5 col-form-label"
						style="font-size: 0.5cm;">New Password :</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" id="newinputPassword"
							placeholder="New password" name="npass">
					</div>
				</div>
				<div class="row mb-3">
					<label for="newcoinputPassword" class="col-sm-5 col-form-label"
						style="font-size: 0.5cm;">Confirm New Password :</label>
					<div class="col-sm-7">
						<input type="password" class="form-control"
							id="newcoinputPassword" placeholder="Confirm new password"
							name="cnpass">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10 offset-sm-5">
						<button type="submit" class="btn btn-primary">Update
							Password</button>
					</div>
				</div>

			</form>
		</div>
	</div>
	<div>
                <footer class='footer'>
                    <span class='text-muted'> &#169;All Rights Reserved  <%= (new java.util.Date()).getYear()+1900%> | contact us  <a href='mailTo:mayur.gaikwad097@gmail.com'>M2M Service</a> </span>
                </footer>
            </div>
</body>
</html>