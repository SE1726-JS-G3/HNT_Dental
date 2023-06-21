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
        <div class="row">
          <div class="col-md-6 row">
            <div class="col-md-4">
              <h5 class="mb-0">Dịch vụ</h5>
            </div>
            <div class="col-md-7">
              <div class="search-bar p-0 d-lg-block ms-2">
                <div id="search" class="menu-search mb-0">
                  <form action="servicemanage?action=search" method="POST" id="searchform" class="searchform">
                    <div>
                      <input type="text" class="form-control border rounded-pill" name="txt" id="s" placeholder="Tìm kiếm tên dịch vụ...">
                      <input type="submit" id="searchsubmit" value="Search">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <form action="servicemanage?action=filter" method="POST" onSubmit="document.getElementById('submit').disabled = true;">
              <div class="justify-content-md-end row">
                <div class="col-md-10 row align-items-center">
                  <div class="col-md-4">
                    <label class="form-label">Trạng thái</label>
                  </div>
                  <div class="col-md-7">
                    <select name="category" class="form-select">
                      <option <c:if test="${category1 == 'all'}"> selected </c:if> value="all">Tất cả</option>
                      <c:forEach items="${category}" var="s">
                        <option <c:if test="${category1 == s.id}"> selected </c:if> value="${s.id}">${s.name}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="col-md-2">
                  <button type="submit" class="btn btn-primary">Lọc</button>
                </div>
              </div>
            </form>
          </div>
          <div class="col-md-2">
            <a href="servicemanage?action=add"><button class="btn btn-primary">Thêm mới</button></a>
          </div>
        </div>


        <div class="row">
          <div class="col-12 mt-4">
            <div class="table-responsive bg-white shadow rounded">
              <table class="table mb-0 table-center">
                <thead>
                <tr>
                  <th class="border-bottom p-3">ID</th>
                    <th class="border-bottom p-3">Tên dịch vụ</th>
                  <th class="border-bottom p-3">Gói dich vụ</th>
                  <th class="border-bottom p-3">Phí</th>
                  <th class="border-bottom p-3">Trạng thái</th>
                  <th class="border-bottom p-3 text-center">Tác vụ</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td class="p-3">1</td>
                  <td class="p-3">Lấy cao răng</td>
                  <td class="p-3">VIP1</td>
                  <td class="p-3">50</td>
                  <td class="p-3">Active</td>
                  <td class="p-3 text-center">
                    <a href="#">
                      <button class="btn btn-primary">Chuyển trạng thái</button>
                    </a>
                    <a href="#">
                      <button class="btn btn-danger">Chi tiết</button>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td class="p-3">2</td>
                  <td class="p-3">Niêng răng trong suốt</td>
                  <td class="p-3">THƯỜNG</td>
                  <td class="p-3">1000000</td>
                  <td class="p-3">Active</td>
                  <td class="p-3 text-center">
                    <a href="#">
                      <button class="btn btn-primary">Chuyển trạng thái</button>
                    </a>
                    <a href="#">
                      <button class="btn btn-danger">Chi tiết</button>
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

