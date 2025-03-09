<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Update Form</title>
<style>
body {
	background-color: #f3f4f6;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
}

.sidebar {
	width: 200px;
	background-color: #1e3a8a; /* Dark Blue */
	color: white;
	height: 100vh;
	padding: 20px;
	box-sizing: border-box;
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

.content {
	flex: 1;
	display: flex;
	flex-direction: column;
}

.navbar {
	background-color: #fbbf24;
	padding: 10px;
	color: white;
	text-align: center;
	font-size: 20px;
}

.container {
	flex: 1;
	margin: 0;
	background: #fff;
	padding: 30px;
	border-radius: 0;
	box-shadow: none;
	height: calc(100vh - 50px);
	overflow-y: auto;
}

h1, h2 {
	color: #333;
}

.form-section {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.form-group input, .form-group select {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 80%;
	margin: 0;
}

.form-group label {
	font-size: 14px;
	margin-bottom: 5px;
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
<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
	<!-- SideBar -->
	<div class="sidebar">
		<h3>
			<i class="fa-solid fa-graduation-cap"></i> School Mang. Sys
		</h3>
		<hr>
		<a href="/user/show-students"><i class="fa-solid fa-user"></i> Students</a> 
		<a href="/user/show-teachers"><i class="fa-solid fa-person-chalkboard"></i> Teachers</a> 
		<a href="/user/show-parents"><i class="fa-solid fa-id-badge"></i> Parents</a>
		<a href="/user/show-class"><i class="fa-solid fa-book"></i> Class</a> 
		<a href="/user/show-subject"><i class="fa-solid fa-book-open"></i> Subject</a> 
		<a href="/user/attendance"><i class="fa-solid fa-clipboard-user"></i> Attendance</a> 
		<a href="/user/show-notice"><i class="fas fa-clipboard"></i> Notice</a> 
		<a href="/user/show-message"><i class="fas fa-comments"></i> Message</a> 
		<a href="/user/account/${user.userId }/show"><i class="fas fa-file-alt"></i> Accounts</a>
	</div> 


	<!--  End SideBar -->

	<div class="content">
		<div class="navbar">Welcome to School Management System</div>

		<div class="container">

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

			<h3>Update Student Form</h3>
			<form action="/user/student-update/${student.id }" method="post"
				object="${student }" class="user" enctype="multipart/form-data">
				<h4>Student Information</h4>
				<div class="form-section">
					<div class="form-group">
						<label>First Name</label> <input type="text" name="firstName"
							value="${student.firstName }">
					</div>
					<div class="form-group">
						<label>Last Name</label> <input type="text" name="lastName"
							value="${student.lastName }">
					</div>
					<div class="form-group">
						<label>Class</label> <select name="className"
							value="${student.className }">
							<option disabled selected>Class</option>
							<option>1st Standard</option>
							<option>2nd Standard</option>
							<option>3rd Standard</option>
							<option>4th Standard</option>
							<option>5th Standard</option>
							<option>6th Standard</option>
							<option>7th Standard</option>
							<option>8th Standard</option>
							<option>9th Standard</option>
							<option>10th Standard</option>
						</select>
					</div>
					<div class="form-group">
						<label>Section</label> <select name="section"
							value="${student.section }">
							<option disabled selected>Section</option>
							<option>A</option>
							<option>B</option>
						</select>
					</div>
					<div class="form-group">
						<label>Gender</label> <select name="gender"
							value="${student.gender }">
							<option disabled selected>Gender</option>
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>
					<div class="form-group">
						<label>Date of Birth</label> <input type="date" name="dob"
							value="${student.dob }">
					</div>
					<div class="form-group">
						<label>Roll</label> <input type="text" name="rollNumber"
							value="${student.rollNumber }">
					</div>
					<div class="form-group">
						<label>Admission No</label> <input type="text" name="addmissionNo"
							value="${student.addmissionNo }">
					</div>
					<div class="form-group">
						<label>Address</label> <input type="text" name="address"
							value="${student.address }">
					</div>
					<div class="form-group">
						<label>Religion</label> <select name="religion"
							value="${student.religion }">
							<option disabled selected>Religion</option>
							<option>Hinduism</option>
							<option>budhism</option>
							<option>islam</option>
							<option>Chrisianity</option>
						</select>
					</div>
					<div class="form-group">
						<label>Email</label> <input type="email" name="email"
							value="${student.email }">
					</div>
					<%--  <div class="form-group">
                    <label>Upload Student Photo (150px x 150px)</label>
                    <input type="file" name="profileImage" value="${student.image }">
                </div> --%>
					<div class="form-group">
						<label>Upload Student Photo (150px x 150px)</label>

						<!-- Show existing image if available -->
						<c:if test="${not empty student.image}">
							<img src="<%= request.getContextPath() %>/img/${student.image}"
								alt="Student Photo" width="150px" height="150px">
						</c:if>

						<input type="file" name="profileImage">
					</div>

				</div>

				<h4>Parents Information</h4>
				<div class="form-section">
					<div class="form-group">
						<label>Father Name</label> <input type="text" name="fatherName"
							value="${student.fatherName }">
					</div>
					<div class="form-group">
						<label>Mother Name</label> <input type="text" name="motherName"
							value="${student.motherName }">
					</div>
					<div class="form-group">
						<label>Parents Contact</label> <input type="text"
							name="parentsContact" value="${student.firstName }">
					</div>
					<div class="form-group">
						<label>Father Occupation</label> <select name="fatherOccupation"
							value="${student.fatherOccupation }">
							<option disabled selected>Father Occupation</option>
							<option>Farmer</option>
							<option>Employee</option>
							<option>Bussiness</option>
							<option>Goverment Employee</option>
						</select>
					</div>
					<div class="form-group">
						<label>Mother Occupation</label> <select name="motherOccupation"
							value="${student.motherOccupation }">
							<option disabled selected>Mother Occupation</option>
							<option>House Wife</option>
							<option>Employee</option>
							<option>Bussiness</option>
							<option>Independend</option>
						</select>
					</div>
					<div class="form-group">
						<label>Nationality</label> <select name="nationality"
							value="${student.nationality }">
							<option disabled selected>Nationality</option>
							<option>Indian</option>
							<option>Nepal</option>
							<option>China</option>
							<option>UK</option>
							<option>US</option>
							<option>Canada</option>
							<option>Russia</option>
						</select>
					</div>
					<div class="form-group">
						<label>Present Address</label> <input type="text"
							name="presentAddress" value="${student.presentAddress }">
					</div>
					<div class="form-group">
						<label>Permanent Address</label> <input type="text"
							name="permanentAddress" value="${student.permanentAddress }">
					</div>
					<%--   <div class="form-group">
                    <label>Upload Parents Photo (150px x 150px)</label>
                    <input type="file" name="profileImage" value="${student.parentImage }">
                </div> --%>
					<div class="form-group">
						<label>Upload Parent Photo (150px x 150px)</label>

						<!-- Show existing image if available -->
						<c:if test="${not empty student.parentImage}">
							<img src="<%= request.getContextPath() %>/img/${student.parentImage}"
								alt="Parents Photo" width="150px" height="150px">
						</c:if>

						<input type="file" name="parentsPhoto">
					</div>

				</div>

				<div class="button-group">
					<button class="save-btn">Save</button>
					<button type="reset" class="reset-btn">Reset</button>
				</div>
			</form>
		</div>
	</div>
</body>

</html>




<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Update - Form</title>

    <!-- Custom fonts for this template-->
    <link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-3">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                   <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                        
                        <c:if test="${not empty sessionScope.message}">
    							<div class="alert text-center ${sessionScope.message.type}" role="alert">
        							<p><c:out value="${sessionScope.message.content}" /></p>
    							</div>
    							<% session.removeAttribute("message"); %>
							</c:if>
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Fill Student For Update</h1>
                            </div>
                            
                            
                            <form action="/user/student-update/${student.id }" method="post" class="user">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                           name="firstName" placeholder="First Name" value="${student.firstName }">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            name="lastName" placeholder="Last Name" value="${student.lastName }">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        name="email" placeholder="Email Address" value="${student.email }">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                            name="dob" id="exampleInputPassword" placeholder="DOB" value="${student.dob }">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            name="gender" id="exampleRepeatPassword" placeholder="Gender" value="${student.gender }">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                            name="address" id="exampleInputPassword" placeholder="Address" value="${student.address }">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            name="contact" id="exampleRepeatPassword" placeholder="Contact" value="${student.contact }">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                            name="className" id="exampleInputPassword" placeholder="Class Name" value="${student.className }">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            name="section" id="exampleRepeatPassword" placeholder="Section" value="${student.section }">
                                    </div>
                                </div><div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                            name="rollNumber" id="exampleInputPassword" placeholder="Roll Number" value="${student.rollNumber }">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            name="parentsContact" id="exampleRepeatPassword" placeholder="Parent Contact" value="${student.parentsContact }">
                                    </div>
                                </div>
                                
                                <button class="btn btn-primary btn-user btn-block" type="submit">
												Update Student</button>
                            </form>
                            <hr>
                        </div>
                    </div>
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

</body>

</html> --%>