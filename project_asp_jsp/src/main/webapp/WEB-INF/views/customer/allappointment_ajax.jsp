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
<script src="https://code.jquery.com/jquery-1.10.2.js">
	function getAppointments() {
		var stat = document.getElementById("status").value;
		document.getElementById("mydiv").innerHTML = "${amsg}";
		console.log("button is Click......")
		/* var url = "/customer/checkajax;
		$.ajax({
		    url: url,
		    method: "GET",
		    /* data:, */
		/* contentType: "text/json", 
		success: (data) => {
			document.getElementById("mydiv").innerHTML=data;
		    }
		},
		error: () => {
		    console.log("Something has gone wrong...")
		}
		}
		);  */
	}
</script>
</head>
<body>
	<div class="jumbotron" style="height: 699px">
		<h1 style="font-family:fantasy;text-shadow: 5px 5px 5px grey; font-size:1.3cm;">
			<b>M2M Servicing Center</b>
		</h1>
		<hr>
		<spring:url var="url1" value="/customer/home"></spring:url>
		<h4 style="color: red;">${amsg}</h4>

		<h4>
			<a href="${url1}">Back</a>
		</h4>
		<h4>
			Status : <select name="status" id="status">
				<option value="ALL">All</option>
				<option value="PENDING">Pending</option>
				<option value="COMPLETED">Completed</option>
			</select>
		</h4>

		<button type="button" name="btn" onclick="getAppointments()">click
			me</button>
		<br /> <br /> <br />
		<div id="mydiv"></div>
	</div>
</body>
</html>