<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="top-header">
    <div class="header-bar d-flex justify-content-between border-bottom">
        <div class="d-flex align-items-center">
            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                <i class="uil uil-bars"></i>
            </a>
        </div>

        <ul class="list-unstyled mb-0">
            <li class="list-inline-item mb-0 ms-1">
                <div class="dropdown dropdown-primary">
                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
                            src="${pageContext.request.contextPath}/static/images/user.png" class="avatar avatar-ex-small rounded-circle" alt="">
                    </button>
                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3"
                         style="min-width: 200px;">
                        <a class="dropdown-item d-flex align-items-center text-dark" href="#">
                            <img src="${pageContext.request.contextPath}/static/images/user.png"
                                 class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                            <div class="flex-1 ms-2">
                                <span class="d-block mb-1">Nguyễn Thị Huyền</span>
                                <small class="text-muted">Huyennt1</small>
                            </div>
                        </a>
                        <div class="dropdown-divider border-top"></div>
                        <a class="dropdown-item text-dark" href="${pageContext.request.contextPath}/auth/logout"><span
                                class="mb-0 d-inline-block me-1"><i
                                class="uil uil-sign-out-alt align-middle h6"></i></span> Đăng xuất </a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
