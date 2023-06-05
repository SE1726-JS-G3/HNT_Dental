<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<jsp:include page="../layout/header.jsp"/>

<body>
<jsp:include page="../layout/preloader.jsp"/>

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
              <li class="breadcrumb-item active" aria-current="page">Tin tức</li>
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

<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-lg-8 row">
        <c:forEach items="${listblog}" var="b">
          <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
            <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
              <img src="data:image/png;base64,${b.img}" class="img-fluid" alt="">
              <div class="card-body p-4">
                <ul class="list-unstyled mb-2">
                  <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i><fmt:formatDate pattern="dd/MM/yyyy" value="${b.date}" /></li>
                </ul>
                <a href=# class="text-dark title h7">${b.title}</a>
                <c:set var = "detail" value = "${b.describe}"/>

                <div class="post-meta d-flex justify-content-between mt-3">
                  <ul class="list-unstyled mb-0">
                    <li class="list-inline-item me-2 mb-0" style="color:gray">${b.category.name}</li>
                  </ul>

                </div>
              </div>
            </div>

          </div>
        </c:forEach>
      </div>


    </div>

    <c:set var="page" value="${page}"/>
    <div class="row text-center">
      <div class="col-12 mt-4">
        <div class="d-md-flex align-items-center text-center justify-content-between">
          <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>

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