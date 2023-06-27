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
                    <div class="col-lg-6 col-md-6">
                        <div class="bg-white rounded shadow overflow-hidden">
                            <div class="p-4 border-bottom">
                                <h5 class="mb-0">Thông tin bệnh nhân</h5>
                            </div>
                            <br><br><br><br><br>
                            <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                <img src="${pageContext.request.contextPath}/static/images/user.png"
                                     class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                <h5 class="mt-3 mb-1">${appointment.patient.account.name}</h5>
                            </div>

                            <div class="list-unstyled p-4">
                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-user align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Giới tính</h6>
                                    <c:if test="${appointment.patient.account.gender == true}">
                                        <p class="text-muted mb-0 ms-2">Nam</p>
                                    </c:if>
                                    <c:if test="${appointment.patient.account.gender == false}">
                                        <p class="text-muted mb-0 ms-2">Nữ</p>
                                    </c:if>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-book-open align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Số điện thoại</h6>
                                    <p class="text-muted mb-0 ms-2">0${appointment.patient.account.phone}</p>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-medical-drip align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Tuổi</h6>
                                    <p class="text-muted mb-0 ms-2"><fmt:formatDate pattern="dd/MM/yyyy"
                                                                                    value="${appointment.patient.DOB}"/></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 ">
                        <div class="bg-white rounded shadow overflow-hidden">
                            <div class="p-4 border-bottom">
                                <h5 class="mb-0">Thông tin bác sĩ</h5>
                            </div>
                            <br><br><br><br><br>
                            <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                <c:if test="${appointment.doctor.img == 'default'}">
                                    <img src="assets/images/avata.png"
                                         class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                </c:if>
                                <c:if test="${appointment.doctor.img != 'default'}">
                                    <img src="data:image/png;base64,${appointment.doctor.img}"
                                         class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                </c:if>
                                <h5 class="mt-3 mb-1">${appointment.doctor.doctor_name}</h5>
                            </div>

                            <div class="list-unstyled p-4">
                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-user align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Giới tính</h6>
                                    <c:if test="${appointment.doctor.gender == true}">
                                        <p class="text-muted mb-0 ms-2">Nam</p>
                                    </c:if>
                                    <c:if test="${appointment.doctor.gender == false}">
                                        <p class="text-muted mb-0 ms-2">Nữ</p>
                                    </c:if>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-book-open align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Rank</h6>
                                    <p class="text-muted mb-0 ms-2">0${appointment.doctor.phone}</p>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-book-open align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Chuyên môn</h6>
                                    <p class="text-muted mb-0 ms-2">${appointment.doctor.description}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card border-0 shadow overflow-hidden mt-4">
                    <div class="p-4 border-bottom">
                        <h5 class="mb-0">Thông tin lịch hẹn</h5>
                    </div>
                    <div class="tab-content p-4">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">Ngày hẹn</label>
                                    <p><fmt:formatDate pattern="dd/MM/yyyy" value="${appointment.date}"/></p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">Thời gian</label>
                                    <p>${appointment.time}</p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">Trạng thái</label>
                                    <p>${appointment.status}</p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">Nhân viên hỗ trợ</label>
                                    <p>${appointment.staff.name}</p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">Phí tư vấn</label>
                                    <p><fmt:formatNumber pattern="##########" value="${appointment.fee}"/> đ</p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">Thông tin</label>
                                    <p>${appointment.description}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card border-0 shadow overflow-hidden mt-4">
                    <div class="p-4 border-bottom">
                        <h5 class="mb-0">Cập nhật thông tin</h5>
                    </div>
                    <form action=""
                          method="POST">
                        <div class="tab-content p-4" id="pills-tabContent">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">Phí tư vấn</label>
                                    <input name="fee" oninvalid="CheckNumber(this);" oninput="CheckNumber(this);"
                                           id="number" type="number" class="form-control" value="${appointment.fee}">
                                </div>
                            </div>
                        </div>
                        <c:if test="${sessionScope.user.role.role_id == 1}">
                            <div class="tab-content p-4" id="pills-tabContent">
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label">Nhân viên hỗ trợ</label>
                                        <select name="staff" class="form-select">
                                            <option
                                                    class="form-control" value=""></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <div class="tab-content p-4" id="pills-tabContent">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">Trạng thái</label>
                                    <select name="status" class="form-select" aria-label="Default select example">
                                        <option

                                                value="Complete">Complete
                                        </option>
                                        <option
                                                value="Assigned">Assigned
                                        </option>
                                        <option
                                                value="Pending">Pending
                                        </option>
                                        <option
                                                value="Cancelled">Cancelled
                                        </option>
                                    </select>
                                </div>
                                <div class="tab-content p-0">
                                    <input type="submit" id="submit" name="send" class="btn btn-primary"
                                           value="Cập nhật">
                                </div>
                            </div>
                        </div>
                    </form>
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