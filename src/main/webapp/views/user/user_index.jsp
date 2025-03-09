<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
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
.sidebar-custom-blue {
	background-color: #003366 !important; /* Dark Blue */
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

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav sidebar sidebar-dark accordion sidebar-custom-blue"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="">
				<div class="sidebar-brand-icon rotate-n-15">
					<!-- <i class="fas fa-laugh-wink"></i> -->
					<i class="fa-solid fa-graduation-cap"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					School Mang. Sys <sup></sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="index"><i
					class="fa-solid fa-house"></i> <span>Home</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!--   Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fa-solid fa-person-chalkboard"></i> <span>Teachers</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<!--  <h6 class="collapse-header">Custom Components:</h6> -->
						<a class="collapse-item" href="add-teacher">Add Teacher</a> <a
							class="collapse-item" href="show-teachers">Show Teacher Table</a>
					</div>
				</div></li>

			<!-- Divider -->
			<!--  <hr class="sidebar-divider"> -->


			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseStudents"
				aria-expanded="true" aria-controls="collapseStudents"> <i
					class="fa-solid fa-user"></i> <span>Students</span>
			</a>
				<div id="collapseStudents" class="collapse"
					aria-labelledby="headingStudents" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="add-student">Admit Form</a> <a
							class="collapse-item" href="show-students">Show Student Table</a>
						<a class="collapse-item" href="show-students">Student
							Promotion</a>

					</div>
				</div></li>

			<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseParents"
				aria-expanded="true" aria-controls="collapseParents"> <i
					class="fa-solid fa-id-badge"></i> <span>Parents</span>
			</a>
				<div id="collapseParents" class="collapse"
					aria-labelledby="headingParents" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<!-- <a class="collapse-item" href="add-parent">Add Parent</a> -->
						<a class="collapse-item" href="show-parents">Show Parent Table</a>
					</div>
				</div></li>

			<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseClasses"
				aria-expanded="true" aria-controls="collapseClasses"> <i
					class="fa-solid fa-book"></i> <span>Classes</span>
			</a>
				<div id="collapseClasses" class="collapse"
					aria-labelledby="headingClasses" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="add-class">Add Class</a> <a
							class="collapse-item" href="show-class">Show Class Table</a>
					</div>
				</div></li>

			<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseSubjects"
				aria-expanded="true" aria-controls="collapseSubjects"> <i
					class="fa-solid fa-book-open"></i> <span>Subjects</span>
			</a>
				<div id="collapseSubjects" class="collapse"
					aria-labelledby="headingSubjects" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="add-subject">Add Subject</a> <a
							class="collapse-item" href="show-subject">Show Subjects Table</a>
					</div>
				</div></li>

			<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseAttendance"
				aria-expanded="true" aria-controls="collapseAttendance"> <i
					class="fa-solid fa-clipboard-user"></i> <span>Attendance</span>
			</a>
				<div id="collapseAttendance" class="collapse"
					aria-labelledby="headingAttendance" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="attendance">Add Attendance</a> <a
							class="collapse-item" href="show-attendance">Show Attendance
							Table</a>
					</div>
				</div></li>

			<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsNotice"
				aria-expanded="true" aria-controls="collapsNotice"> <i
					class="fas fa-clipboard"></i> <span>Notice</span>
			</a>
				<div id="collapsNotice" class="collapse"
					aria-labelledby="headingAttendance" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="add-notice">Add Notice</a> <a
							class="collapse-item" href="show-notice">Show Notice Table</a>
					</div>
				</div></li>

			<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseMessage"
				aria-expanded="true" aria-controls="collapseMessage"><i
					class="fas fa-comments"></i> <span>Message</span> </a>
				<div id="collapseMessage" class="collapse"
					aria-labelledby="headingAttendance" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="attendance">Add Message</a> <a
							class="collapse-item" href="show-attendance">Show Message
							Table</a>
					</div>
				</div></li>

			<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseExam"
				aria-expanded="true" aria-controls="collapseExam"> <i
					class="fas fa-file-alt"></i> <span>Exam</span>
			</a>
				<div id="collapseExam" class="collapse"
					aria-labelledby="headingAttendance" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="attendance">Add Exam</a> <a
							class="collapse-item" href="show-attendance">Show Exam Table</a>
					</div>
				</div></li>

			<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseAccount"
				aria-expanded="true" aria-controls="collapseAccount"> <i
					class="fa fa-user"></i> <span>Account</span>
			</a>
				<div id="collapseAccount" class="collapse"
					aria-labelledby="headingAttendance" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<!-- <a class="collapse-item" href="attendance">Add Account</a> --> <a
							class="collapse-item" href="account/${user.userId }/show">Account Setting
							</a>
					</div>
				</div></li>


			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>



		</ul>
		<!-- End of Sidebar -->

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
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Home</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>

					<!-- Content Row -->

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


					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Students</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
										</div>
										<div class="col-auto">
											<i class="fa-solid fa-user"></i>
											<!-- <i class="fas fa-calendar fa-2x text-gray-300"> -->
											</i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!--  Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Teachers</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
										</div>
										<div class="col-auto">
											<i class="fa-solid fa-person-chalkboard"></i>
											<!-- <i class="fas fa-dollar-sign fa-2x text-gray-300"> -->
											</i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!--  Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">Parents
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
												</div>
												<!-- <div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 50%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div> -->
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!--  Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Total Earning</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
										</div>
										<div class="col-auto">
											<!--  <i class="fas fa-comments fa-2x text-gray-300"></i> -->
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->

					<div class="row">



						<!-- <div class="container mt-2 ml-0 mr-0"> -->
						<!-- School Events Calendar Card -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4 calendar-card">
								<!-- Card Header -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">School
										Events Calendar</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<!-- Calendar Container -->
									<div id="calendar-container"></div>
								</div>
							</div>
						</div>
						<!-- </div> -->

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!--   Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Revenue
										Sources</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!--  Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="myPieChart"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i
											class="fas fa-circle text-primary"></i> Collections
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-success"></i> Fees
										</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
											Expenses
										</span>
									</div>
								</div>
							</div>

						</div>

					</div>

					<!-- Content Row -->
					<div class="row">

						<!--                         Content Column -->
						<div class="col-lg-6 mb-4">

							<!--  Project Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
								</div>
								<div class="card-body">
									<h4 class="small font-weight-bold">
										Server Migration <span class="float-right">20%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-danger" role="progressbar"
											style="width: 20%" aria-valuenow="20" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										Sales Tracking <span class="float-right">40%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 40%" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										Customer Database <span class="float-right">60%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar" role="progressbar"
											style="width: 60%" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>

								</div>
							</div>

							<!-- Color System -->
							<!-- <div class="row">
								<div class="col-lg-6 mb-4">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											Primary
											<div class="text-white-50 small">#4e73df</div>
										</div>
									</div>
								</div>

								<div class="col-lg-6 mb-4">
									<div class="card bg-warning text-white shadow">
										<div class="card-body">
											Warning
											<div class="text-white-50 small">#f6c23e</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card bg-danger text-white shadow">
										<div class="card-body">
											Danger
											<div class="text-white-50 small">#e74a3b</div>
										</div>
									</div>
								</div>

								<div class="col-lg-6 mb-4">
									<div class="card bg-dark text-white shadow">
										<div class="card-body">
											Dark
											<div class="text-white-50 small">#5a5c69</div>
										</div>
									</div>
								</div>
							</div> -->

						</div>

						<div class="col-lg-6 mb-4">

							<!-- Illustrations -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Notice Board</h6>
								</div>
								<%-- <div class="card-body">
								<c:forEach items="${notice }" var="notices">
									<div class="">
										<!-- <img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 25rem;" src="img/undraw_posting_photo.svg"
											alt="..."> -->
											<fmt:parseDate var="parsedDate" value="${notice.date }" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${parsedDate }" pattern="dd MMM,yyyy"/>
											
											<p id="notice-date" style="color:red;" data-date="${notices.date}"></p>
											<p style="color:green; font-weight:bold">${notices.postedBy }</p>
									</div>
									<p>
										<!-- Add some quality, svg illustrations to your project courtesy
										of <a target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
										a constantly updated collection of beautiful svg images that
										you can use completely free and without attribution! -->
										
											${notices.details}
									</p>
									<a target="_blank" rel="nofollow" href="https://undraw.co/">${notices.title } &rarr;</a>
								</c:forEach>
								</div> --%>
								<div class="card-body">
    <c:forEach items="${notice}" var="notices">
        <div class="notice-card" style="padding: 15px; margin-bottom: 20px; border-bottom: 1px solid #ddd;">
            <p class="notice-date" style="color:red;" data-date="${notices.date}"></p>
            <p style="color:green; font-weight:bold">${notices.postedBy}</p>
            <p>${notices.details}</p>
            <a target="_blank" rel="nofollow" href="https://undraw.co/">${notices.title} &rarr;</a>
        </div>
    </c:forEach>
</div>
							</div>
							<!--   Approach -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Recent
										Activities</h6>
								</div>
								<div class="card-body">
									<p>SB</p>
									<p class="mb-0">Before</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
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
	<!-- FullCalendar Initialization Script -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar-container');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				headerToolbar : {
					left : 'prev,next',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				height : 'auto',
				contentHeight : 'auto', // Let the content dictate the height
				eventLimit : true, // Handle overflow of events
				events : [ {
					title : 'Math Class',
					start : '2024-09-10T10:00:00',
					end : '2024-09-10T12:00:00',
					color : '#f39c12' // Optional: color for the event
				}, {
					title : 'Science Exam',
					start : '2024-09-15',
					allDay : true,
					color : '#e74c3c'
				}, {
					title : 'Parent-Teacher Meeting',
					start : '2024-09-20T14:00:00',
					end : '2024-09-20T16:00:00',
					color : '#3498db'
				}, {
					title : 'School Holiday',
					start : '2024-09-25',
					end : '2024-09-27',
					color : '#2ecc71'
				}, {
					title : 'Project Deadline',
					start : '2024-09-30',
					allDay : true,
					color : '#9b59b6'
				} ]
			});
			calendar.render();
		});
	</script>


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