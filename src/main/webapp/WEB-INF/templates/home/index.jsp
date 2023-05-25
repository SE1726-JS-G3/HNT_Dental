<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>HNT Dental - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/static/libs/tobii/css/tobii.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" class="theme-opt" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/libs/remixicon/fonts/remixicon.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/libs/@iconscout/unicons/css/line.css" type="text/css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/style.min.css" class="theme-opt" rel="stylesheet"
          type="text/css"/>
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

<header id="topnav" class="navigation sticky">
    <div class="container">

        <div>
            <a class="logo" href="home">
                <img src="assets/images/logo-light.png" height="24" class="l-light" alt="">
                <img src="assets/images/logo-dark.png" class="l-dark" height="24" alt="">
            </a>
        </div>

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

            <li class="list-inline-item mb-0 ms-1">
                <a href="javascript:void(0)" class="btn btn-icon btn-pills btn-primary" data-bs-toggle="offcanvas"
                   data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                    <i class="uil uil-search"></i>
                </a>
            </li>

            <li class="list-inline-item mb-0 ms-1">
                <div class="dropdown dropdown-primary">
                    <c:if test="${sessionScope.account != null}">
                        <c:if test="${sessionScope.account.img != 'default'}">
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
                                    src="data:image/png;base64,${sessionScope.account.img}"
                                    class="avatar avatar-ex-small rounded-circle" alt=""></button>
                        </c:if>
                        <c:if test="${sessionScope.account.img == 'default'}">
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
                                    src="assets/images/avata.png" class="avatar avatar-ex-small rounded-circle" alt="">
                            </button>
                        </c:if>
                    </c:if>

                    <c:if test="${sessionScope.account == null}">
                        <button class="btn btn-primary p-1" onclick="window.location.href = '/auth/login'">
                            Login
                        </button>
                    </c:if>
                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3"
                         style="min-width: 200px;">
                        <c:if test="${sessionScope.account.accountname != null}">
                            <a class="dropdown-item d-flex align-items-center text-" href="#">
                                <c:if test="${sessionScope.account.img != 'default'}">
                                    <img src="data:image/png;base64,${sessionScope.account.img}"
                                         class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                </c:if>
                                <c:if test="${sessionScope.account.img == 'default'}">
                                    <img src="assets/images/avata.png"
                                         class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                </c:if>
                                <div class="flex-1 ms-2">
                                    <span class="d-block mb-1">${sessionScope.account.accountname}</span>
                                </div>
                            </a>
                        </c:if>
                        <div class="dropdown-divider border-top"></div>
                        <c:if test="${sessionScope.account != null}">
                            <a class="dropdown-item text-" href="account?action=profile"><span
                                    class="mb-0 d-inline-block me-1"><i
                                    class="uil uil-sign-out-alt align-middle h6"></i></span> Tài khoản của tôi</a>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <a class="dropdown-item text-" href="account?action=logout"><span
                                    class="mb-0 d-inline-block me-1"><i
                                    class="uil uil-sign-out-alt align-middle h6"></i></span> Đăng xuất</a>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                            <a class="dropdown-item text-" href="account?action=login"><span
                                    class="mb-0 d-inline-block me-1"><i
                                    class="uil uil-sign-out-alt align-middle h6"></i></span> Đăng Nhập</a>
                        </c:if>
                    </div>
                </div>
            </li>

        </ul>

        <div id="navigation">

            <ul class="navigation-menu nav-light nav-left">
                <li><a href="home" class="sub-menu-item">Trang chủ</a></li>
                <li><a href="doctor?action=all" class="sub-menu-item">Bác sĩ</a></li>
                <li><a href="service?action=all" class="sub-menu-item">Dịch vụ</a></li>
                <li><a href="contact" class="sub-menu-item">Liên hệ</a></li>
                <li><a href="blogs" class="sub-menu-item">Tin tức & chủ đề</a></li>
            </ul>

        </div>
    </div>
</header>
<section class="bg-half-260 d-table w-100" style="background: url('assets/images/bg/banner.jpg') center;">
    <div class="bg-overlay bg-overlay-"></div>
    <div class="container">
        <div class="row mt-5 mt-lg-0">
            <div class="col-12">
                <div class="heading-title">
                    <img src="assets/images/logo-icon.png" height="50" alt="">
                    <h4 class="display-4 fw-bold text-white title- mt-3 mb-4">Nền Tảng <br> Hỗ Trợ Y Tế Trực Tuyến</h4>
                    <p class="para-desc text-white-50 mb-0">Nếu bạn hay người thân cần sự trợ giúp ngay lập tức, điều
                        trị khẩn cấp trong một cuộc tư vấn đơn giản.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10">
                <div class="features-absolute bg-white shadow rounded overflow-hidden card-group">
                    <div class="card border-0 bg-light p-4">
                        <i class="ri-heart-pulse-fill text-primary h2 mb-0"></i>
                        <h5 class="mt-1">Dịch vụ sức khỏe</h5>
                        <p class="text-muted mt-2">Chúng tôi đem đến cho bạn những dịch vụ chất lượng tốt nhất trên thị
                            trường.</p>
                        <a href="#" class="text-primary">Tìm hiểu ngay <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>

                    <div class="card border-0 p-4">
                        <i class="ri-dossier-fill text-primary h2 mb-0"></i>
                        <h5 class="mt-1">Đặt lịch trực tuyến</h5>
                        <p class="text-muted mt-2">Đội ngũ bác sĩ luôn sẵn sàng tư vấn và thăm khám dành riêng cho
                            bạn.</p>
                        <br>
                        <a href="#" class="text-primary">Tìm hiểu ngay <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>

                    <div class="card border-0 bg-light p-4">
                        <i class="ri-time-fill text-primary h2 mb-0"></i>
                        <h5 class="mt-1">Thời gian hoạt động</h5>
                        <ul class="list-unstyled mt-2">
                            <li class="d-flex justify-content-between">
                                <p class="text-muted mb-0">Thứ 2 - Thứ 6</p>
                                <p class="text-primary mb-0">8.00 - 20.00</p>
                            </li>
                            <li class="d-flex justify-content-between">
                                <p class="text-muted mb-0">Thứ 7</p>
                                <p class="text-primary mb-0">8.00 - 18.00</p>
                            </li>
                            <li class="d-flex justify-content-between">
                                <p class="text-muted mb-0">Chủ nhật</p>
                                <p class="text-primary mb-0">8.00 - 14.00</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container mt-100 mt-60">
        <div class="row align-items-center">
            <div class="col-lg-5 col-md-6">
                <div class="position-relative">
                    <img src="assets/images/about/about.jpg" class="img-fluid" alt="">
                    <div class="play-icon">
                        <a href="https://youtu.be/QIvIN8M91x4" data-bs-toggle="modal" data-bs-target="#watchvideomodal"
                           class="play-btn video-play-icon">
                            <i class="mdi mdi-play text-primary rounded-circle bg-white title-bg- shadow"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-7 col-md-6 mt-4 mt-lg-0 pt- pt-lg-0">
                <div class="ms-lg-4">
                    <div class="section-title">
                        <h4 class="title mb-4">Vì sao nên chọn Doctris?</h4>
                        <p class="text-muted para-desc">Chúng tôi quy tụ đội ngũ chuyên gia, bác sĩ, dược sĩ và điều
                            dưỡng có trình độ chuyên môn cao, tay nghề giỏi, tận tâm và chuyên nghiệp</p>
                        <p class="text-muted para-desc mb-0">Luôn đặt người bệnh làm trung tâm, Doctris cam kết đem đến
                            dịch vụ chăm sóc sức khỏe tốt nhất cho khách hàng.</p>
                    </div>

                    <div class="mt-4">
                        <a href="#" class="btn btn-primary">Tìm hiểu nhiều hơn.. <i
                                class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="section-title text-center mb-4 pb-2">
                    <span class="badge badge-pill badge-soft-primary mb-3">Dịch vụ chăm sóc sức khỏe</span>
                    <h4 class="title mb-4">Những dịch vụ nổi bật của chúng tôi</h4>
                    <p class="text-muted mx-auto para-desc mb-0">Đội ngũ Doctris luôn đem đến cho bạn những dịch vụ chăm
                        sóc sức khỏe hiện đại và tốt nhất trên thị trường với những bác sĩ chuyên sâu trong các lĩnh vực
                        .</p>
                </div>
            </div>
        </div>

        <div class="row align-items-center">
            <c:forEach items="${service}" var="s">
                <div class="col-xl-4 col-lg-4 col-md-6 mt-4 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-img position-relative">
                            <img style="height: 14rem;width: 100%" src="data:image/png;base64,${s.img}"
                                 class="img-fluid" alt="">
                        </div>
                        <div class="card-body content text-center">
                            <a href="#" class="title text- h5 d-block mb-0">${s.title}</a>
                            <small class="text-muted speciality">${s.setting.name}</small>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="col-12 mt-4 pt-2 text-center">
                <a href="#" class="btn btn-primary">Tìm kiếm nhiều hơn</a>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="section-title text-center mb-4 pb-2">
                    <span class="badge badge-pill badge-soft-primary mb-3">Dịch vụ bác sĩ </span>
                    <h4 class="title mb-4">Đội ngũ chuyên gia</h4>
                    <p class="text-muted mx-auto para-desc mb-0">Doctris quy tụ đội ngũ chuyên gia, bác sĩ, dược sĩ và
                        điều dưỡng được đào tạo bài bản đến chuyên sâu tại Việt nam và nhiều nước có nên y học phát
                        triển như Mỹ, Anh, Pháp...
                        Luôn lấy người bệnh là trung tâm, Vinmec cam kết mang lại dịch vụ chăm sóc sức khỏe toàn diện và
                        chất lượng cao cho khách hàng.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <c:forEach items="${doctor}" var="d">
                <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-img position-relative">
                            <img src="data:image/png;base64,${d.img}"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="rounded img-fluid"
                                 alt="">
                        </div>
                        <div class="card-body content text-center">
                            <a href="doctor?action=detail&id=${d.doctor_id}"
                               class="title text- h5 d-block mb-0">${d.doctor_name}</a>
                            <small class="text-muted speciality">${d.setting.name}</small>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div class="col-12 mt-4 pt-2 text-center">
                <a href="#" class="btn btn-primary">Tìm kiếm nhiều hơn</a>
            </div>
        </div>
    </div>
</section>

<section class="section pt-0">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 text-center">
                <div class="video-solution-cta position-relative" style="z-index: 1;">
                    <div class="position-relative">
                        <img src="assets/images/bg/banner.jpg" class="img-fluid rounded-md shadow-lg" alt="">
                        <div class="play-icon">
                            <a href="https://youtu.be/QIvIN8M91x4" data-bs-toggle="modal"
                               data-bs-target="#watchvideomodal" class="play-btn video-play-icon">
                                <i class="mdi mdi-play text-primary rounded-circle bg-white title-bg- shadow-lg"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="feature-posts-placeholder bg-primary"></div>
    </div>
</section>

<a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i
        data-feather="arrow-up" class="icons"></i></a>

<div class="modal fade" id="watchvideomodal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content video-modal rounded overflow-hidden">
            <div class="ratio ratio-16x9">
                <iframe src="https://www.youtube.com/embed/QIvIN8M91x4" title="YouTube video" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div>

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