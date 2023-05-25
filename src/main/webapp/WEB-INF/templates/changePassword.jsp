<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 5/24/2023
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>HNT Dental - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health"/>
    <meta name="Version" content="v1.4.0"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.ico">
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

<section class="bg-home d-flex bg-light align-items-center"
         style="background: url('${pageContext.request.contextPath}/static/images/bg/bg-lines-one.png') center;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-8">
                <div class="card login-page shadow mt-4 rounded border-0">
                    <div class="card-body">
                        <h4 class="text-center">Đổi mật khẩu</h4>
                        <p id="content" style="color: red; align-content: center;"></p>
                        <form class="login-form mt-4" id="login">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label" >Mật khẩu cũ <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" placeholder="OldPassword"
                                               name="oldPassword">
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label">Mật khẩu mới <span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" placeholder="NewPassword"
                                               name="newPassword">
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label">Xác nhận lại mật khẩu<span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" placeholder="RePassword"
                                               name="rePassword">
                                    </div>
                                </div>

                                <div class="col-lg-12 mb-0">
                                    <div class="d-grid">
                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                    </div>
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
<script src="${pageContext.request.contextPath}/static/js/auth/auth-login.js"></script>

</body>

</html>
