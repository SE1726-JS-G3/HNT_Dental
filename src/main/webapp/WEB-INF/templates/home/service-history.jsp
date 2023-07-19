<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<jsp:include page="layout/header.jsp"/>

<body>
<%--<jsp:include page="layout/preloader.jsp"/>--%>
<jsp:include page="layout/menu-header-white.jsp"/>
<section class="bg-dashboard">
    <div>
        <div class="row justify-content-center">
            <jsp:include page="layout/profile-sidebar.jsp"/>
            <div class="col-xl-8 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
                <h3 class="mb-0"></h3>
                <div class="rounded shadow mt-4">
                    <div class="p-4 border-bottom">
                        <h5 class="mb-0">Lịch sử dịch vụ</h5>
                    </div>
                    <div class="p-2">
                        <div class="table-responsive bg-white shadow rounded">
                            <table class="table mb-0 table-center">
                                <thead>
                                <tr>
                                    <th class="border-bottom p-3" style="min-width: 10px;">ID</th>
                                    <th class="border-bottom p-3" style="min-width: 190px;">Tên dịch vụ </th>
                                    <th class="border-bottom p-3" style="min-width: 190px;">Loại dịch vụ </th>
                                    <th class="border-bottom p-3">Trạng thái</th>
                                    <th class="border-bottom p-3">Tác vụ</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--@elvariable id="list" type="java.util.List"--%>
                                    <tr>
                                        <td class="p-3">1</td>
                                        <td class="p-3">Nhổ răng</td>
                                        <td class="p-3">VIP</td>
                                        <td class="p-3">Hoàn thành</td>
                                        <td class="p-3">
                                            <a href="detail-history-booking?id=${o.account_id}">
                                                <button class="btn btn-primary">Xem dịch vụ</button>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row text-center">
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <li class="page-item active"><a class="page-link">1</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link">1</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link">1</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link">1</a>
                                        <li class="page-item active"><a class="page-link" href="patient-booking-history?page=1">1</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="patient-booking-history?page=2">2</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="layout/footer.jsp"/>
<script src="${pageContext.request.contextPath}/static/libs/tobii/js/tobii.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>

</body>

</html>
