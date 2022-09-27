<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
			<a href="http://localhost:8080/asp_jsp/admin/home"  class="navbar-brand">M2M Servicing
				Center</a>
				<form class="form-inline">
     <a class="btn btn-outline-danger my-2 my-sm-0" href="${url6}" role="button">Log Out</a>
     </form>
    
  
		</nav>
	</header>
	<spring:url var="url1" value="/mechanic/profile?id=${user_details.id}"></spring:url>
	<div class="jumbotron" style="height: auto;">
		<form method="post">
			<section class="h-100 h-custom gradient-custom-2">
				<div class="container py-2 h-200">
					<a class="btn btn-outline-info" href="${url1}" role="button">Back</a>
					<h4 style="color: red;">${errmsg}</h4>
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-12">
							<div class="card card-registration card-registration-2"
								style="border-radius: 15px; box-shadow: 10px 15px 15px grey">
								<div class="card-body p-0">
									<div class="row g-0">

										<div class="col-lg-6">
											<div class="p-4">
												<h2 class="fw-normal mb-4"
													style="color: blue; font-family: fantasy;">Mechanic
													Registration</h2>
												<h3 class="fw-normal mb-4" style="color: #4835d4;">Personal
													Details</h3>

												<div class="row">
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline">
															<input type="text" name="fname"
																class="form-control form-control-lg"
																placeholder="First name"
																value="${user_details.firstName}" />
														</div>
													</div>
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline">
															<input type="text" name="lname"
																class="form-control form-control-lg"
																placeholder="Last name"
																value="${user_details.lastName}" />
														</div>
													</div>
												</div>
												<div class="mb-4 pb-2">
													<div class="form-outline">
														<input type="text" name="email"
															class="form-control form-control-lg" placeholder="Email"
															value="${user_details.email}" />
													</div>
												</div>

												<div class="mb-4 pb-2">
													<div class="form-outline">
														<input type="text" name="mb"
															class="form-control form-control-lg"
															placeholder="Mobile number"
															value="${user_details.mobileNumber}" />
													</div>
												</div>
												<div class="mb-2 pb-2">
													<div class="form-outline">
													&nbsp;&nbsp;<label
															class="form-label" for="form3Examplea3"
															style="font-family: monospace; font-size: x-large;">Birthdate</label>
														<input type="date" name="dob"
															class="form-control form-control-lg"
															placeholder="Date of birth"
															value="${user_details.dob}" />
													</div>
												</div>
												<div class="mb-4 pb-2">
													<div class="form-outline">
														<input type="text" name="ws"
															class="form-control form-control-lg"
															placeholder="Working Status"
															value="${user_details.workingStatus}" readonly="readonly"/>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-6 bg-indigo text-white"
											style="border-radius: 15px; box-shadow: 10px 15px 15px grey">
											<div class="p-4">
												<h3 class="fw-normal mb-5">Address Details</h3>

												<div class="mb-4 pb-2">
													<div class="form-outline form-white">
														<input type="text" name="address"
															class="form-control form-control-lg"
															placeholder="Address"
															value="${address_details.address}" />
													</div>
												</div>
												<div class="mb-4 pb-2">
													<div class="form-outline form-white">
														<input type="text" name="house"
															class="form-control form-control-lg"
															placeholder="House number"
															value="${address_details.houseNo}" />
													</div>
												</div>
												<div class="mb-4 pb-2">
													<div class="form-outline form-white">
														<input type="text" name="landmark"
															class="form-control form-control-lg"
															placeholder="Landmark"
															value="${address_details.landmark}" />
													</div>
												</div>
												<div class="row">
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline form-white">
															<input type="text" name="city"
																class="form-control form-control-lg" placeholder="City"
																value="${address_details.city}" />
														</div>

													</div>
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline form-white">
															<input type="text" name="dist"
																class="form-control form-control-lg"
																placeholder="District"
																value="${address_details.district}" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline form-white">
															<input type="text" name="zipcode"
																class="form-control form-control-lg"
																placeholder="Zipcode"
																value="${address_details.zipCode}" />
														</div>
													</div>
													<div class="col-md-6 mb-4 pb-2">

														<div class="form-outline form-white">
															<input type="text" name="state"
																class="form-control form-control-lg" placeholder="State"
																value="Maharashtra" />
														</div>
													</div>
												</div>
												<div class="mb-4 pb-2">
													<div class="form-outline form-white">
														<input type="text" name="country"
															class="form-control form-control-lg"
															placeholder="Country" value="India" />
													</div>
												</div>
												
												<button type="submit" class="btn btn-light btn-lg"
													data-mdb-ripple-color="dark">Update Profile</button>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</form>
	</div>
	 <div>
                <footer class='footer'>
                    <span class='text-muted'> &#169;All Rights Reserved  <%= (new java.util.Date()).getYear()+1900%> | contact us  <a href='mailTo:mayur.gaikwad097@gmail.com'>M2M Service</a> </span>
                </footer>
            </div>
</body>
</html>