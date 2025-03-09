<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Details</title>
     <style>
	   .my_profile_picture{
	    width: 200px;
	    height: 200px;
	    object-fit: cover;
	    }
    </style>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.5/flowbite.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="bg-gray-100">
    <div class="flex h-screen">
        <!-- Sidebar -->
        <aside class="w-64 bg-blue-900 text-white">
            <div class="p-4 text-2xl font-bold border-b border-gray-700">School Management Sys</div>
            <nav class="mt-4">
                <ul>
                    <a href="/user/index"> <li class="px-4 py-2 hover:bg-blue-800">Dashboard</li></a>
                    <li class="px-4 py-2 hover:bg-blue-800">Students
                        <ul class="ml-4">
                            <a href="/user/show-students"><li class="px-2 py-1 hover:bg-blue-700">All Students</li></a>
                           <!--  <a href="/user/index"><li class="px-2 py-1 bg-blue-700">Student Details</li></a> -->
                            <a href="/user/add-student"><li class="px-2 py-1 hover:bg-blue-700">Admit Form</li></a>
                            <a href="/user/index"><li class="px-2 py-1 hover:bg-blue-700">Student Promotion</li></a>
                        </ul>
                    </li>
                    <a href="/user/show-teachers"><li class="px-4 py-2 hover:bg-blue-800">Teachers</li></a>
                    <a href="/user/show-parents"><li class="px-4 py-2 hover:bg-blue-800">Parents</li></a>
                    <a href="/user/show-class"><li class="px-4 py-2 hover:bg-blue-800">Class</li></a>
                    <a href="/user/show-subject"><li class="px-4 py-2 hover:bg-blue-800">Subject</li></a>
                    <a href="/user/attendance"><li class="px-4 py-2 hover:bg-blue-800">Attendance</li></a>
                    <a href="/user/show-notice"><li class="px-4 py-2 hover:bg-blue-800">Notice</li></a>
                    <a href="/user/show-message"><li class="px-4 py-2 hover:bg-blue-800">Message</li></a>
                    <a href="/user/show-library"><li class="px-4 py-2 hover:bg-blue-800">Library</li></a>
                    <%-- /user/account/${user.userId }/show" --%>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <div class="flex-1 flex flex-col">
            <!-- Top Navbar -->
            <header class="flex items-center justify-between bg-white shadow p-4">
                <h1 class="text-xl font-semibold">Welcome To School Management System</h1>
                <!-- <input type="text" placeholder="Search Here ..." class="border rounded p-2">
 -->                <div class="flex items-center space-x-4">
                    <span>Hi! ${classes.teacher_Name}</span>
                   <!--  <img src="img/image.jpg" alt="Admin" class="w-10 h-10 rounded-full"> -->
                </div>
            </header>

            <!-- Student Details Section -->
            <main class="p-6 bg-gray-50 m-4 rounded-xl shadow-md">
                <div class="flex space-x-6">
               <%--  <h2 class="text-1xl font-bold text-blue-800 mb-2">${student.firstName} ${student.lastName}</h2> --%>
                     <div class="flex-shrink-0">
                     <%-- <h2 class="text-1xl font-bold text-blue-800 mb-6">Details - ${classes.firstName} ${classes.lastName}</h2>
                        <img src="<c:url value='/img/${classes.image}'/>" class="my_profile_picture"> --%>
                        <h2 class="text-1xl font-bold text-blue-800 mb-6">Class Details - ${teacher.firstName} ${teacher.secondName}</h2>
                         <img src="<c:url value='/img/${teacher.image}'/>" class="my_profile_picture">
                    </div>
                    <div class="flex-1">
                        
                       <!--  <p class="text-gray-600">Student ID: <strong>STUDENT#${student.id}</strong></p> -->

                        <div class="mt-4 ml-4 space-y-6">
                            <div>
                                <h3 class="text-xl font-semibold text-blue-700 border-b-1 border-blue-500 pb-1 mb-2">Personal Information</h3>
                                <ul class="space-y-2 text-gray-700">
                                    <li><strong>Teacher Name:</strong> ${classes.teacher_Name}</li>
                                    <li><strong>Class Name:</strong> ${classes.class_Name}</li>
                                   <%--  <li><strong>Religion:</strong> ${classes.religion}</li>
                                    <li><strong>Father's Occupation:</strong> ${classes.fatherOccupation}</li> --%>
                                </ul>
                            </div>

                            <div>
                                <h3 class="text-xl font-semibold text-blue-700 border-b-1 border-blue-500 pb-1 mb-2">Academic Information</h3>
                                <ul class="space-y-2 text-gray-700">
                                    <li><strong>Gender:</strong> ${classes.gender}</li>
                                    <li><strong>Subject:</strong> ${classes.subject}</li>
                                    <li><strong>Section:</strong> ${classes.section}</li>
                                </ul>
                            </div>

                            <div>
                                <h3 class="text-xl font-semibold text-blue-700 border-b-1 border-blue-500 pb-1 mb-2">Contact Information</h3>
                                <ul class="space-y-2 text-gray-700">
                                    <li><strong>Email:</strong> ${classes.email}</li>
                                    <li><strong>Time:</strong> ${classes.time}</li>
                                    <li><strong>Date:</strong> ${classes.date}</li>
                                    <li><strong>Phone:</strong> ${classes.phone}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>

</html>
