<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
</html>
