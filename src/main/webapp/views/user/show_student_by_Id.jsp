<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Edit Book</title>
</head>
<!-- Here i am facing css issue so when i remove the containt of body class i get the css properly -->
<body class="">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h2 class="text-center font-weight-light my-2">Book Details</h2>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-4" align="center">
											<h1>
												<i class="icon-android-attach"></i>
											</h1>
											<h2>${student.firstName}</h2>
											<div class="hr-center"></div>
											<h5>STUDENT#${student.id}</h5>
											<br> <img id="barcode" class="img-responsive" /> <br />
											<br />

										</div>
										<div class="col-md-4">
										
											<h4>First Name</h4>
											<div class="hr-left"></div>
											<p>${student.firstName}</p>
											
											<h4>Last Name</h4>
											<div class="hr-left"></div>
											<p>${student.lastName}</p>

											<h4>Email</h4>
											<div class="hr-left"></div>
											<p>${student.email}</p>

											<h4>Date Of Birth</h4>
											<div class="hr-left"></div>
											<p>${student.dob}</p>
										</div>
										<div class="col-md-4">
										
											<h4>Gender</h4>
											<div class="hr-left"></div>
											<p>${student.gender}</p>

											<h4>Address</h4>
											<div class="hr-left"></div>
											<p>${student.address}</p>

											<h4>Contact</h4>
											<div class="hr-left"></div>
											<p>${student.contact}</p>

											<h4>Roll Number</h4>
											<div class="hr-left"></div>
											<p>${student.rollNumber}</p>
											
											<h4>Class Name</h4>
											<div class="hr-left"></div>
											<p>${student.className}</p>
											
											<h4>Parents Contact</h4>
											<div class="hr-left"></div>
											<p>${student.parentsContact}</p>
										</div>
									</div>

								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a class="btn btn-outline-primary ml-2" href="/user/show-students">Back</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<!-- <div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2022</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div> -->
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>