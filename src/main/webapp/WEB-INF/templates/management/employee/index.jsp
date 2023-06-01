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
                    <div class="col-md-8 col-sm-12 row">
                        <div class="col-md-4">
                            <h5 class="mb-0">Nhân sự</h5>
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
                        <a href="${pageContext.request.contextPath}/management/employee/create">
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
                                    <th class="border-bottom p-3">Tên</th>
                                    <th class="border-bottom p-3">Ngày sinh</th>
                                    <th class="border-bottom p-3">Giới tính</th>
                                    <th class="border-bottom p-3">Email</th>
                                    <th class="border-bottom p-3">Trạng thái</th>
                                    <th class="border-bottom p-3 text-center">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${employees}" var="e">
                                    <tr>
                                        <td>${e.id}</td>
                                        <td>${e.name}</td>
                                        <td>${e.dob}</td>
                                        <td>${e.gender}</td>
                                        <td>${e.email}</td>
                                        <td>${e.status}</td>
                                        <td class="text-center">
                                            <a href="#">
                                                <button class="btn btn-primary"
                                                        onclick="window.location.href='${pageContext.request.contextPath}/management/employee/update?id=${e.id}'"
                                                >Sửa
                                                </button>
                                            </a>
                                            <a href="#">
                                                <button class="btn btn-danger">Xóa</button>
                                            </a>
                                        <td>
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
                                                                                    href="${url}?page=${i}">${i}</a>
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
</body>
</html>