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
</head>
<body>
	<div class="jumbotron" style="height: 699px">
		<h1 style="font-family:fantasy;text-shadow: 5px 5px 5px grey; font-size:1.3cm;">
			<b>M2M Servicing Center</b>
		</h1>
		<hr>
		<h3>Forget Password</h3>
		<form method="post">
			<table>
				<tr>
					<td>Email :</td>
					<td><input type="email" name="email" required /></td>
				</tr>
				<tr>
					<td>Date of Birth :</td>
					<td><input type="date" name="dob" required /></td>
				</tr>
				<tr>
					<td>New Password :</td>
					<td><input type="password" name="pass" required /></td>
				</tr>


				<tr>
					<td></td>
					<td><input type="submit" value="Update Password" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>