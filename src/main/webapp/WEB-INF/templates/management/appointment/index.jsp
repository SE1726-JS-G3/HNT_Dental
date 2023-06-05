<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 5/30/2023
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
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
        <div class="row">
          <div class="col-md-8 col-sm-12 row">
            <div class="col-md-4">
              <h5 class="mb-0">Lịch hẹn</h5>
            </div>
              <div class="col-xl-3 col-lg-6 col-md-8 mt-4 mt-md-0">
                  <div class="justify-content-md-end">
                      <form>
                          <div class="row justify-content-between align-items-center">
                              <div class="col-sm-12 col-md-5">
                                  <div class="mb-0 position-relative">
                                      <select class="form-select form-control">
                                          <option value="EY">Today</option>
                                          <option value="GY">Tomorrow</option>
                                          <option value="PS">Yesterday</option>
                                      </select>
                                  </div>
                              </div><!--end col-->

                              <div class="col-sm-12 col-md-7 mt-4 mt-sm-0">
                                  <div class="d-grid">
                                      <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#appointmentform">Thêm lịch</a>
                                  </div>
                              </div><!--end col-->
                          </div><!--end row-->
                      </form><!--end form-->
                  </div>
              </div><!--end col-->
          </div>

        </div>


        <div class="row">
          <div class="col-12 mt-4">
            <div class="table-responsive bg-white shadow rounded">
              <table class="table mb-0 table-center">
                <thead>
                <tr>
                  <th class="border-bottom p-3">ID</th>
                  <th class="border-bottom p-3">Tên khách hàng</th>
                  <th class="border-bottom p-3">Tuổi</th>
                  <th class="border-bottom p-3">Giới tính</th>
                  <th class="border-bottom p-3">Loại dịch vụ</th>
                  <th class="border-bottom p-3">Ngày khám bệnh</th>
                  <th class="border-bottom p-3">Thời gian</th>
                  <th class="border-bottom p-3">Bác sĩ</th>
                  <th class="border-bottom p-3">Giá tiền</th>

                  <th class="border-bottom p-3 text-center">Tác vụ</th>
                    <th class="border-bottom p-3">Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td class="p-3">1</td>
                  <td class="p-3">Nguyễn Thị Huyền</td>
                  <td class="p-3">18</td>
                  <td class="p-3">Bê đê</td>
                  <td class="p-3">Niềng răng (VIP1)</td>
                  <td class="p-3">30/05/2023</td>
                  <td class="p-3">9AM</td>
                  <td class="p-3">Phạm Cao Đức Minh</td>
                  <td class="p-3">25 triệu</td>
                  <td class="text-end p-3">
                    <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewappointment"><i class="uil uil-eye"></i></a>
                    <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#acceptappointment"><i class="uil uil-check-circle"></i></a>
                    <a href="#" class="btn btn-icon btn-pills btn-soft-danger" data-bs-toggle="modal" data-bs-target="#cancelappointment"><i class="uil uil-times-circle"></i></a>
                  </td>
<%--                  <td class="p-3 text-center">--%>
<%--                    <a href="#">--%>
<%--                      <button class="btn btn-primary">Sửa</button>--%>
<%--                    </a>--%>
<%--                    <a href="#">--%>
<%--                      <button class="btn btn-danger">Xóa</button>--%>
<%--                    </a>--%>
<%--                  </td>--%>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-12 mt-4">
            <div class="d-md-flex align-items-center text-center justify-content-between">
              <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                <li class="page-item active pl-1"><a class="page-link"
                                                     href="#">1</a>
                </li>
                <li class="page-item pl-1"><a class="page-link"
                                              href="#">2</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../layout/footer.jsp"/>
  </main>
</div>
<!--View Appoiment-->
<div class="modal fade" id="viewappointment" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel1">Chi tiết lịch hẹn</h5>
                <button type="button" class="btn btn-icon btn-close" data-bs-dismiss="modal" id="close-modal"><i class="uil uil-times fs-4 text-dark"></i></button>
            </div>
            <div class="modal-body p-3 pt-4">
                <div class="d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/static/images/user.png" class="avatar avatar-small rounded-pill" alt="">
                    <h5 class="mb-0 ms-3">Nguyễn Thị Huyền</h5>
                </div>
                <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                    <li>
                        <ul class="list-unstyled mb-0">
                            <li class="d-flex">
                                <h6>Tuổi:</h6>
                                <p class="text-muted ms-2">18</p>
                            </li>

                            <li class="d-flex">
                                <h6>Giới tính:</h6>
                                <p class="text-muted ms-2">Bê đê</p>
                            </li>
                            <li class="d-flex">
                                <h6>Loại dịch vụ:</h6>
                                <p class="text-muted ms-2">Niềng răng(VIP1)</p>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <ul class="list-unstyled mb-0">
                            <li class="d-flex">
                                <h6>Ngày khám bệnh:</h6>
                                <p class="text-muted ms-2">30/05/2023</p>
                            </li>
                            <li class="d-flex">
                                <h6>Thời gian:</h6>
                                <p class="text-muted ms-2">9AM</p>
                            </li>
                            <li class="d-flex">
                                <h6 class="mb-0">Bác sĩ:</h6>
                                <p class="text-muted ms-2 mb-0">Phạm Cao Đức Minh</p>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>
</body>
</html>
