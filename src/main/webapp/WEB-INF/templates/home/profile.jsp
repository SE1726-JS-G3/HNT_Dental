<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 6/3/2023
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
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
            <h5 class="mb-0">Thông tin tài khoản</h5>
            <p style="color: blue; align-content: center;">
              ${requestScope.updatesuccess}
            </p>
          </div>
          <div class="p-4">
            <form action="user?action=update_image" method="POST" enctype="multipart/form-data">
              <h5 class="mb-0">Chỉnh sửa thông tin :</h5>
              <div>
                <p class="text-muted">Cập nhật ảnh đại diện.</p>
                <div id="myfileupload">
                  <input type="file" name="image" id="uploadfile" name="ImageUpload" onchange="readURL(this);" />
                </div>
                <div id="thumbbox">
                  <img class="rounded" height="20%" width="30%" alt="Thumb image" id="thumbimage" style="display: none" />
                  <a class="removeimg" href="javascript:"></a>
                </div>
                <div id="boxchoice">
                  <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                  <p style="clear:both"></p>
                  <input type="submit" style="display: none" name="send" class="Update btn btn-primary"
                         value="Cập nhật">
                  <p style="clear:both"></p>
                </div>
              </div>
            </form>
            <form action="user?action=updateprofile" method="POST">
              <div class="row">
                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Tên người dùng</label>
                    <input name="username" readonly value="${sessionScope.user.username}" id="name" type="text" class="form-control">
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input name="email" readonly value="${sessionScope.user.email}" id="email" type="email" class="form-control">
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Họ tên</label>
                    <input name="name" oninvalid="CheckFullName(this);" oninput="CheckFullName(this);"  value="${sessionScope.user.name}" id="name2" type="text" class="form-control" >
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Số điện thoại</label>
                    <input name="phone" oninvalid="CheckPhone(this);" oninput="CheckPhone(this);" value="0${sessionScope.user.phone}" id="number" type="text" class="form-control">
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Giới tính</label>
                    <div class="my-3">
                      <div class="form-check">
                        <input id="credit" name="gender" ${sessionScope.user.gender==true?"checked":""} value="true" type="radio" class="form-check-input"
                               checked required >
                        <label class="form-check-label">Nam</label>
                      </div>
                      <div class="form-check">
                        <input id="debit" name="gender" ${sessionScope.user.gender==false?"checked":""} value="false" type="radio" class="form-check-input"
                               required>
                        <label class="form-check-label">Nữ</label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <input type="submit" id="submit" name="send" class="btn btn-primary" value="Lưu">
                </div>
              </div>
            </form>
          </div>
        </div>

        <div class="rounded shadow mt-4">
          <div class="p-4 border-bottom">
            <h5 class="mb-0">Đổi mật khẩu :</h5>
            <p style="color: red; align-content: center;">
              ${requestScope.passerror}
            </p>
            <p style="color: blue; align-content: center;">
              ${requestScope.passsuccess}
            </p>
          </div>

          <div class="p-4">
            <form action="user?action=changepassword" method="POST">
              <div class="row">
                <div class="col-lg-12">
                  <div class="mb-3">
                    <label class="form-label">Mật khẩu cũ :</label>
                    <input value="${oldpassword}" oninvalid="CheckPassword(this);" oninput="CheckPassword(this);" type="password"  name="oldpassword" class="form-control" required="">
                  </div>
                </div><!--end col-->

                <div class="col-lg-12">
                  <div class="mb-3">
                    <label class="form-label">Mật khẩu mới :</label>
                    <input value="${newpassword}" oninvalid="CheckPassword(this);" oninput="CheckPassword(this);" id="password" type="password" name="newpassword" class="form-control" required="">
                  </div>
                </div><!--end col-->

                <div class="col-lg-12">
                  <div class="mb-3">
                    <label class="form-label">Nhập lại mật khẩu :</label>
                    <input value="${renewpassword}" oninvalid="CheckRePassword(this);" oninput="CheckRePassword(this);"type="password" name="renewpassword" class="form-control" required="">
                  </div>
                </div><!--end col-->

                <div class="col-lg-12 mt-2 mb-0">
                  <button class="btn btn-primary">Thay đổi</button>
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