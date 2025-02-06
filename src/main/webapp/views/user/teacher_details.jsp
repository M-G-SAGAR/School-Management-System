<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Details</title>
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
                    <li class="px-4 py-2 hover:bg-blue-800">Dashboard</li>
                    <li class="px-4 py-2 hover:bg-blue-800">Teachers
                        <ul class="ml-4">
                            <li class="px-2 py-1 hover:bg-blue-700">All Teachers</li>
                            <li class="px-2 py-1 bg-blue-700">Teacher Details</li>
                            <li class="px-2 py-1 hover:bg-blue-700">Admit Form</li>
                            <li class="px-2 py-1 hover:bg-blue-700">Teacher Promotion</li>
                        </ul>
                    </li>
                    <li class="px-4 py-2 hover:bg-blue-800">Teachers</li>
                    <li class="px-4 py-2 hover:bg-blue-800">Parents</li>
                    <li class="px-4 py-2 hover:bg-blue-800">Library</li>
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
                    <span>Hi! ${teacher.firstName}</span>
                   <!--  <img src="img/image.jpg" alt="Admin" class="w-10 h-10 rounded-full"> -->
                </div>
            </header>

            <!-- teacher Details Section -->
            <main class="p-6 bg-gray-50 m-4 rounded-xl shadow-md">
                <div class="flex space-x-6">
               <%--  <h2 class="text-1xl font-bold text-blue-800 mb-2">${teacher.firstName} ${teacher.lastName}</h2> --%>
                    <div class="flex-shrink-0">
                     <h2 class="text-1xl font-bold text-blue-800 mb-6">Details - ${teacher.firstName} ${teacher.secondName}</h2>
                         <img src="<c:url value='/img/${teacher.image}'/>" class="my_profile_picture">
                     </div>
                    <div class="flex-1">
                        
                     

                        <div class="mt-4 ml-4 space-y-6">
                            <div>
                                <h3 class="text-xl font-semibold text-blue-700 border-b-1 border-blue-500 pb-1 mb-2">Personal Information</h3>
                                <ul class="space-y-2 text-gray-700">
                                	<li><strong>First Name:</strong> ${teacher.firstName}</li>
                                	<li><strong>Last Name:</strong> ${teacher.secondName}</li>
                                    <li><strong>Gender:</strong> ${teacher.gender}</li>
                                    <li><strong>Date of Birth:</strong> ${teacher.dob}</li> 
                                   <li><strong>Section:</strong> ${teacher.section}</li>
                                </ul>
                            </div>

                            <div>
                                <h3 class="text-xl font-semibold text-blue-700 border-b-1 border-blue-500 pb-1 mb-2">Academic Information</h3>
                                <ul class="space-y-2 text-gray-700">
                                   <%--  <li><strong>Roll Number:</strong> ${teacher.rollNumber}</li> --%>
                                    <li><strong>Admission Date:</strong> 05/04/2016</li>
                                    <li><strong>Class:</strong> ${teacher.className}</li> 
                                     <li><strong>Religion:</strong> ${teacher.religion}</li>
                                    <li><strong>Teacher Id's:</strong> ${teacher.idNumber}</li>
                                </ul>
                            </div>

                            <div>
                                <h3 class="text-xl font-semibold text-blue-700 border-b-1 border-blue-500 pb-1 mb-2">Contact Information</h3>
                                <ul class="space-y-2 text-gray-700">
                                    <li><strong>Email:</strong> ${teacher.email}</li>
                                    <li><strong>Contact:</strong> ${teacher.phone}</li>
                                    <li><strong>Phone:</strong> ${teacher.subject}</li>
                                   <li><strong>Address:</strong> ${teacher.address}</li>
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
