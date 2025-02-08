
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Tables</title>
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

.my_profile_picture {
	width: 40px;
	height: 40px;
	object-fit: cover;
	border-radius: 50%;
}

.button-group {
	margin-top: 20px;
	display: flex;
	gap: 10px;
}

.button-group button {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.save-btn {
	background-color: #fbbf24;
	color: white;
}

.reset-btn {
	background-color: #1e3a8a;
	color: white;
}
</style>

<!-- Custom fonts for this template -->
<link href="../../vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../../vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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
				href="index.html">
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
						<a class="collapse-item" href="add-parent">Add Parent</a> <a
							class="collapse-item" href="show-parents">Show Parent Table</a>
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
						<a class="collapse-item" href="add-student">Add Class</a> <a
							class="collapse-item" href="show-students">Show Class Table</a>
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
							class="collapse-item" href="show-subjects">Show Subjects
							Table</a>
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
						<a class="collapse-item" href="attendance">Add Notice</a> <a
							class="collapse-item" href="show-attendance">Show Notice
							Table</a>
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
						<a class="collapse-item" href="attendance">Add Account</a> <a
							class="collapse-item" href="show-attendance">Show Account
							Table</a>
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
					class="navbar navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<!-- Topbar Search -->
					<!-- <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
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
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<div class="container-fluid">

					<!-- Page Heading -->
					<!-- <h1 class="h3 mb-2 text-gray-800">Tables</h1> -->
					<!-- DataTables Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables -
								Attendance Of Students</h6>
						</div>
					<form action="submitAttendance" method="post">
						<div
							class="d-sm-flex align-items-center justify-content-between mb-0 mt-3 mx-4">
							<a href="#" onclick="exportData()"
								class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
								class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
								<div class="flex flex-col items-center">
								<label for="date"
									class="block text-lg font-medium text-gray-700 mb-2">Select
									Date:</label> <input type="date" id="date" name="date"
									class="block w-64 px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm transition duration-300 ease-in-out hover:border-blue-400"
									required>
									</div>
						</div>
						
								
							
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<!--  id="dataTable" -->
										<thead>
											<tr>
												<th>Student Id</th>
												<th>Student Name</th>
												<th>Gender</th>
												<th>Class</th>
												<th>Sections</th>
												<th>Roll Number</th>
												<th>Attendance Status</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${students }" var="student">
												<tr>
													<td class="font-weight-bold"><a
														href="student/${student.id}/show"
														style="color: blue; text-decoration: none;">
															STUDENT#${student.id} </a></td>
													<td><img alt="profilePhoto"
														src="<c:url value='/img/${student.image}'/>"
														class="my_profile_picture"> <span>
															${student.firstName } ${student.lastName}</span></td>
													<td>${student.gender}</td>
													<td>${student.className}</td>
													<td>${student.section}</td>
													<td>${student.rollNumber}</td>
													<td><input type="radio"
														class="btn btn-outline-success btn-sm mx-1 my-0"
														name="attendance[${student.id}]" value="Present" required>
														Present </br> <input type="radio"
														class="btn btn-outline-success btn-sm mx-1 my-0"
														name="attendance[${student.id}]" value="Absent">
														Absent</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- <input type="submit" value="Submit Attendance"> -->
							<div class="button-group text-center mx-4 my-4">
								<button type="submit" value="Submit Attendance" class="save-btn">Save</button>
								<button type="reset" class="reset-btn">Reset</button>
							</div>
						</form>
					</div>
				</div>

				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@linways/table-to-excel@1.0.4/dist/tableToExcel.min.js"></script>


	<script>
		
	function deleteTeacher(tid) {
	    swal({
	        title: "Are you sure?",
	        text: "You want to delete this Teacher!",
	        icon: "warning",
	        buttons: true,
	        dangerMode: true,
	    })
	    .then((willDelete) => {
	        if (willDelete) {
	            $.ajax({
	                url: "teacher/" + tid + "/delete",
	                type: "POST", // Changed to POST
	                success: function(response) {
	                    swal("Deleted!", "The teacher has been deleted.", "success")
	                        .then(() => {
	                            location.reload(); // Refresh the page after deletion
	                        });
	                },
	                error: function() {
	                    swal("Error!", "Something went wrong. Please try again.", "error");
	                }
	            });
	        } else {
	            swal("Teacher is safe!");
	        }
	    });
	}

	
		/* function deleteTeacher(tid){
			swal({
				  title: "Are you sure?",
				  text: "You want to delete this Teacher!",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    
					  window.location = "teacher/" + tid + "/delete";
				  } else {
				    swal("Teacher is safe!");
				  }
				});
		} */
	</script>

	<script>
		function exportData(){
			TableToExcel.convert(document.getElementById("dataTable"), {
				  name: "studentAttendence.xlsx",
				  sheet: {
				    name: "Sheet 1"
				  }
				});
		}
	</script>

	<!-- Core plugin JavaScript-->
	<script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../../vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="../../vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../../js/demo/datatables-demo.js"></script>

</body>

</html>





<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="submit"] {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h1 style="text-align: center;">Mark Attendance</h1>

<form action="submitAttendance" method="post">
    <label for="date" style="display: block; text-align: center;">Date:</label>
    <input type="date" id="date" name="date" style="display: block; margin: 0 auto 20px auto;" required><br><br>

    <table>
    
    	<tr>
    		<th>Student Id</th>
            <th>Student Name</th>
            <th>Attendance Status</th>
            <th>Gender</th>
            <th>Class</th>
            <th>Sections</th>
            <th>Roll Number</th>
        </tr>
    	<c:forEach items="${students }" var="student" >

        <!-- Example rows (these would be dynamically generated in a real application) -->
        <tr>
        	<td>${student.id}</td>
            <td>${student.firstName} ${student.lastName }</td>
            <td>${student.gender} </td>
            <td>${student.className} </td>
            <td>${student.section} </td>
            <td>${student.rollNumber} </td>
            <td>
                <input type="radio" name="attendance[${student.id}]" value="Present" required> Present
                </br>
                <input type="radio" name="attendance[${student.id}]" value="Absent"> Absent
            </td>
        </tr>
         </c:forEach>
    </table>
	
    <input type="submit" value="Submit Attendance">
    
</form>

</body>
</html> --%>
