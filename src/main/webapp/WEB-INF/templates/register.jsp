<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 5/23/2023
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>HNT Dental - Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" class="theme-opt" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/libs/remixicon/fonts/remixicon.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/libs/@iconscout/unicons/css/line.css" type="text/css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/style.min.css" class="theme-opt" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/styles.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<div class="back-to-home rounded d-none d-sm-block">
    <a href="/home" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
</div>

<section class="bg-home d-flex bg-light align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-8">
                <div class="card login-page shadow mt-4 rounded border-0">
                    <div class="card-body">
                        <h4 class="text-center">Create your account</h4>
                        <p id="content" style="color: red; align-content: center;"></p>
                        <form class="register-form mt-4" id="register">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label" for="fullName">Full name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="fullName" placeholder="Full Name"
                                               name="fullName">
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label" for="phone">Phone <span class="text-danger">*</span></label>
                                        <input type="number" class="form-control" id="phone" placeholder="Phone"
                                               name="phone">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label" for="dob">Date of birth <span class="text-danger">*</span></label>
                                        <input type="date" class="form-control" placeholder="DateOfBirth" id="dob"
                                               name="dob">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label" for="address">Address <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" placeholder="Address" id="address"
                                               name="address">
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <label class="form-label" for="email">Email <span class="text-danger">*</span></label>
                                    <div class="mb-3">
                                        <input type="email" class="form-control" placeholder="Email" id="email"
                                               name="email">
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label" for="password">Mật khẩu <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" placeholder="Password" id="password"
                                               name="password">
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label" for="confirmPassword">Xác nhận mật khẩu <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" placeholder="Password" id="confirmPassword"
                                               name="confirmPassword">
                                    </div>
                                </div>

                                <div class="col-lg-12 mb-0">
                                    <div class="d-grid">
                                        <button class="btn btn-primary" id="btn-register">Create Account</button>
                                    </div>
                                </div>

                                <div class="col-12 text-center">
                                    <p class="mb-0 mt-3"><small class="text-dark me-2">Already have an account ?</small> <a
                                            href="/auth/login" class="text-dark fw-bold">Sign in</a></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/auth/auth_register.js"></script>

</body>

</html>