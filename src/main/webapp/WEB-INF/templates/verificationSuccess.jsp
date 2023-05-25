<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 5/25/2023
  Time: 6:48 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8" />
  <title>Doctris - Doctor Appointment Booking System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Premium Bootstrap 5 Landing Page Template" />
  <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
  <meta name="author" content="Shreethemes" />
  <meta name="email" content="support@shreethemes.in" />
  <meta name="website" content="https://shreethemes.in" />
  <meta name="Version" content="v1.4.0" />
  <!-- favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.ico">

  <!-- Css -->
  <!-- Bootstrap Css -->
  <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" class="theme-opt" rel="stylesheet" type="text/css" />
  <!-- Icons Css -->
  <link href="${pageContext.request.contextPath}/static/css/icons.min.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/static/libs/remixicon/fonts/remixicon.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/static/libs/@iconscout/unicons/css/line.css" type="text/css" rel="stylesheet" />
  <!-- Style Css-->
  <link href="${pageContext.request.contextPath}/static/css/style.min.css" class="theme-opt" rel="stylesheet" type="text/css" />

</head>

<body>
<!-- Loader -->
<!-- <div id="preloader">
    <div id="status">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
</div> -->
<!-- Loader -->

<div class="back-to-home rounded d-none d-sm-block">
  <a href="index.html" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
</div>

<!-- Hero Start -->
<section class="bg-home d-flex bg-light align-items-center" style="background: url('${pageContext.request.contextPath}/static/images/bg/bg-lines-one.png') center;">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-7 col-md-10 text-center">
        <img src="${pageContext.request.contextPath}/static/images/bg/correct.png" class="img-fluid w-25 h-50 pb-4" alt="">
        <h3 class="mb-4">Xác thực thành công</h3>
        <p class="text-muted para-desc mx-auto">Chúc mừng bạn đã xác thực thành công! Hãy đăng nhập để bắt đầu đặt lịch ngay thôi nào.</p>
        <a href="index.html" class="btn btn-primary mt-2">Đăng nhập</a>
      </div><!--end col-->
    </div><!--end row-->
  </div><!--end container-->
</section><!--end section-->
<!-- Hero End -->

<!-- javascript -->
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<!-- Main Js -->
<!-- JAVASCRIPT -->
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>

</body>

</html>