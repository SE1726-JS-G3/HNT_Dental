<%--
  Created by IntelliJ IDEA.
  User: hungkv
  Date: 5/27/2023
  Time: 4:17 PM
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
              <h5 class="mb-0">Dịch vụ</h5>
            </div>
            <div class="col-md-8">
              <div class="search-bar p-0 d-lg-block ms-2">
                <div id="search" class="menu-search mb-0">
                  <form action="#" method="POST" id="searchform"
                        class="searchform">
                    <div>
                      <input type="text" class="form-control border rounded-pill" name="txt"
                             id="s" placeholder="Tìm kiếm tên dịch vụ...">
                      <input type="submit" id="searchsubmit" value="Search">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-12">
            <a href="#">
              <button class="btn btn-primary">Thêm mới</button>
            </a>
          </div>
        </div>


        <div class="row">
          <div class="col-12 mt-4">
            <div class="table-responsive bg-white shadow rounded">
              <table class="table mb-0 table-center">
                <thead>
                <tr>
                  <th class="border-bottom p-3">ID</th>
                  <th class="border-bottom p-3">Loại dịch vụ</th>
                  <th class="border-bottom p-3"></th>
                  <th class="border-bottom p-3">Giới tính</th>
                  <th class="border-bottom p-3">Điện thoại</th>
                  <th class="border-bottom p-3">Ngày khám bệnh gần nhất</th>
                  <th class="border-bottom p-3 text-center">Tác vụ</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td class="p-3">1</td>
                  <td class="p-3">Khương Văn Hùng</td>
                  <td class="p-3">24/08/2001</td>
                  <td class="p-3">Nam</td>
                  <td class="p-3">0888195313</td>
                  <td class="p-3">27/05/2023</td>
                  <td class="p-3 text-center">
                    <a href="#">
                      <button class="btn btn-primary">Sửa</button>
                    </a>
                    <a href="#">
                      <button class="btn btn-danger">Xóa</button>
                    </a>
                  </td>
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

<script src="${pageContext.request.contextPath}/static/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>
</body>
</html>

