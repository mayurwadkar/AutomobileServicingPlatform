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





@media ( min-width : 1025px) {
	.h-custom {
		height: 100vh !important;
	}
}

.card-registration .select-input.form-control[readonly]:not([disabled])
	{
	font-size: 1rem;
	line-height: 2.15;
	padding-left: .75em;
	padding-right: .75em;
}

.card-registration .select-arrow {
	top: 13px;
}

.gradient-custom-2 {
	/* fallback for old browsers */
	/* background: #a1c4fd; */
	/* Chrome 10-25, Safari 5.1-6 */
	/* background: -webkit-linear-gradient(to right, rgba(161, 196, 253, 1),
		rgba(194, 233, 251, 1)); */
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	/* background: linear-gradient(to right, rgba(161, 196, 253, 1),
		rgba(194, 233, 251, 1)) */
	
}

.bg-indigo {
	background-color: #4835d4;
}

@media ( min-width : 992px) {
	.card-registration-2 .bg-indigo {
		border-top-right-radius: 15px;
		border-bottom-right-radius: 15px;
	}
}

@media ( max-width : 991px) {
	.card-registration-2 .bg-indigo {
		border-bottom-left-radius: 15px;
		border-bottom-right-radius: 15px;
	}
}
</style>
	
	
	
	
</head>
<body>
<spring:url var="url6" value="/user/logout"></spring:url>
	<header>
		<nav class="navbar navbar-dark bg-dark">
			<a href="http://localhost:8080/asp_jsp/customer/home"
				class="navbar-brand">M2M Servicing Center</a>
			<form class="form-inline">
				<a href="${url6}" class="btn btn-outline-danger my-2 my-sm-0"
					role="button">Log Out</a>
			</form>


		</nav>
	</header>
	<div class="jumbotron" style="height: 699px">
		
		<spring:url var="url1" value="/customer/home"></spring:url>
			<a href="${url1}" class="btn btn-outline-info"
					role="button">Back</a>
		
		<h4 style="color: green;">${msg}</h4>
		<h4 style="color: red;">${errmsg}</h4>
		<h3>Link Address</h3>
		<form method="post">
			<table>
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
		
		<form method="post">
		<div class="col-lg-6 bg-indigo text-white"
											style="border-radius: 15px; box-shadow: 10px 15px 15px grey">
											<div class="p-4">
												<h3 class="fw-normal mb-5">Link Address Details</h3>

												<div class="mb-4 pb-2">
													<div class="form-outline form-white">
														<input type="text" name="address"
															class="form-control form-control-lg"
															placeholder="Address"  name="address" />
													</div>
												</div>
												<div class="mb-4 pb-2">
													<div class="form-outline form-white">
														<input type="text" name="house"
															class="form-control form-control-lg"
															placeholder="House number" name="house"
															 />
													</div>
												</div>
												<div class="mb-4 pb-2">
													<div class="form-outline form-white">
														<input type="text" name="landmark"
															class="form-control form-control-lg"
															placeholder="Landmark"  name="landmark"
															 />
													</div>
												</div>
												<div class="row">
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline form-white">
															<input type="text" name="city"
																class="form-control form-control-lg" placeholder="City"
																name="city" />
														</div>

													</div>
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline form-white">
															<input type="text" name="dist"
																class="form-control form-control-lg"
																placeholder="District"  name="dist"
																 />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline form-white">
															<input type="text" name="zipcode"
																class="form-control form-control-lg"
																placeholder="Zipcode" name="zipcode"
																/>
														</div>
													</div>
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline form-white">
															<input type="text" name="state"
																class="form-control form-control-lg" placeholder="State"
																value="Maharashtra" readonly="readonly" />
														</div>
													</div>
												</div>
												<div class="mb-4 pb-2">
													<div class="form-outline form-white">
														<input type="text" name="country"
															class="form-control form-control-lg"
															placeholder="Country" value="India" readonly="readonly" />
													</div>
												</div>
												<button type="submit" class="btn btn-light btn-lg"
													data-mdb-ripple-color="dark">Link Address</button>
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