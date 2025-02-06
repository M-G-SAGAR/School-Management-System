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
     <h3><i class="fa-solid fa-graduation-cap"></i> School Mang. Sys </h3>
    <hr>
    <a href="show-students"><i class="fa-solid fa-user"></i> Students</a>
    <a href="show-teachers"><i class="fa-solid fa-person-chalkboard"></i> Teachers</a>
    <a href="show-parents"><i class="fa-solid fa-id-badge"></i> Parents</a>
    <a href="show-students"><i class="fa-solid fa-book"></i> Library</a>
    <a href="attendance"><i class="fa-solid fa-clipboard-user"></i> Attendance</a>
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
			<form action="create-teacher" method="post" object="${teacher }" class="user" enctype="multipart/form-data">
            <h4>Teacher Information</h4>
            <div class="form-section">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="firstName">
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="secondName">
                </div>
                <div class="form-group">
                    <label>Class</label>
                    <select name="className">
                        <option disabled selected>Class</option>
                        <option>Class 1</option>
                        <option>Class 2</option>
                        <option>Class 3</option>
                        <option>Class 4</option>
                        <option>Class 5</option>
                        <option>Class 6</option>
                        <option>Class 7</option>
                        <option>Class 8</option>
                        <option>Class 9</option>
                        <option>Class 10</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Section</label>
                    <select name="section">
                        <option disabled selected>Section</option>
                        <option>Section A</option>
                        <option>Section B</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Gender</label>
                    <select name="gender">
                        <option disabled selected>Gender</option>
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Date of Birth</label>
                    <input type="date" name="dob">
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="address">
                </div>
                <div class="form-group">
                    <label>Religion</label>
                     <select name="religion">
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
                    <input type="email" name="email">
                </div>
                <div class="form-group">
                    <label>Nationality</label>
                     <select name="nationality">
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
                    <input type="text" name="idNumber">
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" name="phone">
                </div>
                <div class="form-group">
                    <label>Subject</label>
                     <select name="subject">
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
                <div class="form-group">
                    <label>Upload Parents Photo (150px x 150px)</label>
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
