<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 5/20/2023
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8" />
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
    <!-- favicon -->
    <link rel="shortcut icon" href="https://shreethemes.in/doctris/layouts/assets/images/favicon.ico">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" crossorigin="anonymous">
</head>

<body>
<!-- Loader -->
<div id="preloader">
    <div id="status">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
</div>
<!-- Loader -->

<div class="back-to-home rounded d-none d-sm-block">
    <a href="index.html" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
</div>

<!-- Hero Start -->
<section class="bg-home d-flex bg-light align-items-center" style="background: url('../assets/images/bg/bg-lines-one.png') center;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-8">
                <img src="../assets/images/logo-dark.png" height="22" class="mx-auto d-block" alt="">
                <div class="card login-page shadow mt-4 rounded border-0">
                    <div class="card-body">
                        <h4 class="text-center">Sign In</h4>
                        <form action="https://shreethemes.in/doctris/layouts/landing/doctor-dashboard.html" class="login-form mt-4">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label">Your Email <span class="text-danger">*</span></label>
                                        <input type="email" class="form-control" placeholder="Email" name="email" required="">
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label">Password <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" placeholder="Password" required="">
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="d-flex justify-content-between">
                                        <div class="mb-3">
                                            <div class="form-check">
                                                <input class="form-check-input align-middle" type="checkbox" value="" id="remember-check">
                                                <label class="form-check-label" for="remember-check">Remember me</label>
                                            </div>
                                        </div>
                                        <a href="forgot-password.html" class="text-dark h6 mb-0">Forgot password ?</a>
                                    </div>
                                </div>
                                <div class="col-lg-12 mb-0">
                                    <div class="d-grid">
                                        <button class="btn btn-primary">Sign in</button>
                                    </div>
                                </div>
                                <div class="col-12 text-center">
                                    <p class="mb-0 mt-3"><small class="text-dark me-2">Don't have an account ?</small> <a href="signup.html" class="text-dark fw-bold">Sign Up</a></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>

</html>