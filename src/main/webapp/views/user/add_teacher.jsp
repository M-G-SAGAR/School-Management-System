<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
			class="navbar-nav bg-dark sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<!-- <i class="fas fa-laugh-wink"></i> -->
					<i class="fa-solid fa-graduation-cap"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					User <sup></sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="index.html"><i class="fa-solid fa-house"></i> <span>Home</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!--   Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i class="fa-solid fa-person-chalkboard"></i> <span>Teachers</span>
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
				aria-expanded="true" aria-controls="collapseStudents"> <i class="fa-solid fa-user"></i> <span>Students</span>
			</a>
				<div id="collapseStudents" class="collapse"
					aria-labelledby="headingStudents" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="add-student">Add Student</a> 
						<a class="collapse-item" href="show-students">Show Student Table</a>
						<a class="collapse-item" href="show-students">Admit Form</a>
						<a class="collapse-item" href="show-students">Student Promotion</a>
						
					</div>
				</div></li>

			<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseParents"
				aria-expanded="true" aria-controls="collapseParents"> <i class="fa-solid fa-id-badge"></i> <span>Parents</span>
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
				aria-expanded="true" aria-controls="collapseClasses"> <i class="fa-solid fa-book"></i> <span>Classes</span>
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
				aria-expanded="true" aria-controls="collapseSubjects"> <i class="fa-solid fa-book-open"></i> <span>Subjects</span>
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
				aria-expanded="true" aria-controls="collapseAttendance"> <i class="fa-solid fa-clipboard-user"></i> <span>Attendance</span>
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
				data-toggle="collapse" data-target="#collapseAttendance"
				aria-expanded="true" aria-controls="collapseAttendance"> <i class="fa-solid fa-clipboard-user"></i> <span>Notice</span>
			</a>
				<div id="collapseAttendance" class="collapse"
					aria-labelledby="headingAttendance" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="attendance">Add Notice</a> <a
							class="collapse-item" href="show-attendance">Show Notice
							Table</a>
					</div>
				</div></li>
				
				<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseAttendance"
				aria-expanded="true" aria-controls="collapseAttendance"> <i class="fa-solid fa-clipboard-user"></i> <span>Message</span>
			</a>
				<div id="collapseAttendance" class="collapse"
					aria-labelledby="headingAttendance" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="attendance">Add Message</a> <a
							class="collapse-item" href="show-attendance">Show Message
							Table</a>
					</div>
				</div></li>
				
				<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseAttendance"
				aria-expanded="true" aria-controls="collapseAttendance"> <i class="fa-solid fa-clipboard-user"></i> <span>Exam</span>
			</a>
				<div id="collapseAttendance" class="collapse"
					aria-labelledby="headingAttendance" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="attendance">Add Exam</a> <a
							class="collapse-item" href="show-attendance">Show Exam
							Table</a>
					</div>
				</div></li>
				
				<!-- Divider -->

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseAttendance"
				aria-expanded="true" aria-controls="collapseAttendance"> <i class="fa-solid fa-clipboard-user"></i> <span>Account</span>
			</a>
				<div id="collapseAttendance" class="collapse"
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

		 <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                 <!--   <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                    <div class="col-lg-7">
                        <div class="p-5">
                        
                        <c:if test="${not empty sessionScope.message}">
    							<div class="alert text-center ${sessionScope.message.type}" role="alert">
        							<p><c:out value="${sessionScope.message.content}" /></p>
    							</div>
    							<% session.removeAttribute("message"); %>
							</c:if>
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Fill Teacher Details</h1>
                            </div>
                            <form action="create-teacher" method="post" object="${teacher }" class="user">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                           name="firstName" placeholder="First Name">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            name="secondName" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        name="email" placeholder="Email Address">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                            name="phone" id="exampleInputPassword" placeholder="Phone Number">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            name="image" id="exampleRepeatPassword" placeholder="Image">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                            name="subject" id="exampleInputPassword" placeholder="Subject">
                                    </div>
                                  
                                </div>
                                
                                
                                <button class="btn btn-primary btn-user btn-block" type="submit">
												Add Teacher</button>
                                
                                
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
	<!-- Bootstrap JS (necessary for dropdown functionality) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</body>
</html>