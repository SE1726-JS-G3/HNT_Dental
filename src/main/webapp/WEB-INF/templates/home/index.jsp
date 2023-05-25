<%--
  Created by IntelliJ IDEA.
  User: hungkv
  Date: 5/25/2023
  Time: 9:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!doctype html>
<html lang="en">

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
    <link href="${pageContext.request.contextPath}/static/libs/tobii/css/tobii.min.css" rel="stylesheet" type="text/css" />
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
<div id="preloader">
    <div id="status">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
</div>

<!-- Navbar STart -->
<header id="topnav" class="defaultscroll sticky">
    <div class="container">

        <div class="menu-extras">
            <div class="menu-item">
                <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                    <div class="lines">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </a>
            </div>
        </div>

        <ul class="dropdowns list-inline mb-0">
            <li class="list-inline-item mb-0">
                <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                    <div class="btn btn-icon btn-pills btn-primary"><i data-feather="settings" class="fea icon-sm"></i></div>
                </a>
            </li>

            <li class="list-inline-item mb-0 ms-1">
                <a href="javascript:void(0)" class="btn btn-icon btn-pills btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                    <i class="uil uil-search"></i>
                </a>
            </li>

            <li class="list-inline-item mb-0 ms-1">
                <div class="dropdown dropdown-primary">
                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${pageContext.request.contextPath}/static/images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                    <div class="dropdown-menu dd-menu dropdown-menu-end shadow border-0 mt-3 py-3" style="min-width: 200px;">
                        <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                            <img src="${pageContext.request.contextPath}/static/images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                            <div class="flex-1 ms-2">
                                <span class="d-block mb-1">Calvin Carlo</span>
                                <small class="text-muted">Orthopedic</small>
                            </div>
                        </a>
                        <a class="dropdown-item text-dark" href="doctor-dashboard.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a>
                        <a class="dropdown-item text-dark" href="doctor-profile-setting.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                        <div class="dropdown-divider border-top"></div>
                        <a class="dropdown-item text-dark" href="login.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                    </div>
                </div>
            </li>
        </ul>
        <!-- Start Dropdown -->

        <div id="navigation">
            <ul class="navigation-menu nav-left">
                <li class="has-submenu parent-menu-item">
                    <a href="javascript:void(0)">Home</a><span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="index.html" class="sub-menu-item">Index One</a></li>
                        <li><a href="index-two.html" class="sub-menu-item">Index Two</a></li>
                        <li><a href="index-three.html" class="sub-menu-item">Index Three</a></li>
                    </ul>
                </li>

                <li class="has-submenu parent-parent-menu-item">
                    <a href="javascript:void(0)">Doctors</a><span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)" class="menu-item"> Dashboard </a><span class="submenu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="doctor-dashboard.html" class="sub-menu-item">Dashboard</a></li>
                                <li><a href="doctor-appointment.html" class="sub-menu-item">Appointment</a></li>
                                <li><a href="patient-list.html" class="sub-menu-item">Patients</a></li>
                                <li><a href="doctor-schedule.html" class="sub-menu-item">Schedule Timing</a></li>
                                <li><a href="invoices.html" class="sub-menu-item">Invoices</a></li>
                                <li><a href="patient-review.html" class="sub-menu-item">Reviews</a></li>
                                <li><a href="doctor-messages.html" class="sub-menu-item">Messages</a></li>
                                <li><a href="doctor-profile.html" class="sub-menu-item">Profile</a></li>
                                <li><a href="doctor-profile-setting.html" class="sub-menu-item">Profile Settings</a></li>
                                <li><a href="doctor-chat.html" class="sub-menu-item">Chat</a></li>
                                <li><a href="login.html" class="sub-menu-item">Login</a></li>
                                <li><a href="signup.html" class="sub-menu-item">Sign Up</a></li>
                                <li><a href="forgot-password.html" class="sub-menu-item">Forgot Password</a></li>
                            </ul>
                        </li>
                        <li><a href="doctor-team-one.html" class="sub-menu-item">Doctors One</a></li>
                        <li><a href="doctor-team-two.html" class="sub-menu-item">Doctors Two</a></li>
                        <li><a href="doctor-team-three.html" class="sub-menu-item">Doctors Three</a></li>
                    </ul>
                </li>

                <li class="has-submenu parent-menu-item">
                    <a href="javascript:void(0)">Patients</a><span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="patient-dashboard.html" class="sub-menu-item">Dashboard</a></li>
                        <li><a href="patient-profile.html" class="sub-menu-item">Profile</a></li>
                        <li><a href="booking-appointment.html" class="sub-menu-item">Book Appointment</a></li>
                        <li><a href="patient-invoice.html" class="sub-menu-item">Invoice</a></li>
                    </ul>
                </li>

                <li class="has-submenu parent-menu-item">
                    <a href="javascript:void(0)">Pharmacy</a><span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="pharmacy.html" class="sub-menu-item">Pharmacy</a></li>
                        <li><a href="pharmacy-shop.html" class="sub-menu-item">Shop</a></li>
                        <li><a href="pharmacy-product-detail.html" class="sub-menu-item">Medicine Detail</a></li>
                        <li><a href="pharmacy-shop-cart.html" class="sub-menu-item">Shop Cart</a></li>
                        <li><a href="pharmacy-checkout.html" class="sub-menu-item">Checkout</a></li>
                        <li><a href="pharmacy-account.html" class="sub-menu-item">Account</a></li>
                    </ul>
                </li>

                <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Pages</a><span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="aboutus.html" class="sub-menu-item"> About Us</a></li>
                        <li><a href="departments.html" class="sub-menu-item">Departments</a></li>
                        <li><a href="faqs.html" class="sub-menu-item">FAQs</a></li>
                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)" class="menu-item"> Blogs </a><span class="submenu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="blogs.html" class="sub-menu-item">Blogs</a></li>
                                <li><a href="blog-detail.html" class="sub-menu-item">Blog Details</a></li>
                            </ul>
                        </li>
                        <li><a href="terms.html" class="sub-menu-item">Terms & Policy</a></li>
                        <li><a href="privacy.html" class="sub-menu-item">Privacy Policy</a></li>
                        <li><a href="error.html" class="sub-menu-item">404 !</a></li>
                        <li><a href="contact.html" class="sub-menu-item">Contact</a></li>
                    </ul>
                </li>
                <li><a href="../admin/index.html" class="sub-menu-item" target="_blank">Admin</a></li>
            </ul><!--end navigation menu-->
        </div><!--end navigation-->
    </div><!--end container-->
</header><!--end header-->
<!-- Navbar End -->

<!-- Start Hero -->
<section class="bg-half-170 pb-0 d-table w-100">
    <div class="container">
        <div class="row mt-5 mt-sm-0 align-items-center">
            <div class="col-md-6">
                <div class="heading-title">
                    <h4 class="heading mb-3">Find Best Doctor</h4>
                    <p class="para-desc text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment or a simple consultation.</p>
                </div>
                <div class="subcribe-form mt-4">
                    <form class="ms-0" style="max-width: 550px;">
                        <div class="mb-2">
                            <input type="text" id="name" name="name" class="border rounded-pill" required="" placeholder="Doctor name...">
                            <button type="submit" class="btn btn-pills btn-primary"><i class="ri-search-line align-middle me-1"></i> Search</button>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <p class="text-muted mb-0"><b>Note:</b> Please search best doctors here,</p>
                            </div><!--end col-->
                        </div><!--end row-->
                    </form>
                </div>
            </div><!--end col-->

            <div class="col-md-6 mt-4 pt-2 mt-sm-0 pt-sm-0">
                <img src="${pageContext.request.contextPath}/static/images/hero.png" class="img-fluid" alt="">
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section><!--end section-->
<!-- End Hero -->

<!-- Partners start -->
<section class="py-4 bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="${pageContext.request.contextPath}/static/images/client/amazon.png" class="avatar avatar-client" alt="">
            </div><!--end col-->

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="${pageContext.request.contextPath}/static/images/client/google.png" class="avatar avatar-client" alt="">
            </div><!--end col-->

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="${pageContext.request.contextPath}/static/images/client/lenovo.png" class="avatar avatar-client" alt="">
            </div><!--end col-->

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="${pageContext.request.contextPath}/static/images/client/paypal.png" class="avatar avatar-client" alt="">
            </div><!--end col-->

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="${pageContext.request.contextPath}/static/images/client/shopify.png" class="avatar avatar-client" alt="">
            </div><!--end col-->

            <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                <img src="${pageContext.request.contextPath}/static/images/client/spotify.png" class="avatar avatar-client" alt="">
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section><!--end section-->
<!-- Partners End -->

<!-- Start -->
<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="section-title text-center mb-4 pb-2">
                    <h4 class="title mb-4">Explore By Categories</h4>
                    <p class="text-muted mx-auto para-desc mb-0">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                </div>
            </div><!--end col-->
        </div><!--end row-->

        <div class="row justify-content-center">
            <div class="col-xl col-md-4 col-12 mt-4 pt-2">
                <div class="card features feature-primary border-0 p-4 rounded-md shadow">
                    <div class="icon text-center rounded-lg">
                        <i class="uil uil-user-md h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Doctors</a>
                        <p class="text-muted mt-3">Due to its wide spread use as filler text</p>
                        <a href="departments.html" class="link">Find here <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl col-md-4 col-12 mt-4 pt-2">
                <div class="card features feature-primary border-0 p-4 rounded-md shadow">
                    <div class="icon text-center rounded-lg">
                        <i class="uil uil-capsule h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Clinics</a>
                        <p class="text-muted mt-3">Due to its wide spread use as filler text</p>
                        <a href="departments.html" class="link">Find here <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl col-md-4 col-12 mt-4 pt-2">
                <div class="card features feature-primary border-0 p-4 rounded-md shadow">
                    <div class="icon text-center rounded-lg">
                        <i class="uil uil-microscope h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Labs</a>
                        <p class="text-muted mt-3">Due to its wide spread use as filler text</p>
                        <a href="departments.html" class="link">Find here <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl col-md-4 col-12 mt-4 pt-2">
                <div class="card features feature-primary border-0 p-4 rounded-md shadow">
                    <div class="icon text-center rounded-lg">
                        <i class="uil uil-ambulance h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Emergency</a>
                        <p class="text-muted mt-3">Due to its wide spread use as filler text</p>
                        <a href="departments.html" class="link">Find here <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl col-md-4 col-12 mt-4 pt-2">
                <div class="card features feature-primary border-0 p-4 rounded-md shadow">
                    <div class="icon text-center rounded-lg">
                        <i class="uil uil-shield-plus h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Insurance</a>
                        <p class="text-muted mt-3">Due to its wide spread use as filler text</p>
                        <a href="departments.html" class="link">Find here <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->

    <div class="container mt-100 mt-60">
        <div class="row align-items-center">
            <div class="col-lg-7 col-md-6">
                <div class="section-title me-lg-5">
                    <span class="badge rounded-pill bg-soft-primary">About Doctris</span>
                    <h4 class="title mt-3 mb-4">Good Services And Better <br> Health By Our Specialists</h4>
                    <p class="para-desc text-muted">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                    <p class="para-desc text-muted">The most well-known dummy text is the 'Lorem Ipsum', which is said to have originated in the 16th century. Lorem Ipsum is composed in a pseudo-Latin language which more or less corresponds to 'proper' Latin. It contains a series of real Latin words.</p>
                    <div class="mt-4">
                        <a href="aboutus.html" class="btn btn-soft-primary">Read More</a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-lg-5 col-md-6 mt-4 pt-2 mt-sm-0 pt-sm-0">
                <div class="position-relative">
                    <img src="${pageContext.request.contextPath}/static/images/about/about-2.png" class="img-fluid" alt="">
                    <div class="play-icon">
                        <a href="#!" data-type="youtube" data-id="yba7hPeTSjk" class="play-btn lightbox video-play-icon">
                            <i class="mdi mdi-play text-primary rounded-circle shadow"></i>
                        </a>
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section><!--end section-->
<!-- End -->

<!-- Cta Start -->
<section class="section" style="background: url('${pageContext.request.contextPath}/static/images/cta.jpg') center center;">
    <div class="bg-overlay bg-overlay-dark" style="opacity: 0.3;"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-5 offset-lg-7 col-md-7 offset-md-5">
                <div class="features feature-bg-primary d-flex card flex-row p-4 rounded-md shadow position-relative overflow-hidden">
                    <i class="uil uil-briefcase icons h2 mb-0 text-primary"></i>
                    <div class="ms-3">
                        <h5 class="titles">Our Mission</h5>
                        <p class="text-muted para mb-0">The most well-known dummy text is the 'Lorem Ipsum', which is said to have originated in the 16th century.</p>
                    </div>
                    <div class="big-icon">
                        <i class="uil uil-briefcase"></i>
                    </div>
                </div>

                <div class="features feature-bg-primary d-flex card flex-row p-4 rounded-md shadow position-relative overflow-hidden mt-4">
                    <i class="uil uil-airplay icons h2 mb-0 text-primary"></i>
                    <div class="ms-3">
                        <h5 class="titles">Our Vision</h5>
                        <p class="text-muted para mb-0">The most well-known dummy text is the 'Lorem Ipsum', which is said to have originated in the 16th century.</p>
                    </div>
                    <div class="big-icon">
                        <i class="uil uil-airplay"></i>
                    </div>
                </div>

                <div class="features feature-bg-primary d-flex card flex-row p-4 rounded-md shadow position-relative overflow-hidden mt-4">
                    <i class="uil uil-flip-v icons h2 mb-0 text-primary"></i>
                    <div class="ms-3">
                        <h5 class="titles">Who We Are ?</h5>
                        <p class="text-muted para mb-0">The most well-known dummy text is the 'Lorem Ipsum', which is said to have originated in the 16th century.</p>
                    </div>
                    <div class="big-icon">
                        <i class="uil uil-flip-v"></i>
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section><!--end section-->
<!-- Cta End -->

<!-- Start -->
<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="section-title text-center mb-4 pb-2">
                    <span class="badge rounded-pill bg-soft-primary">Find Doctors</span>
                    <h4 class="title mt-3 mb-4">Find Your Specialists</h4>
                    <p class="text-muted mx-auto para-desc mb-0">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                </div>
            </div><!--end col-->
        </div><!--end row-->

        <div class="row align-items-center">
            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-person position-relative overflow-hidden">
                        <img src="${pageContext.request.contextPath}/static/images/doctors/01.jpg" class="img-fluid" alt="">
                        <ul class="list-unstyled team-like">
                            <li><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <a href="doctor-team-two.html" class="title text-dark h5 d-block mb-0">Calvin Carlo</a>
                        <small class="text-muted speciality">Eye Care</small>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <p class="text-muted mb-0">5 Star</p>
                        </div>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="d-flex">
                                <i class="ri-map-pin-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">63, PG Shustoke, UK</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-time-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">Mon: 2:00PM - 6:00PM</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-money-dollar-circle-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">$ 75 USD / Visit</small>
                            </li>
                        </ul>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-person position-relative overflow-hidden">
                        <img src="${pageContext.request.contextPath}/static/images/doctors/02.jpg" class="img-fluid" alt="">
                        <ul class="list-unstyled team-like">
                            <li><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <a href="doctor-team-two.html" class="title text-dark h5 d-block mb-0">Cristino Murphy</a>
                        <small class="text-muted speciality">M.B.B.S, Gynecologist</small>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <p class="text-muted mb-0">5 Star</p>
                        </div>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="d-flex">
                                <i class="ri-map-pin-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">63, PG Shustoke, UK</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-time-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">Mon: 2:00PM - 6:00PM</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-money-dollar-circle-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">$ 75 USD / Visit</small>
                            </li>
                        </ul>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-person position-relative overflow-hidden">
                        <img src="${pageContext.request.contextPath}/static/images/doctors/03.jpg" class="img-fluid" alt="">
                        <ul class="list-unstyled team-like">
                            <li><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <a href="doctor-team-two.html" class="title text-dark h5 d-block mb-0">Alia Reddy</a>
                        <small class="text-muted speciality">M.B.B.S, Psychotherapist</small>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <p class="text-muted mb-0">5 Star</p>
                        </div>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="d-flex">
                                <i class="ri-map-pin-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">63, PG Shustoke, UK</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-time-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">Mon: 2:00PM - 6:00PM</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-money-dollar-circle-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">$ 75 USD / Visit</small>
                            </li>
                        </ul>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-person position-relative overflow-hidden">
                        <img src="${pageContext.request.contextPath}/static/images/doctors/04.jpg" class="img-fluid" alt="">
                        <ul class="list-unstyled team-like">
                            <li><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <a href="doctor-team-two.html" class="title text-dark h5 d-block mb-0">Toni Kovar</a>
                        <small class="text-muted speciality">M.B.B.S, Orthopedic</small>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <p class="text-muted mb-0">5 Star</p>
                        </div>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="d-flex">
                                <i class="ri-map-pin-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">63, PG Shustoke, UK</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-time-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">Mon: 2:00PM - 6:00PM</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-money-dollar-circle-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">$ 75 USD / Visit</small>
                            </li>
                        </ul>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-person position-relative overflow-hidden">
                        <img src="${pageContext.request.contextPath}/static/images/doctors/05.jpg" class="img-fluid" alt="">
                        <ul class="list-unstyled team-like">
                            <li><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <a href="doctor-team-two.html" class="title text-dark h5 d-block mb-0">Jessica McFarlane</a>
                        <small class="text-muted speciality">M.B.B.S, Dentist</small>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <p class="text-muted mb-0">5 Star</p>
                        </div>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="d-flex">
                                <i class="ri-map-pin-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">63, PG Shustoke, UK</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-time-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">Mon: 2:00PM - 6:00PM</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-money-dollar-circle-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">$ 75 USD / Visit</small>
                            </li>
                        </ul>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-person position-relative overflow-hidden">
                        <img src="${pageContext.request.contextPath}/static/images/doctors/06.jpg" class="img-fluid" alt="">
                        <ul class="list-unstyled team-like">
                            <li><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <a href="doctor-team-two.html" class="title text-dark h5 d-block mb-0">Elsie Sherman</a>
                        <small class="text-muted speciality">M.B.B.S, Gastrologist</small>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <p class="text-muted mb-0">5 Star</p>
                        </div>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="d-flex">
                                <i class="ri-map-pin-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">63, PG Shustoke, UK</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-time-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">Mon: 2:00PM - 6:00PM</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-money-dollar-circle-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">$ 75 USD / Visit</small>
                            </li>
                        </ul>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-person position-relative overflow-hidden">
                        <img src="${pageContext.request.contextPath}/static/images/doctors/07.jpg" class="img-fluid" alt="">
                        <ul class="list-unstyled team-like">
                            <li><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <a href="doctor-team-two.html" class="title text-dark h5 d-block mb-0">Bertha Magers</a>
                        <small class="text-muted speciality">M.B.B.S, Urologist</small>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <p class="text-muted mb-0">5 Star</p>
                        </div>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="d-flex">
                                <i class="ri-map-pin-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">63, PG Shustoke, UK</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-time-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">Mon: 2:00PM - 6:00PM</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-money-dollar-circle-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">$ 75 USD / Visit</small>
                            </li>
                        </ul>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-person position-relative overflow-hidden">
                        <img src="${pageContext.request.contextPath}/static/images/doctors/08.jpg" class="img-fluid" alt="">
                        <ul class="list-unstyled team-like">
                            <li><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <a href="doctor-team-two.html" class="title text-dark h5 d-block mb-0">Louis Batey</a>
                        <small class="text-muted speciality">M.B.B.S, Neurologist</small>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <p class="text-muted mb-0">5 Star</p>
                        </div>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="d-flex">
                                <i class="ri-map-pin-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">63, PG Shustoke, UK</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-time-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">Mon: 2:00PM - 6:00PM</small>
                            </li>
                            <li class="d-flex mt-2">
                                <i class="ri-money-dollar-circle-line text-primary align-middle"></i>
                                <small class="text-muted ms-2">$ 75 USD / Visit</small>
                            </li>
                        </ul>
                        <ul class="list-unstyled mt-2 mb-0">
                            <li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2 list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->

    <div class="container mt-100 mt-60">
        <div class="row align-items-center">
            <div class="col-md-6 col-12">
                <div class="me-lg-5">
                    <img src="${pageContext.request.contextPath}/static/images/svg/vaccine-development-amico.svg" class="img-fluid" alt="">
                </div>
            </div><!--end col-->

            <div class="col-md-6 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item border rounded">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button border-0 bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
                                    aria-expanded="true" aria-controls="collapseOne">
                                How does it work ?
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse border-0 collapse show" aria-labelledby="headingOne"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body text-muted">
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item border rounded mt-2">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button border-0 bg-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                    aria-expanded="false" aria-controls="collapseTwo">
                                Do I need a designer to use Doctris ?
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse border-0 collapse" aria-labelledby="headingTwo"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body text-muted">
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item border rounded mt-2">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button border-0 bg-light collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                What do I need to do to start selling ?
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse border-0 collapse" aria-labelledby="headingThree"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body text-muted">
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item border rounded mt-2">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button border-0 bg-light collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                What happens when I receive an order ?
                            </button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse border-0 collapse" aria-labelledby="headingFour"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body text-muted">
                                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->

        <div class="row mt-4 pt-2 justify-content-center">
            <div class="col-12 text-center">
                <div class="section-title">
                    <h4 class="title mb-4">Have Question ? Get in touch!</h4>
                    <p class="text-muted para-desc mx-auto">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                    <a href="contact.html" class="btn btn-primary mt-4"><i class="mdi mdi-phone"></i> Contact us</a>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section><!--end section-->
<!-- End -->

<!-- Start -->
<footer class="">
    <div class="container">
        <div class="row">
            <div class="col-xl-5 col-lg-4 mb-0 mb-md-4 pb-0 pb-md-2">
                <a href="#" class="logo-footer">
                    <img src="${pageContext.request.contextPath}/static/images/logo-light.png" height="22" alt="">
                </a>
                <p class="mt-4 me-xl-5">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
            </div><!--end col-->

            <div class="col-xl-7 col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <h5 class="footer-head">Company</h5>
                        <ul class="list-unstyled footer-list mt-4">
                            <li><a href="aboutus.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> About us</a></li>
                            <li><a href="departments.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Services</a></li>
                            <li><a href="doctor-team-two.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Team</a></li>
                            <li><a href="blog-detail.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Project</a></li>
                            <li><a href="blogs.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Blog</a></li>
                            <li><a href="login.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Login</a></li>
                        </ul>
                    </div><!--end col-->

                    <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <h5 class="footer-head">Departments</h5>
                        <ul class="list-unstyled footer-list mt-4">
                            <li><a href="departments.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Eye Care</a></li>
                            <li><a href="departments.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Psychotherapy</a></li>
                            <li><a href="departments.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Dental Care</a></li>
                            <li><a href="departments.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Orthopedic</a></li>
                            <li><a href="departments.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Cardiology</a></li>
                            <li><a href="departments.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Gynecology</a></li>
                            <li><a href="departments.html" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Neurology</a></li>
                        </ul>
                    </div><!--end col-->

                    <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <h5 class="footer-head">Contact us</h5>
                        <ul class="list-unstyled footer-list mt-4">
                            <li class="d-flex align-items-center">
                                <i data-feather="mail" class="fea icon-sm text-foot align-middle"></i>
                                <a href="mailto:contact@example.com" class="text-foot ms-2">contact@example.com</a>
                            </li>

                            <li class="d-flex align-items-center">
                                <i data-feather="phone" class="fea icon-sm text-foot align-middle"></i>
                                <a href="tel:+152534-468-854" class="text-foot ms-2">+152 534-468-854</a>
                            </li>

                            <li class="d-flex align-items-center">
                                <i data-feather="map-pin" class="fea icon-sm text-foot align-middle"></i>
                                <a href="javascript:void(0)" class="video-play-icon text-foot ms-2">View on Google map</a>
                            </li>
                        </ul>

                        <ul class="list-unstyled social-icon footer-social mb-0 mt-4">
                            <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                            <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                            <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                            <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
                        </ul><!--end icon-->
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->

    <div class="container mt-5">
        <div class="pt-4 footer-bar">
            <div class="row align-items-center">
                <div class="col-sm-6">
                    <div class="text-sm-start text-center">
                        <p class="mb-0"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="https://shreethemes.in/" target="_blank" class="text-reset">Shreethemes</a>.</p>
                    </div>
                </div><!--end col-->

                <div class="col-sm-6 mt-4 mt-sm-0">
                    <ul class="list-unstyled footer-list text-sm-end text-center mb-0">
                        <li class="list-inline-item"><a href="terms.html" class="text-foot me-2">Terms</a></li>
                        <li class="list-inline-item"><a href="privacy.html" class="text-foot me-2">Privacy</a></li>
                        <li class="list-inline-item"><a href="aboutus.html" class="text-foot me-2">About</a></li>
                        <li class="list-inline-item"><a href="contact.html" class="text-foot me-2">Contact</a></li>
                    </ul>
                </div><!--end col-->
            </div><!--end row-->
        </div>
    </div><!--end container-->
</footer><!--end footer-->
<!-- End -->

<!-- Back to top -->
<a href="#" onclick="topFunction()" id="back-to-top" class="back-to-top fs-5 rounded-pill text-center bg-primary justify-content-center align-items-center"><i data-feather="arrow-up" class="fea icon-sm"></i></a>
<!-- Back to top -->

<!-- Offcanvas Start -->
<div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop">
    <div class="offcanvas-body d-flex align-items-center align-items-center">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="text-center">
                        <h4>Search now.....</h4>
                        <div class="subcribe-form mt-4">
                            <form>
                                <div class="mb-0">
                                    <input type="text" id="help" name="name" class="border rounded-pill" required="" placeholder="Search">
                                    <button type="submit" class="btn btn-pills btn-primary">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->
    </div>
</div>
<!-- Offcanvas End -->

<!-- Offcanvas Start -->
<div class="offcanvas offcanvas-end shadow border-0" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header p-4 border-bottom">
        <h5 id="offcanvasRightLabel" class="mb-0">
            <img src="${pageContext.request.contextPath}/static/images/logo-dark.png" height="22" class="light-version" alt="">
            <img src="${pageContext.request.contextPath}/static/images/logo-light.png" height="22" class="dark-version" alt="">
        </h5>
        <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
    </div>
    <div class="offcanvas-body p-4 px-md-5">
        <div class="row">
            <div class="col-12">
                <!-- Style switcher -->
                <div id="style-switcher">
                    <div>
                        <ul class="text-center style-switcher list-unstyled mb-0">
                            <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="${pageContext.request.contextPath}/static/images/layouts/landing-light-rtl.png" class="img-fluid rounded-md shadow-md d-block mx-auto" style="width: 240px;" alt=""><span class="text-dark fw-medium mt-3 d-block">RTL Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="${pageContext.request.contextPath}/static/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block mx-auto" style="width: 240px;" alt=""><span class="text-dark fw-medium mt-3 d-block">LTR Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="${pageContext.request.contextPath}/static/images/layouts/landing-dark-rtl.png" class="img-fluid rounded-md shadow-md d-block mx-auto" style="width: 240px;" alt=""><span class="text-dark fw-medium mt-3 d-block">RTL Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="${pageContext.request.contextPath}/static/images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block mx-auto" style="width: 240px;" alt=""><span class="text-dark fw-medium mt-3 d-block">LTR Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="${pageContext.request.contextPath}/static/images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block mx-auto" style="width: 240px;" alt=""><span class="text-dark fw-medium mt-3 d-block">Dark Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="${pageContext.request.contextPath}/static/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block mx-auto" style="width: 240px;" alt=""><span class="text-dark fw-medium mt-3 d-block">Light Version</span></a></li>
                            <li class="d-grid"><a href="https://shreethemes.in/doctris/layouts/admin/index.html" target="_blank" class="mt-4"><img src="${pageContext.request.contextPath}/static/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block mx-auto" style="width: 240px;" alt=""><span class="text-dark fw-medium mt-3 d-block">Admin Dashboard</span></a></li>
                        </ul>
                    </div>
                </div>
                <!-- end Style switcher -->
            </div><!--end col-->
        </div><!--end row-->
    </div>

    <div class="offcanvas-footer p-4 border-top text-center">
        <ul class="list-unstyled social-icon social mb-0">
            <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://www.behance.net/shreethemes" target="_blank" class="rounded"><i class="uil uil-behance align-middle" title="behance"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
            <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://shreethemes.in" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
        </ul><!--end icon-->
    </div>
</div>
<!-- Offcanvas End -->

<!-- javascript -->
<script src="${pageContext.request.contextPath}/static/libs/tobii/js/tobii.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<!-- Main Js -->
<!-- JAVASCRIPT -->
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>

</body>

</html>