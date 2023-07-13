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
                <div class="d-md-flex justify-content-between">
                    <h5 class="mb-0">Đây là màn update employee của admin sửa</h5>
                    <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                        <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                            <li class="breadcrumb-item"><a href="#">Quản lí</a></li>
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.request.contextPath}/management/employee">Nhân viên</a></li>
                            <li class="breadcrumb-item status" aria-current="page">Thêm nhân viên</li>
                        </ul>
                    </nav>
                </div>

                <div class="row">
                    <div class="col-lg-12 mt-4">
                        <p style="color: red; font-weight: bold; padding: 10px">${error}</p>
                        <div class="card border-0 p-4 rounded shadow">
                            <div class="row align-items-center">
                                <div class="col-lg-2 col-md-4">
                                    <img src="${pageContext.request.contextPath}/static/images/user.png"
                                         class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                                </div>
                                <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                    <h5 class="">Upload your picture</h5>
                                    <p class="text-muted mb-0">For best results, use an image at least 600px by 600px in
                                        either .jpg or .png format</p>
                                </div>

                                <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                    <a href="#" class="btn btn-primary">Thêm ảnh</a>
                                    <a href="#" class="btn btn-soft-primary ms-2">Xóa ảnh</a>
                                </div>
                            </div>

                            <form class="mt-4" action="${pageContext.request.contextPath}/management/employee/update"
                                  method="post">
                                <input value="${employee.account.id}" name="id" type="hidden">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Họ và tên</label>
                                            <input name="full_name" id="name" type="text" class="form-control"
                                                   value="${employee.fullName}"
                                                   placeholder="Họ và tên :">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Ngày sinh</label>
                                            <input name="dob" id="name2" type="text" class="form-control"
                                                   value="${employee.dob}"
                                                   placeholder="DD/MM/YYYY">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <input name="email" id="email" type="email" class="form-control"
                                                   value="${employee.account.email}"
                                                   placeholder="Email :">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ</label>
                                            <input name="address" id="address" type="text" class="form-control"
                                                   placeholder="Địa chỉ" value="${employee.address}">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Điện thoại</label>
                                            <input name="phone" id="phone" type="text" class="form-control"
                                                   placeholder="Điện thoại" value="${employee.phone}">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Chức vụ</label>
                                            <select name="position" class="form-select form-control">
                                                <option>Chọn chức vụ</option>
                                                <option value="marketing"
                                                        <c:if test="${employee.account.role == 3}">
                                                            selected
                                                        </c:if>
                                                >Marketing
                                                </option>
                                                <option value="staff"
                                                        <c:if test="${employee.account.role == 4}">
                                                            selected
                                                        </c:if>
                                                >Staff
                                                </option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Giới tính</label>
                                            <select name="gender" class="form-select form-control">
                                                <option value="nam">Nam</option>
                                                <c:if test="${employee.gender == true}">
                                                    selected
                                                </c:if>
                                                <option value="nu">Nữ</option>
                                                <c:if test="${employee.gender == false}">
                                                    selected
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Lương</label>
                                            <input name="salary" id="number" type="text" class="form-control"
                                                    value="${employee.salary}"
                                                   placeholder="VNĐ">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Mô tả</label>
                                            <textarea name="description" id="comments" rows="3" class="form-control"
                                                      placeholder="Bio :">${employee.description}</textarea>
                                        </div>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </form>
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