<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${title}</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('${pageContext.request.contextPath}/img/Pencil.jpg') no-repeat center center fixed;
            background-size: cover;
            filter: blur(5px);
            z-index: -1;
        }

        .card {
            background: rgba(160, 160, 160, 0.8);
            backdrop-filter: blur(10px);
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg mt-3">
            <div class="card-body p-0">
                <div class="row">
                    <img src="${pageContext.request.contextPath}/img/room.jpg" alt="Register Image" class="col-lg-6 d-none d-lg-block">
                    <div class="col-lg-6">
                        <div class="p-5">
                            <c:if test="${not empty sessionScope.message}">
                                <div class="text-center ${sessionScope.message.type}" role="alert">
                                    <p><c:out value="${sessionScope.message.content}" /></p>
                                </div>
                                <c:remove var="message" scope="session"/>
                            </c:if>

                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form novalidate action="/do_signup" method="post" class="user" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="userName" class="form-control form-control-user" placeholder="User Name" value="${user.userName}" />
                                        <c:if test="${not empty userNameErrors}">
                                            <span class="text-danger">${userNameErrors}</span>
                                        </c:if>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" name="password" class="form-control form-control-user" placeholder="Password" value="${user.password}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control form-control-user" placeholder="Email Address" value="${user.email}" />
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3">
                                        <select name="userType" class="form-control">
                                            <option value="" disabled ${empty user.userType ? 'selected' : ''}>Select Type</option>
                                            <option value="Student" ${user.userType == 'Student' ? 'selected' : ''}>Student</option>
                                            <option value="Teacher" ${user.userType == 'Teacher' ? 'selected' : ''}>Teacher</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <select name="gender" class="form-control">
                                            <option value="" disabled ${empty user.gender ? 'selected' : ''}>Select Gender</option>
                                            <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                                            <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" name="schoolCode" class="form-control form-control-user" placeholder="Type School Code" value="${user.schoolCode}" />
                                    </div>
                                     <div class="col-sm-6 mb-3">
                                        <input type="text" name="address" class="form-control form-control-user" placeholder="Address" value="${user.address}" />
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" name="phone" class="form-control form-control-user" placeholder="Enter your phone" value="${user.phone}" />
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <select name="language" class="form-control">
                                            <option value="" disabled ${empty user.language ? 'selected' : ''}>Select Language</option>
                                            <option value="English" ${user.language == 'English' ? 'selected' : ''}>English</option>
                                            <option value="Marathi" ${user.language == 'Marathi' ? 'selected' : ''}>Marathi</option>
                                            <option value="Hindi" ${user.language == 'Hindi' ? 'selected' : ''}>Hindi</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Upload Photo</label>
                                        <input type="file" name="imageFile">
                                    </div>
                                </div>
                                <button class="btn btn-primary btn-user btn-block" type="submit">Sign Up</button>
                                <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="signin">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
</body>

</html>
