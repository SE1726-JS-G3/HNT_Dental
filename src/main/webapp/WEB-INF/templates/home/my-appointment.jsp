
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<jsp:include page="layout/header.jsp"/>

<body>
<jsp:include page="layout/menu-header-white.jsp"/>

<section class="bg-dashboard">
  <div class="container">
    <div class="row justify-content-center">
      <jsp:include page="layout/profile-sidebar.jsp"/>
      <div class="col-xl-8 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
        <h3 class="mb-0"></h3>
        <div class="rounded shadow mt-4">
          <div class="p-4 border-bottom">
            <h5 class="mb-0">Lịch hẹn của tôi</h5>
            <p style="color: blue; align-content: center;">
              ${requestScope.updatesuccess}
            </p>
          </div>
          <div class="p-4">
            <form action="user?action=updateprofile" method="POST">
              <div class="row">
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">ID cuộc hẹn</label>
                    <input name="username" readonly value="${sessionScope.user.username}" id="name" type="text" class="form-control">
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Tên bệnh nhân</label>
                    <input name="email" readonly value="${sessionScope.user.email}" id="email" type="email" class="form-control">
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">ID bệnh nhân</label>
                    <input name="name" value="${sessionScope.user.name}" id="name2" type="text" class="form-control" >
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Ngày đặt lịch</label>
                    <input name="phone" oninvalid="CheckPhone(this);" oninput="CheckPhone(this);" value="" id="date" type="text" class="form-control">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Giờ đặt lịch </label>
                    <input name="phone" oninvalid="CheckPhone(this);" oninput="CheckPhone(this);" value="" id="time" type="text" class="form-control">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Trạng thái</label>
                    <input name="phone" oninvalid="CheckPhone(this);" oninput="CheckPhone(this);" value="" id="status" type="text" class="form-control">
                  </div>
                </div>

              </div>
              <div class="row">
                <div class="col-sm-12">
                  <input type="submit" id="submit" name="send" class="btn btn-primary" value="Hoàn thành lịch hẹn">
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<jsp:include page="layout/footer.jsp"/>
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
