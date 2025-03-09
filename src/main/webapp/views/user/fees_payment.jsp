<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment</title>
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
			Message</a> <a href="/user/account/${user.userId }/show"><i
			class="fas fa-file-alt"></i> Accounts</a>
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

			<h3>Payment</h3>
			<form action="save-fees" method="post" object="${feesList }"
				class="user" enctype="multipart/form-data">
				<h4>Notice Information</h4>
				<div class="form-section">
					<%-- <div class="form-group">
						<label>Student Id</label> <input type="text" name="id"
							value="${student.id }">
					</div> --%>
					<%-- <div class="form-group">
						<label>Student Id</label> <select id="studentId" name="id"
							class="form-control">
							<option value="">Select Student ID</option>
						</select>
					</div>

					<div class="form-group">
						<label>Student Name</label> <input type="text" name="studentName"
							value="${student.firstName } ${student.lastName}">
					</div>

					<div class="form-group">
						<label>Class</label> <input type="text" name="className"
							value="${student.className }">
					</div> --%>



					<div class="form-group">
						<label>Student Id</label> <select id="studentId" name="studentId"
							class="form-control">
							<option value="">Select Student ID</option>
						</select>
					</div>

					<%
					String studentId = request.getParameter("id");
					String encodedId = (studentId != null) ? URLEncoder.encode(studentId, "UTF-8") : "";
					%>

					<div class="form-group">
						<label>First Name</label> <input type="text" id="firstName"
							name="studentName">
					</div>

					<div class="form-group">
						<label>Last Name</label> <input type="text" id="lastName"
							name="studentName">
					</div>

					<div class="form-group">
						<label>Class</label> <input type="text" id="className"
							name="className" readonly>
					</div>

					<div class="form-group">
						<label>Payment Method</label> <select name="paymentMethod">
							<option disabled selected>Payment Method</option>
							<option>PhonePe</option>
							<option>Gpay</option>
							<option>Net Banking</option>
							<option>Debit/credit</option>
							<option>cash</option>
						</select>
					</div>

					<div class="form-group">
						<label>Total Fees</label> <input type="text" id="totalFees"
							name="totalFees" readonly>
					</div>

					<div class="form-group">
						<label>Paid Fees</label> <input type="text" id="paidFees"
							name="paidFees">
					</div>

					<div class="form-group">
						<label>Due Fees</label> <input type="text" id="dueFees"
							name="dueFees" value="${dueFees }" readonly>
					</div>
					<div class="form-group">
						<label>Status</label> <select name="status" required>
							<option disabled selected>Choose Status</option>
							<option value="false">Due</option>
							<option value="true">Paid</option>
						</select>
					</div>
					<div class="form-group">
						<label>Date</label> <input type="date" name="date">
					</div>

					<!-- <div class="form-group">
						<label>Details</label>
						<textarea rows="4" name="details"
							placeholder="Write your Details/Description here...">
						</textarea>
					</div> -->
				</div>
				<div class="button-group">
					<button class="save-btn">Save</button>
					<button type="reset" class="reset-btn">Reset</button>
				</div>
			</form>
		</div>
	</div>
	<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Fetch student IDs for dropdown
        fetch('/user/students/ids')
            .then(response => response.json())
            .then(data => {
                let studentSelect = document.getElementById("studentId");
                studentSelect.innerHTML = '<option value="">Select Student ID</option>';

                data.forEach(id => {
                    let option = document.createElement("option");
                    option.value = id;
                    option.textContent = id;
                    studentSelect.appendChild(option);
                });

                // 🔄 Added: Call fetchStudentDetails when an ID is selected
                studentSelect.addEventListener("change", fetchStudentDetails);
            })
            .catch(error => console.error('Error fetching student IDs:', error));

        // Fetch student details when ID is selected
        function fetchStudentDetails() {
            var selectedId = document.getElementById("studentId").value;
            console.log("Selected Student ID:", selectedId);  // Check if ID is selected

            if (selectedId) {  // Ensure ID is not null or empty
                var url = "http://localhost:8080/user/students/details?id=" + encodeURIComponent(selectedId);

                fetch(url)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("HTTP error " + response.status);
                        }
                        return response.json();
                    })
                    .then(data => {
                        console.log("Fetched Data:", data);
                        if (data) {
                            document.getElementById("firstName").value = data.firstName || "";
                            document.getElementById("lastName").value = data.lastName || "";
                            document.getElementById("className").value = data.className || "";
                            document.getElementById("totalFees").value = data.totalFees || "";
                            document.getElementById("paidFees").value = data.paidFees || "";
                            document.getElementById("dueFees").value = data.dueFees || ""; 
                        } else {
                            console.error("Student data is null or undefined.");
                        }
                    })
                    .catch(error => console.error("Error fetching student details:", error));
            } else {
                console.error("No Student ID selected.");
            }
        }
    });
</script>

	<script>
	console.log("Dropdown values:", Array.from(document.getElementById("studentId").options).map(o => o.value));
	console.log("Paid Fees:", document.getElementById("paidFees").value);
	</script>


</body>

</html>
