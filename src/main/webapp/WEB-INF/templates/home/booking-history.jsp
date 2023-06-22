<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 6/3/2023
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
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
                                    <th class="border-bottom p-3" style="min-width: 10px;">#</th>
                                    <th class="border-bottom p-3" style="min-width: 190px;">Bác sĩ</th>
                                    <th class="border-bottom p-3">Mã bác sĩ</th>
                                    <th class="border-bottom p-3" style="min-width: 120px;">Ngày</th>
                                    <th class="border-bottom p-3" style="min-width: 30px;">Thời gian</th>
                                    <th class="border-bottom p-3">Trạng thái</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th class="p-3">1</th>
                                    <td class="p-3">
                                        <a href="#" class="text-dark">
                                            <div class="d-flex align-items-center">
                                                <img src="https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2020/10/meme-hai-huoc-moi-nhat-150.jpg"
                                                     class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <span class="ms-2">${a.doctor.doctor_name}</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td class="p-3">1</td>
                                    <td class="p-3">03/06/2023</td>
                                    <td class="p-3">10AM</td>
                                    <td class="p-3">Tôi cần niềng răng</td>
                                    <c:if test="${a.status == 'Complete'}">
                                        <td>
                                            <button style="padding: -40px" class="btn btn-soft-primary"
                                                    onclick="window.location.href = 'doctor?action=detail&id=${a.doctor.doctor_id}&allow=true'">
                                                Đánh giá
                                            </button>
                                        </td>
                                    </c:if>
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
