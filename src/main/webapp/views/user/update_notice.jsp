<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notice Admit Form</title>
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
		<a href="/user/show-students"><i class="fa-solid fa-user"></i>
			Students</a> <a href="/user/show-teachers"><i
			class="fa-solid fa-person-chalkboard"></i> Teachers</a> <a
			href="/user/show-parents"><i class="fa-solid fa-id-badge"></i>
			Parents</a> <a href="/user/show-class"><i class="fa-solid fa-book"></i>
			Class</a> <a href="/user/show-subject"><i
			class="fa-solid fa-book-open"></i> Subject</a> <a href="/user/attendance"><i
			class="fa-solid fa-clipboard-user"></i> Attendance</a> <a
			href="/user/show-notice"><i class="fas fa-clipboard"></i> Notice</a>
		<a href="/user/show-message"><i class="fas fa-comments"></i>
			Message</a> <a href="/user/account/${user.userId }/show"><i class="fas fa-file-alt"></i>
			Accounts</a>
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

			<h3>Add Notice Form</h3>
			<form action="/user/notice-update/${notice.id }" method="post" object="${notice }"
				class="user" enctype="multipart/form-data">
				<h4>Notice Information</h4>
				<div class="form-section">
					<div class="form-group">
						<label>Notice Id</label> <input type="text" name="id" value="${notice.id }">
					</div>
					
					<div class="form-group">
						<label>Title</label> <input type="text" name="title" value="${notice.title }">
					</div>
					
					<div class="form-group">
						<label>Posted By</label> <input type="text" name="postedBy" value="${notice.postedBy }">
					</div>
					
					<div class="form-group">
						<label>Date</label> <input type="date" name="date" value="${notice.date }">
					</div>
					<div class="form-group">
						<label>Details</label>
						<textarea rows="4" name="details" value="${notice.details }"
							class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
							placeholder="Write your Details/Description here...">
						</textarea>
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
