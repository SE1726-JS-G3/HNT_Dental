<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 6/7/2023
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
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
                            <h5 class="mb-0">Bác sĩ</h5>
                        </div>
                        <div class="col-md-8">
                            <div class="search-bar p-0 d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form action="#" method="POST" id="searchform"
                                          class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="txt"
                                                   id="s" placeholder="Tìm kiếm bác sĩ...">
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
                                    <th class="border-bottom p-3">Tên bệnh nhân</th>
                                    <th class="border-bottom p-3">ID bệnh nhân</th>
                                    <th class="border-bottom p-3">Ngày đặt lịch</th>
                                    <th class="border-bottom p-3">Giờ đặt lịch</th>
                                    <th class="border-bottom p-3">Trạng thái</th>
                                    <th class="border-bottom p-3 text-center">Tác vụ</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="p-3">55</td>
                                    <td class="p-3">Phạm Cao Đức Minh</td>
                                    <td class="p-3">12</td>
                                    <td class="p-3">06/06/2023</td>
                                    <td class="p-3">10:00:00 AM</td>
                                    <td class="p-3">Assigned</td>
                                    <td class="p-3">3</td>
                                    <td class="p-3 text-center">
                                        <a href="#">
                                            <button class="btn btn-primary">Chi tiết</button>
                                        </a>
                                        <a href="#">
                                            <button class="btn btn-danger">Sửa</button>
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
