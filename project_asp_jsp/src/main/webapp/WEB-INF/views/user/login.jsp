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
</head>
<body>
	<div class="jumbotron" style="height: 699px">
		<h1
			style="font-family: fantasy; text-shadow: 5px 5px 5px grey; font-size: 1.3cm;">
			<b>M2M Servicing Center</b>
		</h1>
		<hr>
		<spring:url var="url1" value="/user/forget"></spring:url>
		<h5 style="color: red; font: italic;">${msg}</h5>
		<h3>Login</h3>
		<form class="form-inline" method="post">
			<table>
				<tr>
					<td>Email :</td>
					<td><input type="text" name="email" required /></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input type="password" name="pass" required /></td>
				</tr>
				
				<tr>
					<td></td>
					<td><input type="submit" value="Login" class="btn btn-primary" />
						<a href="${url1}" class="btn btn-primary">Forget Password</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>