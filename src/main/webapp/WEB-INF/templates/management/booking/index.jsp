<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="col-md-5 row">
                        <div class="col-md-4">
                            <h5 class="mb-0"> Quản lý lịch hẹn</h5>
                        </div>
                        <div class="col-md-7">
                            <div class="search-bar p-0 d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form action="doctormanage?action=search" method="POST" id="searchform"
                                          class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="txt"
                                                   id="s" placeholder="Tìm kiếm ...">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <form action="doctormanage?action=filter" method="POST"
                              onSubmit="document.getElementById('submit').disabled = true;">
                            <div class="justify-content-md-end row">
                                <div class="col-md-5 row align-items-center">
                                    <div class="col-md-3">
                                        <label class="form-label">Dịch vu</label>
                                    </div>
                                    <div class="col-md-9">
                                        <select  name="serviceHome" class="form-select">
                                            <option value="all">Tất cả</option>
                                            <c:forEach items="${services}" var="s">
                                                <option value="${s.id}">${s.service.name}</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                </div>


                                <div class="col-md-5 row align-items-center">
                                    <div class="col-md-4">
                                        <label class="form-label">Trạng thái</label>
                                    </div>
                                    <div class="col-md-8">
                                        <select  name="serviceHome" class="form-select">
                                            <option value="all">Tất cả</option>
                                            <c:forEach items="${status}" var="st">
                                                <c:if test="${st.status == true}">
                                                    <option >Đã thanh toán</option>
                                                </c:if>
                                                <c:if test="${st.status == false}">
                                                    <option >Chưa thanh toán</option>
                                                </c:if>
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
                                    <th class="border-bottom p-3">Tên bệnh nhân</th>
                                    <th class="border-bottom p-3">Dịch vụ</th>
                                    <th class="border-bottom p-3">Ngày khám bệnh</th>
                                    <th class="border-bottom p-3">Thời gian</th>
                                    <th class="border-bottom p-3">Trạng thái</th>
                                    <th class="border-bottom p-3 text-center">Tác vụ</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${bookings}" var="b">
                                    <tr>
                                        <td>${b.id}</td>
                                        <td>${b.name}</td>
                                        <td>${b.service.name}</td>
                                        <td>${b.date}</td>
                                        <td>${b.time}</td>

                                        <td>
                                            <c:if test="${b.status == true}">
                                                Đã thanh toán
                                            </c:if>

                                            <c:if test="${b.status == false}">
                                                Chưa thanh toán
                                            </c:if>
                                        </td>
                                        <td class="text-center">
                                            <button class="btn btn-primary"
                                                    onclick="window.location.href='${pageContext.request.contextPath}/management/booking/detail'"
                                            >Chi tiết
                                            </button>
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
<!--View Appoiment-->
<div class="modal fade" id="viewappointment" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel1">Chi tiết lịch hẹn</h5>
                <button type="button" class="btn btn-icon btn-close" data-bs-dismiss="modal" id="close-modal"><i
                        class="uil uil-times fs-4 text-dark"></i></button>
            </div>
            <div class="modal-body p-3 pt-4">
                <div class="d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/static/images/user.png"
                         class="avatar avatar-small rounded-pill" alt="">
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
<script>
    $(document).ready(function () {
        $("#btn-search").click(function () {
            let search = $("#search").val();
            window.location.href = "${url}?search=" + search;
        });
    });
</script>
<script src="${pageContext.request.contextPath}/static/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>
</body>
</html>