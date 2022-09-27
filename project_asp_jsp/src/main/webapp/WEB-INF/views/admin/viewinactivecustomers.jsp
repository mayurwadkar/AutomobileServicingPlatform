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
</head>
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
<body>
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
		<spring:url var="url1" value="/admin/viewcustomers"></spring:url>
		<spring:url var="url2" value="/admin/viewactivecustomers"></spring:url>
		<h4 style="color: red;">${requestScope.nocustmsg}</h4>
		<h4 style="color: red;">${requestScope.deletemsg}</h4>
		<h4 style="color: green;">${actmsg}</h4>

		<a class="btn btn-outline-info mr-5 mb-3" href="${url1}" role="button">Back</a>
		<a href="${url2}" class="btn btn-outline-success mb-3" role="button">Go to Active Customers</a>
		<h4>All Inactive Customers</h4>
		<table class="table table-hover">
			<thead>
				<tr align="center">
					<th scope="col">Id</th>
					<th scope="col">Customer Name</th>
					<th scope="col"  align="center">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${requestScope.inactive_customers}">
					<tr align="center">

						<th scope="row">${c.id}</th>
						<td align="center">&nbsp;&nbsp;<a
							href="inactiveprofile?id=${c.id}"><b>${c.firstName}
								${c.lastName}</b> </a></td>
						<td><a href="activatecustomer?id=${c.id}" class="btn btn-success mr-3" role="button">Activate</a> <a
							href="deletecustomer?id=${c.id}" class="btn btn-danger" role="button">Delete</a></td>
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