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
		<spring:url var="url1" value="/admin/profile?id=${user_details.id}"></spring:url>
		<h4>
			<a href="${url1}">Back</a>
		</h4>
		<h4 style="color: green;">${msg}</h4>
		<h4 style="color: red;">${errmsg}</h4>
		<h3>Link Address</h3>
		<form method="post">
			<table>
				<tr>
					<td>Id :</td>
					<td><input type="text" name="id" value="${user_details.id}"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>Address :</td>
					<td><textarea rows="5" cols="40" name="address"></textarea></td>
				</tr>
				<tr>
					<td>House No. :</td>
					<td><input type="text" name="house" required></td>
				</tr>
				<tr>
					<td>Landmark :</td>
					<td><input type="text" name="landmark" required></td>
				</tr>
				<tr>
					<td>City :</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td>District :</td>
					<td><input type="text" name="dist"></td>
				</tr>
				<tr>
					<td>State :</td>
					<td><input type="text" name="state" value="Maharashtra"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>Zip Code :</td>
					<td><input type="text" name="zipcode"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Link Address"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>