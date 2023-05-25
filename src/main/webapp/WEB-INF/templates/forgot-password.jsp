<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>HNT Dental - Forgot Password</title>
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
                        <h4 class="text-center">Recover Account</h4>
                        <form class="login-form mt-4">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p class="text-muted">Please enter your email address. You will receive a link to
                                        create a new password via email.</p>
                                    <div class="mb-3">
                                        <label class="form-label">Email address <span
                                                class="text-danger">*</span></label>
                                        <input type="email" class="form-control" placeholder="Enter Your Email Address"
                                               name="email" required="">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="d-grid">
                                        <button class="btn btn-primary">Send</button>
                                    </div>
                                </div>
                                <div class="mx-auto">
                                    <p class="mb-0 mt-3"><small class="text-dark me-2">Remember your password ?</small>
                                        <a href="${pageContext.request.contextPath}/auth/login"
                                           class="text-dark h6 mb-0">Sign in</a></p>
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
<script src="${pageContext.request.contextPath}/static/js/auth/auth_forgot_password.js"></script>
</body>
</html>