<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
        <style>
	body {
    position: relative;
    height: 100vh;
    margin: 0;
    overflow: hidden; /* Prevents scrolling */
}

body::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url('${pageContext.request.contextPath}/img/Pencil.jpg') 
                no-repeat center center fixed;
    background-size: cover;
    filter: blur(5px); /* Apply blur effect */
    z-index: -1; /* Send it to the background */
}

.container {
    position: relative;
    z-index: 1; /* Keeps content above the blurred background */
}

.card {
    background: rgba(160, 160, 160, 0.8); /* Transparent white */
    backdrop-filter: blur(10px); /* Blur effect for the card */
}
	

</style>

</head>

<body class="">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-12">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                           <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
                            <img src="${pageContext.request.contextPath}/img/cottonbro.jpg" alt="Register Image" class="col-lg-6 d-none d-lg-block">
                    
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4 mt-4">Welcome Back!</h1>
                                    </div>
                                    
                                   <!--  <form action="/index" method="post" class="user"> -->
                                      <form action="<c:url value='/dashboard' />" method="post">
                                             <c:if test="${param.error != null}">
									            <div class="alert alert-danger">
									                Invalid credentials. Please try again.
									            </div>
									        </c:if>
									        <c:if test="${param.logout != null}">
									            <div class="alert alert-success">
									                Logout successful.
									            </div>
									        </c:if>  
                                        <div class="form-group">
                                            <input type="email" name="username" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter Email Address...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <!-- <a class="btn btn-primary btn-user btn-block" type="submit">
                                            Login
                                        </a> -->
                                        <button class="btn btn-primary btn-user btn-block" type="submit">Login</button>
                                        <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="signup">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>