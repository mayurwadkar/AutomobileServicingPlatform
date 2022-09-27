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
		<spring:url var="url1" value="/admin/home"></spring:url>
			
			<a class="btn btn-outline-info mb-2" href="${url1}" role="button">Back</a>
		
		<h3>Add Service</h3>
		<br />
		<div style="width: 30%">
			<form method="post">

				<div class="row mb-4" >
					<label for="inputEmail" class="col-sm-4 col-form-label" style="font-size: 0.5cm;">Service
						: </label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail"
							placeholder="Service" name="service">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPassword" class="col-sm-4 col-form-label" style="font-size: 0.5cm;">Amount
						:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputPassword"
							placeholder="Amount" name="amount">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10 offset-sm-3">
						<button type="submit" class="btn btn-primary">Add New Service</button>
					</div>
				</div>

			</form>
		</div>
	</div>
	            <footer class='footer'>
                    <span class='text-muted'> &#169;All Rights Reserved  <%= (new java.util.Date()).getYear()+1900%> | contact us  <a href='mailTo:mayur.gaikwad097@gmail.com'>M2M Service</a> </span>
                </footer>
          
</body>
</html>