<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 6/9/2023
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/static/libs/tiny-slider/tiny-slider.css" rel="stylesheet">
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
<jsp:include page="../layout/menu-header-white.jsp"/>
<!-- Start Hero -->
<section class="bg-half-150 d-table w-100 bg-light">
    <div class="container">
        <div class="row mt-5 justify-content-center">
            <div class="col-12">
                <div class="section-title text-center">
                    <h3 class="sub-title mb-4">Lockdowns lead to fewer people seeking medical care</h3>
                    <p class="para-desc mx-auto text-muted">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>

                    <ul class="list-unstyled mt-4">
                        <li class="list-inline-item user text-muted me-2"><i class="mdi mdi-account"></i> Calvin Carlo</li>
                        <li class="list-inline-item date text-muted"><i class="mdi mdi-calendar-check"></i> 1st January, 2021</li>
                    </ul>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section><!--end section-->
<div class="position-relative">
    <div class="shape overflow-hidden text-color-white">
        <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
        </svg>
    </div>
</div>
<!-- End Hero -->

<!-- Start -->
<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-7">
                <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/single.jpg" class="img-fluid rounded shadow" alt="">

                <!-- <ul class="list-unstyled mt-4">
                    <li class="list-inline-item user text-muted me-2"><i class="mdi mdi-account"></i> Calvin Carlo</li>
                    <li class="list-inline-item date text-muted"><i class="mdi mdi-calendar-check"></i> 1st January, 2021</li>
                </ul> -->

                <p class="text-muted mt-4">This is required when, for example, the final text is not yet available. Dummy text is also known as 'fill text'. It is said that song composers of the past used dummy texts as lyrics when writing melodies in order to have a 'ready-made' text to sing with the melody. Dummy texts have been in use by typesetters since the 16th century.</p>
                <p class="text-muted">Due to its widespread use as filler text for layouts, non-readability is of great importance: human perception is tuned to recognize certain patterns and repetitions in texts.</p>
                <p class="text-muted mb-0">For this reason, dummy text usually consists of a more or less random series of words or syllables.</p>


            </div><!--end col-->

            <div class="col-lg-4 col-md-5 mt-4 mt-sm-0 pt-2 pt-sm-0">
                <div class="card border-0 sidebar sticky-bar rounded shadow">
                    <div class="card-body">
                        <!-- SEARCH -->
                        <div class="widget mb-4 pb-2">
                            <h5 class="widget-title">Search</h5>
                            <div id="search2" class="widget-search mt-4 mb-0">
                                <form role="search" method="get" id="searchform" class="searchform">
                                    <div>
                                        <input type="text" class="border rounded form-control" name="s" id="s" placeholder="Search Keywords...">
                                        <input type="submit" id="searchsubmit" value="Search">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- SEARCH -->

                        <!-- RECENT POST -->
                        <div class="widget mb-4 pb-2">
                            <h5 class="widget-title">Recent Post</h5>
                            <div class="mt-4">
                                <div class="clearfix post-recent">
                                    <div class="post-recent-thumb float-start"> <a href="jvascript:void(0)"> <img alt="img" src="${pageContext.request.contextPath}/static/images/blog/07.jpg" class="img-fluid rounded"></a></div>
                                    <div class="post-recent-content float-start"><a href="jvascript:void(0)">Consultant Business</a><span class="text-muted mt-2">15th June, 2019</span></div>
                                </div>
                                <div class="clearfix post-recent">
                                    <div class="post-recent-thumb float-start"> <a href="jvascript:void(0)"> <img alt="img" src="${pageContext.request.contextPath}/static/images/blog/08.jpg" class="img-fluid rounded"></a></div>
                                    <div class="post-recent-content float-start"><a href="jvascript:void(0)">Look On The Glorious Balance</a> <span class="text-muted mt-2">15th June, 2019</span></div>
                                </div>
                                <div class="clearfix post-recent">
                                    <div class="post-recent-thumb float-start"> <a href="jvascript:void(0)"> <img alt="img" src="${pageContext.request.contextPath}/static/images/blog/01.jpg" class="img-fluid rounded"></a></div>
                                    <div class="post-recent-content float-start"><a href="jvascript:void(0)">Research Financial.</a> <span class="text-muted mt-2">15th June, 2019</span></div>
                                </div>
                            </div>
                        </div>
                        <!-- RECENT POST -->

                        <!-- TAG CLOUDS -->
                        <div class="widget mb-4 pb-2">
                            <h5 class="widget-title">Tags Cloud</h5>
                            <div class="tagcloud mt-4">
                                <a href="jvascript:void(0)" class="rounded">Business</a>
                                <a href="jvascript:void(0)" class="rounded">Finance</a>
                                <a href="jvascript:void(0)" class="rounded">Marketing</a>
                                <a href="jvascript:void(0)" class="rounded">Fashion</a>
                                <a href="jvascript:void(0)" class="rounded">Bride</a>
                                <a href="jvascript:void(0)" class="rounded">Lifestyle</a>
                                <a href="jvascript:void(0)" class="rounded">Travel</a>
                                <a href="jvascript:void(0)" class="rounded">Beauty</a>
                                <a href="jvascript:void(0)" class="rounded">Video</a>
                                <a href="jvascript:void(0)" class="rounded">Audio</a>
                            </div>
                        </div>
                        <!-- TAG CLOUDS -->

                        <!-- SOCIAL -->

                        <!-- SOCIAL -->
                    </div>
                </div>
            </div>
        </div><!--end row-->
    </div><!--end container-->

    <div class="container mt-100 mt-60">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h4 class="title mb-0">Related Post:</h4>
                </div>
            </div><!--end col-->
        </div><!--end row-->

        <div class="row">
            <div class="col-lg-12 mt-4 pt-2">
                <div class="slider-range-three">
                    <div class="tiny-slide">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                            <img src="${pageContext.request.contextPath}/static/images/blog/03.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">medicine research course for doctors</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tiny-slide">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                            <img src="${pageContext.request.contextPath}/static/images/blog/04.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Comparing Nitrogen And Mechanical Freezers</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tiny-slide">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                            <img src="${pageContext.request.contextPath}/static/images/blog/05.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">It Is Very Important To Wear Proper Clothing</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tiny-slide">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                            <img src="${pageContext.request.contextPath}/static/images/blog/06.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Hollowed-Out Faces More Cuts Amid Virus</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tiny-slide">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                            <img src="${pageContext.request.contextPath}/static/images/blog/07.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">A Researcher Is Research On Coronavirus In Lab</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section><!--end section-->
<!-- End -->

<jsp:include page="../layout/footer.jsp"></jsp:include>
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

<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<!-- Main Js -->
<!-- JAVASCRIPT -->
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/tobii/js/tobii.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>

</body>

</html>