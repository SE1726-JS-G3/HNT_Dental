<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
        <div class="sidebar-brand">
            <a href="home">
                <img src="${pageContext.request.contextPath}/static/images/logo.png" height="180" width="200" class="logo-light-mode" alt="">
            </a>
        </div>

        <ul class="sidebar-menu pt-3">
            <li><a href="#"><i class="uil uil-dashboard me-2 d-inline-block"></i>Bảng điều khiển</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/management/employee"><i class="uil uil-user me-2 d-inline-block"></i>Quản lý nhân viên</a></li>
            <li><a href="${pageContext.request.contextPath}/management/doctor"><i class="uil uil-user me-2 d-inline-block"></i>Quản lý bác sĩ</a></li>
            <li><a href="${pageContext.request.contextPath}/management/patient"><i class="uil uil-user me-2 d-inline-block"></i>Quản lý bệnh nhân</a></li>
            <li><a href="${pageContext.request.contextPath}/management/service"><i class="uil uil-user me-2 d-inline-block"></i>Quản lý dịch vụ</a></li>
            <li><a href="${pageContext.request.contextPath}/management/appointment"><i class="uil uil-user me-2 d-inline-block"></i>Quản lý lịch hẹn</a></li>
            <li><a href="${pageContext.request.contextPath}/management/blog"><i class="uil uil-user me-2 d-inline-block"></i>Quản lý bài đăng</a></li>
            <li><a href="#"><i class="uil uil-user me-2 d-inline-block"></i>Cài đặt</a></li>
        </ul>
    </div>
</nav>
