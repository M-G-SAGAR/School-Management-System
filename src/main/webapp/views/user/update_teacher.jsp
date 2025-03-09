<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Admit Form</title>
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
    							<div class="alert text-center ${sessionScope.message.type}" role="alert">
        							<p><c:out value="${sessionScope.message.content}" /></p>
    							</div>
    							<% session.removeAttribute("message"); %>
							</c:if>
        
            <h3>Add Teacher Form</h3>
			<form action="/user/teacher-update/${teacher.tid }" method="post" object="${teacher }" class="user" enctype="multipart/form-data">
            <h4>Teacher Information</h4>
            <div class="form-section">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="firstName" value="${teacher.firstName }">
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="secondName" value="${teacher.secondName }">
                </div>
                <div class="form-group">
                    <label>Class</label>
                    <select name="className" value="${teacher.className }">
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
                    <label>Section</label>
                    <select name="section" value="${teacher.section }">
                        <option disabled selected>Section</option>
                        <option>Section A</option>
                        <option>Section B</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Gender</label>
                    <select name="gender" value="${teacher.gender }">
                        <option disabled selected>Gender</option>
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Date of Birth</label>
                    <input type="date" name="dob"value="${teacher.dob }">
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="address" value="${teacher.address }">
                </div>
                <div class="form-group">
                    <label>Religion</label>
                     <select name="religion" value="${teacher.religion }">
                        <option disabled selected>Religion</option>
                        <option>Hinduism</option>
                        <option>budhism</option>
                        <option>islam</option>
                        <option>sikhism</option>
                        <option>Chrisianity</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="${teacher.email }">
                </div>
                <div class="form-group">
                    <label>Nationality</label>
                     <select name="nationality" value="${teacher.nationality }">
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
                    <label>ID Number</label>
                    <input type="text" name="idNumber" value="${teacher.idNumber }">
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" name="phone" value="${teacher.phone }">
                </div>
                <div class="form-group">
                    <label>Subject</label>
                     <select name="subject" value="${teacher.subject }">
                        <option disabled selected>Subject</option>
                        <option>English</option>
                        <option>Marathi</option>
                        <option>Math</option>
                        <option>Science</option>
                        <option>Geography</option>
                        <option>History</option>
                        <option>Computer</option>
                    </select>
                </div>
                <%-- <div class="form-group">
                    <label>Upload Parents Photo (150px x 150px)</label>
                    <input type="file" name="teacherPhoto" value="${teacher.image }">
                </div> --%>
                <div class="form-group">
						<label>Upload Teacher Photo (150px x 150px)</label>

						<!-- Show existing image if available -->
						<c:if test="${not empty teacher.image}">
							<img src="<%= request.getContextPath() %>/img/${teacher.image}"
								alt="Teacher Photo" width="150px" height="150px">
						</c:if>

						<input type="file" name="teacherImage">
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
