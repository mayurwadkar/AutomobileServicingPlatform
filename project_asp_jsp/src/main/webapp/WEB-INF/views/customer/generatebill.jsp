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
.body-main {
	background: #ffffff;
	border-bottom: 15px solid #1E1F23;
	border-top: 15px solid #1E1F23;
	margin-top: 30px;
	margin-bottom: 30px;
	padding: 40px 30px !important;
	position: relative;
	box-shadow: 0 1px 21px #808080;
	font-size: 10px;
}

.main thead {
	background: #1E1F23;
	color: #fff;
}

.img {
	height: 100px;
}

h1 {
	text-align: center;
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
	<div class="jumbotron">
		
		<spring:url var="url1" value="/customer/appointments"></spring:url>
		<h4>
			<a href="${url1}" class="btn btn-outline-info">Back</a>
		</h4>
		<div class="container">

			<!-- <div class="page-header">
			<h1>Invoice Template</h1>
		</div> -->


			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 body-main">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-4">
									 <img class="img" alt="Invoce Template" style="width:170px; height:180px "
										src="https://www.clipartmax.com/png/middle/129-1292860_car-auto-mechanic-female-illustration-mechanic-clipart-png.png" />
								</div>
								<div class="col-md-8 text-right">
									<h4 style="color: #F81D2D;">
										<strong>M2M Servicing Centre</strong>
									</h4>
									<p>
										Dr. D.Y. Patil Educational Complex,<br> Sector 29, Behind
										Akurdi Railway Station,<br> Nigdi Pradhikaran, Akurdi<br>
										Pune - 411044<br>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-envelope"
											viewBox="0 0 16 16">
  <path
												d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z" />
</svg>
										m2mservice@gmail.com<br>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-telephone"
											viewBox="0 0 16 16">
  <path
												d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
										+91 7620707620 / +91 8796675627
									</p>

								</div>
							</div>
							<br />
							<hr>
							<!-- <div class="row">
							<div class="col-md-12 text-center">
								<h4>Invoice No : 04854654101</h4>
							</div>
						</div> -->
							<div class="row">
								<div class="col-md-12">
									<h6>
										<b>Customer Name :</b>
										${appointment_details.vehicle.user.firstName}
										${appointment_details.vehicle.user.lastName}
									</h6>
									<h6>
										<b>Vehicle :</b> ${appointment_details.vehicle.vehicleNumber}
										${appointment_details.vehicle.vehicleModel}
										${appointment_details.vehicle.vehicleCompany}
									</h6>
								</div>
							</div>
							<br />
							<div>
								<table class="table">
									<thead>
										<tr>
											<th><h5>Description</h5></th>
											<th><h5>Amount</h5></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="s" items="${requestScope.services}">
											<tr>
												<td class="col-md-9">${s.serviceName}</td>
												<td class="col-md-3"><i class="fas fa-rupee-sign"
													area-hidden="true"></i>${s.amount}</td>
											</tr>
										</c:forEach>
										<tr>
											<td class="text-right">
												<p>
													<strong>Total Amount: </strong>
												</p>
												<p>
													<strong>Discount: </strong>
												</p>
												<p>
													<strong>Payable Amount: </strong>
												</p>
											</td>
											<td>
												<p>
													<strong><i class="fas fa-rupee-sign"
														area-hidden="true"></i> ${total_amount}</strong>
												</p>
												<p>
													<strong><i class="fas fa-rupee-sign"
														area-hidden="true"></i> ${discount_amount} </strong>
												</p>
												<p>
													<strong><i class="fas fa-rupee-sign"
														area-hidden="true"></i> ${payable_amount}</strong>
												</p>
											</td>
										</tr>
										<tr style="color: #F81D2D;">
											<td class="text-right"><h4>
													<strong>Total:</strong>
												</h4></td>
											<td class="text-left"><h4>
													<strong><i class="fas fa-rupee-sign"
														area-hidden="true"></i>${payable_amount}</strong>
												</h4></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div>
								<div class="col-md-12">
									<p>
										<b>Date :</b> ${date}
									</p>
									<br />
									<p>
										<b>Signature</b>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- <div style="width: 35%; margin-left: 14%">
			<form method="post">
				<div class="row mb-3">
					<label for="inputEmail" class="col-sm-4 col-form-label"
						style="font-size: 0.5cm;">Appointment ID : </label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail"
							value="${appointment_details.id}" name="appointment_id">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputEmail" class="col-sm-4 col-form-label"
						style="font-size: 0.5cm;">Payment Mode : </label>
					<div class="col-sm-8">
						<select name="payment_mode" class="form-control">
							<option>Cash</option>
							<option>Online</option>
						</select>
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputEmail" class="col-sm-4 col-form-label"
						style="font-size: 0.5cm;">Transaction ID : </label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputEmail"
							placeholder="Transaction ID" name="transaction_id">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10 offset-sm-4">
						<button type="submit" class="btn btn-primary">Accept
							Payment</button>
					</div>
				</div>
			</form>
		</div> --%>
		<br />
	</div>
	 <div>
                <footer class='footer'>
                    <span class='text-muted'> &#169;All Rights Reserved  <%= (new java.util.Date()).getYear()+1900%> | contact us  <a href='mailTo:mayur.gaikwad097@gmail.com'>M2M Service</a> </span>
                </footer>
            </div>
</body>
</html>