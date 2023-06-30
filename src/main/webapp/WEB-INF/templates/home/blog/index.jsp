<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<jsp:include page="../layout/header.jsp"/>

<body>

<jsp:include page="../layout/menu-header-white.jsp"/>

<section class="bg-half-170 d-table w-100" >
  <div class="bg-overlay bg-overlay-dark"></div>
  <div class="container">
    <div class="row mt-5 justify-content-center">
      <div class="col-12">
        <div class="section-title text-center">
          <h3 class="sub-title mb-4 text-white title-dark">Blogs & Tin Tức</h3>
          <p class="para-desc mx-auto text-white-50">Bạn có thể trở thành một bác sĩ bất đắc dĩ trong gia đình với những kiến thức tại HNT Dental blog.
            Tại đây chúng tôi luôn cập nhập những thông tin bổ ích về sức khỏe, sinh lý, sơ cứu,...</p>

          <nav aria-label="breadcrumb" class="d-inline-block mt-3">
            <ul class="breadcrumb bg-light rounded mb-0 py-1 px-2">
              <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
              <li class="breadcrumb-item status" aria-current="page">Tin tức</li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</section>

<div class="position-relative">
  <div class="shape overflow-hidden text-white">
    <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
    </svg>
  </div>
</div>



<!-- Start -->
<section class="section">
  <div class="container">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <input type="text" class="form-select form-control" name="txt"
                 value="${search}"
                 id="search" placeholder="Tìm kiếm bài viết...">
        </div>
        <div class="col-lg-2">
          <button class="btn btn-primary rounded-pill" id="btn-search">Tìm kiếm</button>
        </div>
        <div class="col-lg-4">
          <select class="form-select form-control">
            <option value="EY">Category1</option>
            <option value="EY">Category2</option>
            <option value="GY">Category3</option>
            <option value="PS">Category4</option>
          </select>
        </div>
        <div class="col-lg-2">
          <button class="btn btn-primary rounded-pill" id="btn-search">Lọc</button>
        </div>
      </div>
      <br>
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
          <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/01.jpg" class="img-fluid" alt="">
          <div class="card-body p-4">
            <ul class="list-unstyled mb-2">
              <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
              <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
            </ul>
            <a href="blog-detail.html" class="text-dark title h5">Easily connect to doctor and make a treatment</a>
            <div class="post-meta d-flex justify-content-between mt-3">
              <ul class="list-unstyled mb-0">
                <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
              </ul>
              <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
            </div>
          </div>
        </div>
      </div><!--end col-->

      <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
          <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/02.jpg" class="img-fluid" alt="">
          <div class="card-body p-4">
            <ul class="list-unstyled mb-2">
              <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
              <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
            </ul>
            <a href="blog-detail.html" class="text-dark title h5">Lockdowns lead to fewer people seeking medical care</a>
            <div class="post-meta d-flex justify-content-between mt-3">
              <ul class="list-unstyled mb-0">
                <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
              </ul>
              <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
            </div>
          </div>
        </div>
      </div><!--end col-->

      <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
          <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/04.jpg" class="img-fluid" alt="">
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
      </div><!--end col-->

      <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
          <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/04.jpg" class="img-fluid" alt="">
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
      </div><!--end col-->

      <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
          <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/05.jpg" class="img-fluid" alt="">
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
      </div><!--end col-->

      <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
          <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/06.jpg" class="img-fluid" alt="">
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
      </div><!--end col-->

      <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
          <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/07.jpg" class="img-fluid" alt="">
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
      </div><!--end col-->

      <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
          <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/08.jpg" class="img-fluid" alt="">
          <div class="card-body p-4">
            <ul class="list-unstyled mb-2">
              <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
              <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
            </ul>
            <a href="blog-detail.html" class="text-dark title h5">Using Spectroscopy To Assess Food Quality</a>
            <div class="post-meta d-flex justify-content-between mt-3">
              <ul class="list-unstyled mb-0">
                <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
              </ul>
              <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
            </div>
          </div>
        </div>
      </div><!--end col-->

      <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
          <img src="https://shreethemes.in/doctris/layouts/assets/images/blog/09.jpg" class="img-fluid" alt="">
          <div class="card-body p-4">
            <ul class="list-unstyled mb-2">
              <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
              <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
            </ul>
            <a href="blog-detail.html" class="text-dark title h5">You Have To Wash Your Hands For 20 Seconds</a>
            <div class="post-meta d-flex justify-content-between mt-3">
              <ul class="list-unstyled mb-0">
                <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
              </ul>
              <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
            </div>
          </div>
        </div>
      </div><!--end col-->
    </div><!--end row-->

    <div class="row text-center">
      <div class="col-12">
        <ul class="pagination justify-content-center mb-0 list-unstyled">
          <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Previous">Prev</a></li>
          <li class="page-item status"><a class="page-link" href="javascript:void(0)">1</a></li>
          <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
          <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
          <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Next">Next</a></li>
        </ul><!--end pagination-->
      </div><!--end col-->
    </div><!--end row-->
  </div><!--end container-->
</section><!--end section-->
<!-- End -->
<jsp:include page="../layout/footer.jsp"/>
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
<script src="${pageContext.request.contextPath}/static/libs/tobii/js/tobii.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>

</body>

</html>