<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Student Fees</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">

    <div class="max-w-lg mx-auto bg-white shadow-md rounded-lg p-6">
        <h2 class="text-2xl font-bold mb-4">Student Fees Details</h2>

        <table class="w-full border-collapse border border-gray-300 mb-4">
            <tr class="bg-gray-200">
                <th class="border p-2">Total Fees</th>
                <th class="border p-2">Paid Fees</th>
                <th class="border p-2">Due Fees</th>
                <th class="border p-2">Status</th>
            </tr>
            <tr>
                <td class="border p-2">${totalFees}</td>
                <td class="border p-2">${paidFees}</td>
                <td class="border p-2">${dueFees}</td>
                <td class="border p-2">
                    <c:choose>
                        <c:when test="${dueFees == 0}">Paid</c:when>
                        <c:otherwise>Due</c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </table>

        <!-- Payment Form (Only Show if Due Fees > 0) -->
        <c:if test="${dueFees > 0}">
            <h3 class="text-lg font-semibold">Make Payment</h3>
            <form action="${pageContext.request.contextPath}/fees/pay" method="post" class="mt-4">
                <input type="hidden" name="studentId" value="${studentId}">
                <input type="number" name="amountPaid" placeholder="Enter amount" required 
                       class="border border-gray-400 p-2 rounded w-full">
                <button type="submit" class="bg-blue-500 text-white p-2 mt-2 w-full rounded hover:bg-blue-700">
                    Pay Now
                </button>
            </form>
        </c:if>

        <!-- Display Message -->
        <c:if test="${not empty message}">
            <p class="mt-4 text-green-600 font-semibold">${message}</p>
        </c:if>
    </div>

</body>
</html>