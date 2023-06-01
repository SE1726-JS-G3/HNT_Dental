<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<jsp:include page="../layout/head.jsp"/>
<body>
<div class="page-wrapper doctris-theme toggled">
    <jsp:include page="../layout/slide_bar.jsp"/>
    <main class="page-content bg-light">
        <jsp:include page="../layout/menu_bar.jsp"/>
        <div class="container-fluid">
            <div class="layout-specing">
                <div class="d-md-flex justify-content-between">
                    <div>
                        <h5 class="mb-0">Blogs</h5>

                        <nav aria-label="breadcrumb" class="d-inline-block mt-1">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">Doctris</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Blogs</li>
                            </ul>
                        </nav>
                    </div>

                    <div class="mt-4 mt-sm-0">
                        <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newblogadd">Add
                            Blog</a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/01.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i
                                            class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020
                                    </li>
                                    <li class="list-inline-item text-muted small"><i
                                            class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                    </li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Easily connect to doctor and make
                                    a treatment</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i
                                                class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i
                                                class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i
                                            class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/02.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i
                                            class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020
                                    </li>
                                    <li class="list-inline-item text-muted small"><i
                                            class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                    </li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Lockdowns lead to fewer people
                                    seeking medical care</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i
                                                class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i
                                                class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i
                                            class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/03.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i
                                            class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020
                                    </li>
                                    <li class="list-inline-item text-muted small"><i
                                            class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                    </li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">medicine research course for
                                    doctors</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i
                                                class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i
                                                class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i
                                            class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/04.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i
                                            class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020
                                    </li>
                                    <li class="list-inline-item text-muted small"><i
                                            class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                    </li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Comparing Nitrogen And Mechanical
                                    Freezers</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i
                                                class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i
                                                class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i
                                            class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/05.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i
                                            class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020
                                    </li>
                                    <li class="list-inline-item text-muted small"><i
                                            class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                    </li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">It Is Very Important To Wear
                                    Proper Clothing</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i
                                                class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i
                                                class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i
                                            class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/06.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i
                                            class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020
                                    </li>
                                    <li class="list-inline-item text-muted small"><i
                                            class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                    </li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Hollowed-Out Faces More Cuts Amid
                                    Virus</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i
                                                class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i
                                                class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i
                                            class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/07.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i
                                            class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020
                                    </li>
                                    <li class="list-inline-item text-muted small"><i
                                            class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                    </li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">A Researcher Is Research On
                                    Coronavirus In Lab</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i
                                                class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i
                                                class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i
                                            class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/08.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i
                                            class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020
                                    </li>
                                    <li class="list-inline-item text-muted small"><i
                                            class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                    </li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Using Spectroscopy To Assess Food
                                    Quality</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i
                                                class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i
                                                class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i
                                            class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <div class="col-12 mt-4">
                        <ul class="pagination justify-content-end mb-0 list-unstyled">
                            <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Previous">Prev</a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                            <li class="page-item"><a class="page-link" href="javascript:void(0)"
                                                     aria-label="Next">Next</a></li>
                        </ul><!--end pagination-->
                    </div><!--end col-->
                </div><!--end row-->
            </div>
        </div><!--end container-->
        <jsp:include page="../layout/footer.jsp"/>
    </main>
</div>

<script src="${pageContext.request.contextPath}/static/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>
</body>
</html>