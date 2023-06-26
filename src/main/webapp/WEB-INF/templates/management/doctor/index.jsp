]<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <div class="col-md-5 row">
            <div class="col-md-4">
              <h5 class="mb-0">Bác sĩ</h5>
            </div>
            <div class="col-md-7">
              <div class="search-bar p-0 d-lg-block ms-2">
                <div class="menu-search mb-0">
                  <form id="searchForm" class="searchform">
                    <div>
                      <input type="text" class="form-control border rounded-pill" name="search" value="${search}" id="searchInput" placeholder="Tìm kiếm ...">
                      <input type="submit" id="btn-search" value="Tìm kiếm">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-7">
            <form action="doctormanage?action=filter" method="POST" onSubmit="document.getElementById('submit').disabled = true;">
              <div class="justify-content-md-end row">
                <div class="col-md-5 row align-items-center">
                  <div class="col-md-3">
                    <label class="form-label">Giới tính</label>
                  </div>
                  <div class="col-md-9">
                    <select name="gender" class="form-select">
                      <option <c:if test="${gender == 'all'}"> selected </c:if> value="all">Tất cả</option>
                      <option <c:if test="${gender == 'true'}"> selected </c:if> value="true">Nam</option>
                      <option <c:if test="${gender == 'false'}"> selected </c:if> value="false">Nữ</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-5 row align-items-center">
                  <div class="col-md-4">
                    <label class="form-label">Chuyên môn</label>
                  </div>
                  <div class="col-md-8">
                    <select name="speciality" class="form-select">
                      <option <c:if test="${speciality == 'all'}"> selected </c:if> value="all">Tất cả</option>
                      <c:forEach items="${speciality}" var="s">
                        <option <c:if test="${speciality1 == s.id}"> selected </c:if> value="${s.id}">${s.name}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="col-md-1 md-0">
                  <button type="submit" class="btn btn-primary">Lọc</button>
                </div>
              </div>
            </form>
          </div>
        </div>


        <div class="row">
          <div class="col-12 mt-4">
            <div class="table-responsive bg-white shadow rounded">
              <table class="table mb-0 table-center">
                <thead>
                <tr>
                  <th class="border-bottom p-3">ID</th>
                  <th class="border-bottom p-3">Tên bác sĩ</th>
                  <th class="border-bottom p-3">Giới tính</th>
                  <th class="border-bottom p-3">Chức vụ</th>
                  <th class="border-bottom p-3 ">Xếp hạng</th>
                  <th class="border-bottom p-3">Trạng thái</th>
                  <th class="border-bottom p-3 text-center">Tác vụ</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="doctor" items="${doctors}">
                  <tr>
                    <td>${doctor.id}</td>
                    <td>${doctor.fullName}</td>
                    <td>${doctor.gender}</td>
                    <td>${doctor.position}</td>
                    <td>${doctor.name}</td>
                    <td>${doctor.status}</td>
                    <td class="p-3 text-center">
                      <a href="#">
                        <button class="btn btn-primary"
                                onclick="window.location.href='${pageContext.request.contextPath}/management/doctor/detail?id=${doctor.id}'"
                        >Chi tiết
                        </button>
                      </a>
                      <a href="#">
                        <button class="btn btn-danger"
                                onclick="window.location.href='${pageContext.request.contextPath}/management/doctor/delete?id=${doctor.id}'"
                        >Xóa
                        </button>
                      </a>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <c:set var="page" value="${currentPage}"/>
        <div class="row text-center">
          <div class="col-12 mt-4">
            <div class="d-md-flex align-items-center text-center justify-content-between">
              <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                <c:forEach begin="${1}" end="${totalPage}" var="i">
                  <li class="page-item ${i==page?"active":""}"><a class="page-link"
                                                                  href="${url}?page=${i}&search=${search}">${i}</a>
                  </li>
                </c:forEach>
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
<script>
  $(document).ready(function () {
    $("#btn-search").click(function () {
      let search = $("#search").val();
      window.location.href = "${url}?search=" + search;
    });
  });
</script>
</body>
</html>
