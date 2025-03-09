<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>${title }</title>
<!-- Custom fonts for this template-->
<link href="../../vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../../css/sb-admin-2.min.css" rel="stylesheet">


<!-- FullCalendar CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css"
	rel="stylesheet">
<!-- FullCalendar JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- Bootstrap CSS (for card styles) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
.sidebar {
	position: fixed;
	top: 0;
	left: 0;
	width: 200px; /* Sidebar width */
	height: 100vh;
	background-color: #1e3a8a; /* Dark Blue */
	color: white;
	padding: 20px;
	box-sizing: border-box;
	z-index: 1000; /* Keep it above other content */
	overflow-y: auto; /* Ensure sidebar is scrollable if needed */
}

.sidebar h2 {
	color: #fbbf24; /* Yellow */
}

.sidebar a {
	color: white;
	text-decoration: none;
	display: block;
	margin: 10px 0;
	padding: 8px 12px;
	border-radius: 5px;
	transition: background 0.3s;
}

.sidebar a:hover {
	background: rgba(255, 255, 255, 0.2);
}

.navbar {
	background-color: #fbbf24;
	padding: 10px;
	color: white;
	text-align: center;
	font-size: 20px;
}
</style>
<style>
.calendar-card {
	height: 96%;
}

#calendar-container {
	height: 300%; /* Make the container use full height of the card body */
	overflow: hidden; /* Hide overflow */
}

.fc {
	font-size: 0.65rem; /* Adjust font size if necessary */
}
</style>

<style>
/* Ensure only the main page scrolls */
html, body {
	height: 100%;
	overflow-y: auto; /* Vertical scroll only on main page */
	overflow-x: hidden; /* Prevent horizontal scroll */
	margin: 0;
	margin-left: 200px;
}

/* Allow collapsible sections and main content to expand without scrolling inside */
#main-content, .content-wrapper, .collapse {
	overflow: visible !important; /* Remove any inner scroll */
}

.container, .row, .col, .card, .calendar-card {
	height: auto !important; /* Ensure content defines height */
}

.navbar-nav {
	overflow: visible; /* Avoid scroll in nav sections */
}
</style>
<style>
.my_profile_picture {
	width: 200px;
	height: 200px;
	object-fit: cover;
}
</style>

</head>

<body id="page-top"
	style="background-color: #f3f4f6; margin: 0; font-family: Arial, sans-serif;">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- SideBar -->
		<div class="sidebar">
			<h3>
				<i class="fa-solid fa-graduation-cap"></i> School Mang. Sys
			</h3>
			<hr>
			<a href="/user/show-students"><i class="fa-solid fa-user"></i>
				Students</a> <a href="/user/show-teachers"><i
				class="fa-solid fa-person-chalkboard"></i> Teachers</a> <a
				href="/user/show-parents"><i class="fa-solid fa-id-badge"></i>
				Parents</a> <a href="/user/show-class"><i class="fa-solid fa-book"></i>
				Class</a> <a href="/user/show-subject"><i
				class="fa-solid fa-book-open"></i> Subject</a> <a
				href="/user/attendance"><i class="fa-solid fa-clipboard-user"></i>
				Attendance</a> <a href="/user/show-notice"><i
				class="fas fa-clipboard"></i> Notice</a> <a href="/user/show-message"><i
				class="fas fa-comments"></i> Message</a> <a
				href="/user/account/${user.userId }/show"><i
				class="fas fa-file-alt"></i> Accounts</a>
		</div>


		<!--  End SideBar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<!-- <form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form> -->
					<div class="navbar">Welcome to School Management System</div>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_1.svg"
											alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_2.svg"
											alt="...">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun · 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_3.svg"
											alt="...">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez · 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">${user.userName }</span>
								<img class="img-profile rounded-circle"
								src="../../img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="change-password"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/logout"> <!-- data-toggle="modal" data-target="#logoutModal" -->
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>
					</ul>
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->

				<div style="display: flex; min-height: 100vh;">

					<main style="flex: 1; padding: 15px;">
						<div style="display: flex; gap: 20px; align-items: flex-start;">

							<div
								style="width: 60%; background: white; padding: 20px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.4); border-radius: 8px;">
								<h3
									style="font-size: 18px; font-weight: bold; margin-bottom: 15px;">User
									Profile</h3>
								<hr>
								<div style="display: flex; align-items: left; gap: 55px;">
									<img src="<c:url value='/img/${user.image}'/>"
										class="my_profile_picture">
									<div>
										<p>
											<strong>Name:</strong> ${user.userName }
										</p>
										<p>
											<strong>Gender</strong> ${user.gender }
										</p>
										<p>
											<strong>Email:</strong> ${user.email }
										</p>
										<p>
											<strong>Role:</strong> ${user.role }
										</p>
										<p>
											<strong>Phone:</strong> ${user.phone }
										</p>
										<p>
											<strong>Type:</strong> ${user.userType }
										</p>
										<p>
											<strong>School Code:</strong> ${user.schoolCode }
										</p>
										<p>
											<strong>Address:</strong> ${user.address }
										</p>
										<p>
											<strong>Language:</strong> ${user.language }
										</p>
									</div>
								</div>
							</div>

							<div
								style="width: 40%; background: white; padding: 20px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.4); border-radius: 8px;">
								
								<!-- Message Content Row -->
								<c:if test="${not empty sessionScope.message}">
									<div class="alert text-center ${sessionScope.message.type}"
										role="alert">
										<p>
											<c:out value="${sessionScope.message.content}" />
										</p>
									</div>
									<%
									session.removeAttribute("message");
									%>
								</c:if>
								
								<h3
									style="font-size: 18px; font-weight: bold; margin-bottom: 20px;">Account
									Setting</h3>
								<hr>
								<form action="/user/user-update/${user.userId }"
									object="${user }" class="user" enctype="multipart/form-data"
									method="post">
									<input type="text" name="userName" placeholder="Name...."
										value="${user.userName }"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<select name="gender" value="${user.gender }"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
										<option value="${user.gender }">Gender</option>
										<option>Male</option>
										<option>Female</option>
									</select> <input type="email" name="email" placeholder="E-mail"
										value="${user.email }"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<input type="text" name="phone" placeholder="Phone"
										value="${user.phone }"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<select name="userType"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
										<option value="${user.userType }">Type</option>
										<option>Student</option>
										<option>Teacher</option>
									</select> <input type="text" name="schoolCode" placeholder="School Code"
										value="${user.schoolCode }"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<input type="text" name="address" placeholder="Address"
										value="${user.address }"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<select name="language"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
										<option value="${user.language }">Select Language</option>
										<option>English</option>
										<option>Marathi</option>
										<option>Hindi</option>
									</select>
									<!-- <input type="date" name="date"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;"> -->
									<!-- <input type="file" name="image"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;"> -->
									<div class="form-group">
										<label>Upload User Photo (150px x 150px)</label>

										<!-- Show existing image if available -->
										<c:if test="${not empty user.image}">
											<img src="<%= request.getContextPath() %>/img/${user.image}"
												alt="User Photo" style="margin-top: 10px" width="100px"
												height="100px">
										</c:if>

										<input type="file" name="imageFile">
									</div>

									<div style="display: flex; gap: 10px; margin-top: 10px;">
										<button type="submit"
											style="background-color: #f59e0b; color: white; padding: 10px 15px; border: none; border-radius: 5px;">Update</button>
										<button type="reset"
											style="background-color: #1e40af; color: white; padding: 10px 15px; border: none; border-radius: 5px;">Reset</button>
									</div>
								</form>
							</div>
						</div>
					</main>
				</div>


				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
			<!-- Footer -->
			<!-- <footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer> -->
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="../../vendor/jquery/jquery.min.js"></script>
	<script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="../../js/sb-admin-2.min.js"></script>
	<!-- Page level plugins -->
	<script src="../../vendor/chart.js/Chart.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="../../js/demo/chart-area-demo.js"></script>
	<script src="../../js/demo/chart-pie-demo.js"></script>



	<script>
    document.addEventListener("DOMContentLoaded", function () {
        let noticeDateElements = document.querySelectorAll(".notice-date");

        noticeDateElements.forEach(noticeDateElement => {
            let dateString = noticeDateElement.getAttribute("data-date")?.trim();

            if (!dateString) {
                noticeDateElement.innerText = "Invalid Date";
                return;
            }

            // Convert "DD-MM-YYYY" or "DD/MM/YYYY" to "YYYY-MM-DD"
            if (/^\d{2}-\d{2}-\d{4}$/.test(dateString) || /^\d{2}\/\d{2}\/\d{4}$/.test(dateString)) {
                let parts = dateString.split(/[-\/]/);
                dateString = `${parts[2]}-${parts[1]}-${parts[0]}`;
            }

            let date = new Date(dateString);

            if (isNaN(date.getTime())) {
                noticeDateElement.innerText = "Invalid Date Format";
                return;
            }

            let formattedDate = date.getDate() + " " + date.toLocaleString("en-US", { month: "short" }) + ", " + date.getFullYear();
            noticeDateElement.innerText = formattedDate;
        });
    });
</script>

	<!-- Bootstrap JS (necessary for dropdown functionality) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</body>
</html>


<%-- 	<!-- Begin Page Content -->

				<div style="display: flex; min-height: 100vh;">

					<main style="flex: 1; padding: 15px;">
						<div style="display: flex; gap: 20px; align-items: flex-start;">

							<div
								style="width: 40%; background: white; padding: 20px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.4); border-radius: 8px;">
								<h3
									style="font-size: 18px; font-weight: bold; margin-bottom: 15px;">User
									Profile</h3>
								<div style="display: flex; align-items: center; gap: 15px;">
									<img src="https://via.placeholder.com/100"
										style="border-radius: 50%;">
									<div>
										<p>
											<strong>Name:</strong> ${user.userName }
										</p>
										<p>
											<strong>Gender</strong> ${user.gender }
										</p>
										<p>
											<strong>Email:</strong> ${user.email }
										</p>
										<p>
											<strong>Role:</strong> ${user.role }
										</p>
										<p>
											<strong>Phone:</strong> ${user.phone }
										</p>
										<p>
											<strong>Type:</strong> ${user.userType }
										</p>
										<p>
											<strong>School Code:</strong> ${user.schoolCode }
										</p>
										<p>
											<strong>Address:</strong> ${user.address }
										</p>
										<p>
											<strong>Language:</strong> ${user.language }
										</p>
										<p>
											<strong>Image</strong> ${user.image }
										</p>
									</div>
								</div>
							</div>

							<!-- Message Content Row -->

							<c:if test="${not empty sessionScope.message}">
								<div class="alert text-center ${sessionScope.message.type}"
									role="alert">
									<p>
										<c:out value="${sessionScope.message.content}" />
									</p>
								</div>
								<%
								session.removeAttribute("message");
								%>
							</c:if>

							<div
								style="width: 40%; background: white; padding: 20px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.4); border-radius: 8px;">
								<h3
									style="font-size: 18px; font-weight: bold; margin-bottom: 20px;">Account
									Setting</h3>
								<form>
									<input type="text" placeholder="First Name"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<input type="text" placeholder="Last Name"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<input type="text" placeholder="Address"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<input type="text" placeholder="Phone"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<input type="email" placeholder="E-mail"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<input type="text" placeholder="School Code"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<input type="text" placeholder="Session"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<select
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
										<option>English</option>
										<option>Spanish</option>
									</select> <input type="date"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<input type="file"
										style="width: calc(70% - 20px); padding: 5px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; display: block;">
									<div style="display: flex; gap: 10px; margin-top: 10px;">
										<button type="submit"
											style="background-color: #f59e0b; color: white; padding: 10px 15px; border: none; border-radius: 5px;">Update</button>
										<button type="reset"
											style="background-color: #1e40af; color: white; padding: 10px 15px; border: none; border-radius: 5px;">Reset</button>
									</div>
								</form>
							</div>
						</div>
					</main>
				</div>
 --%>