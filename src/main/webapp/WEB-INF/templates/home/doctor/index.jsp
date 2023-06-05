<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<jsp:include page="../layout/header.jsp"/>

<body>
<jsp:include page="../layout/preloader.jsp"/>

<jsp:include page="../layout/menu-header-white.jsp"/>

<section class="bg-half-150 bg-light d-table w-100">
    <div class="container">
        <div class="row mt-5 justify-content-center">
            <div class="col-12">
                <div class="section-title text-center">
                    <h3 class="sub-title mb-4">Danh sách bác sĩ</h3>
                    <p class="para-desc mx-auto text-muted">Nếu bạn,người nhà của mình cần nhận được sự trợ giúp ngay
                        lập tức, điều trị khẩn cấp hãy đặt lịch hẹn.</p>
                    <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                        <ul class="breadcrumb bg-transparent mb-0">
                            <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="#">Bác sĩ</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-lg-9 row align-items-center">
                <div class="col-xl-4 col-lg-4 col-md-6 mt-2 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-person position-relative overflow-hidden">
                            <img src="https://tamanhhospital.vn/wp-content/uploads/2021/03/bac-si-tang-ha-nam-anh.png"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="img-fluid" alt="">
                        </div>
                        <div class="card-body">
                            <a href="#" class="title text-dark h5 d-block mb-0">Nguyen Thi Huyen</a>
                            <small class="text-muted speciality">Răng hàm mặt</small>
                            <br>
                            <small class="text-muted speciality">Chức vụ : Trưởng phòng</small>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                </ul>
                                <p class="text-muted mb-0">6 feedbacks</p>
                            </div>
                            <small class="text-muted speciality">Phí đặt lịch : <fmt:formatNumber
                                    pattern="#,###,###,###" value="345678"/> đ</small>
                            <div class="pt-2">
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'book?type=appointment&id=${d.doctor_id}'">Đặt
                                    lịch
                                </button>
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'doctor?action=detail&id=${d.doctor_id}'">Chi
                                    tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mt-2 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-person position-relative overflow-hidden">
                            <img src="https://tamanhhospital.vn/wp-content/uploads/2021/03/bac-si-tang-ha-nam-anh.png"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="img-fluid" alt="">
                        </div>
                        <div class="card-body">
                            <a href="#" class="title text-dark h5 d-block mb-0">Nguyen Thi Huyen</a>
                            <small class="text-muted speciality">Răng hàm mặt</small>
                            <br>
                            <small class="text-muted speciality">Chức vụ : Trưởng phòng</small>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                </ul>
                                <p class="text-muted mb-0">6 feedbacks</p>
                            </div>
                            <small class="text-muted speciality">Phí đặt lịch : <fmt:formatNumber
                                    pattern="#,###,###,###" value="345678"/> đ</small>
                            <div class="pt-2">
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'book?type=appointment&id=${d.doctor_id}'">Đặt
                                    lịch
                                </button>
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'doctor?action=detail&id=${d.doctor_id}'">Chi
                                    tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mt-2 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-person position-relative overflow-hidden">
                            <img src="https://tamanhhospital.vn/wp-content/uploads/2021/03/bac-si-tang-ha-nam-anh.png"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="img-fluid" alt="">
                        </div>
                        <div class="card-body">
                            <a href="#" class="title text-dark h5 d-block mb-0">Nguyen Thi Huyen</a>
                            <small class="text-muted speciality">Răng hàm mặt</small>
                            <br>
                            <small class="text-muted speciality">Chức vụ : Trưởng phòng</small>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                </ul>
                                <p class="text-muted mb-0">6 feedbacks</p>
                            </div>
                            <small class="text-muted speciality">Phí đặt lịch : <fmt:formatNumber
                                    pattern="#,###,###,###" value="345678"/> đ</small>
                            <div class="pt-2">
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'book?type=appointment&id=${d.doctor_id}'">Đặt
                                    lịch
                                </button>
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'doctor?action=detail&id=${d.doctor_id}'">Chi
                                    tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mt-2 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-person position-relative overflow-hidden">
                            <img src="https://tamanhhospital.vn/wp-content/uploads/2021/03/bac-si-tang-ha-nam-anh.png"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="img-fluid" alt="">
                        </div>
                        <div class="card-body">
                            <a href="#" class="title text-dark h5 d-block mb-0">Nguyen Thi Huyen</a>
                            <small class="text-muted speciality">Răng hàm mặt</small>
                            <br>
                            <small class="text-muted speciality">Chức vụ : Trưởng phòng</small>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                </ul>
                                <p class="text-muted mb-0">6 feedbacks</p>
                            </div>
                            <small class="text-muted speciality">Phí đặt lịch : <fmt:formatNumber
                                    pattern="#,###,###,###" value="345678"/> đ</small>
                            <div class="pt-2">
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'book?type=appointment&id=${d.doctor_id}'">Đặt
                                    lịch
                                </button>
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'doctor?action=detail&id=${d.doctor_id}'">Chi
                                    tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mt-2 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-person position-relative overflow-hidden">
                            <img src="https://tamanhhospital.vn/wp-content/uploads/2021/03/bac-si-tang-ha-nam-anh.png"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="img-fluid" alt="">
                        </div>
                        <div class="card-body">
                            <a href="#" class="title text-dark h5 d-block mb-0">Nguyen Thi Huyen</a>
                            <small class="text-muted speciality">Răng hàm mặt</small>
                            <br>
                            <small class="text-muted speciality">Chức vụ : Trưởng phòng</small>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                </ul>
                                <p class="text-muted mb-0">6 feedbacks</p>
                            </div>
                            <small class="text-muted speciality">Phí đặt lịch : <fmt:formatNumber
                                    pattern="#,###,###,###" value="345678"/> đ</small>
                            <div class="pt-2">
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'book?type=appointment&id=${d.doctor_id}'">Đặt
                                    lịch
                                </button>
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'doctor?action=detail&id=${d.doctor_id}'">Chi
                                    tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mt-2 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-person position-relative overflow-hidden">
                            <img src="https://tamanhhospital.vn/wp-content/uploads/2021/03/bac-si-tang-ha-nam-anh.png"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="img-fluid" alt="">
                        </div>
                        <div class="card-body">
                            <a href="#" class="title text-dark h5 d-block mb-0">Nguyen Thi Huyen</a>
                            <small class="text-muted speciality">Răng hàm mặt</small>
                            <br>
                            <small class="text-muted speciality">Chức vụ : Trưởng phòng</small>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                </ul>
                                <p class="text-muted mb-0">6 feedbacks</p>
                            </div>
                            <small class="text-muted speciality">Phí đặt lịch : <fmt:formatNumber
                                    pattern="#,###,###,###" value="345678"/> đ</small>
                            <div class="pt-2">
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'book?type=appointment&id=${d.doctor_id}'">Đặt
                                    lịch
                                </button>
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'doctor?action=detail&id=${d.doctor_id}'">Chi
                                    tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mt-2 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-person position-relative overflow-hidden">
                            <img src="https://tamanhhospital.vn/wp-content/uploads/2021/03/bac-si-tang-ha-nam-anh.png"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="img-fluid" alt="">
                        </div>
                        <div class="card-body">
                            <a href="#" class="title text-dark h5 d-block mb-0">Nguyen Thi Huyen</a>
                            <small class="text-muted speciality">Răng hàm mặt</small>
                            <br>
                            <small class="text-muted speciality">Chức vụ : Trưởng phòng</small>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                </ul>
                                <p class="text-muted mb-0">6 feedbacks</p>
                            </div>
                            <small class="text-muted speciality">Phí đặt lịch : <fmt:formatNumber
                                    pattern="#,###,###,###" value="345678"/> đ</small>
                            <div class="pt-2">
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'book?type=appointment&id=${d.doctor_id}'">Đặt
                                    lịch
                                </button>
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'doctor?action=detail&id=${d.doctor_id}'">Chi
                                    tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mt-2 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-person position-relative overflow-hidden">
                            <img src="https://tamanhhospital.vn/wp-content/uploads/2021/03/bac-si-tang-ha-nam-anh.png"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="img-fluid" alt="">
                        </div>
                        <div class="card-body">
                            <a href="#" class="title text-dark h5 d-block mb-0">Nguyen Thi Huyen</a>
                            <small class="text-muted speciality">Răng hàm mặt</small>
                            <br>
                            <small class="text-muted speciality">Chức vụ : Trưởng phòng</small>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                </ul>
                                <p class="text-muted mb-0">6 feedbacks</p>
                            </div>
                            <small class="text-muted speciality">Phí đặt lịch : <fmt:formatNumber
                                    pattern="#,###,###,###" value="345678"/> đ</small>
                            <div class="pt-2">
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'book?type=appointment&id=${d.doctor_id}'">Đặt
                                    lịch
                                </button>
                                <button class="btn btn-soft-primary"
                                        onclick="window.location.href = 'doctor?action=detail&id=${d.doctor_id}'">Chi
                                    tiết
                                </button>
                            </div>
                        </div>
                    </div>
                </div>1
            </div>
            <div class="col-lg-3 col-md-3 mt-3 pt-2">
                <div class="card border-0 sidebar sticky-bar rounded shadow">
                    <div class="card-body">
                        <form action="doctor?action=filter" method="POST"
                              onSubmit="document.getElementById('submit').disabled = true;">
                            <div class="widget mb-4 pb-2">
                                <h5 class="widget-title">Lọc</h5>
                                <div class="row align-items-center">
                                    <div class="col-md-12">
                                        <label class="form-label">Giới tính</label>
                                    </div>
                                    <div class="col-md-12">
                                        <select name="gender" class="form-select">
                                            <option <c:if test="${gender == 'all'}"> selected </c:if> value="all">Tất
                                                cả
                                            </option>
                                            <option <c:if test="${gender == 'true'}"> selected </c:if> value="true">
                                                Nam
                                            </option>
                                            <option <c:if test="${gender == 'false'}"> selected </c:if> value="false">
                                                Nữ
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <div class="row align-items-center">
                                    <div class="col-md-12">
                                        <label class="form-label">Chuyên môn</label>
                                    </div>
                                    <div class="col-md-12">
                                        <select name="speciality" class="form-select">
                                            <option <c:if test="${speciality == 'all'}"> selected </c:if> value="all">
                                                Tất cả
                                            </option>
                                            <c:forEach items="${speciality}" var="s">
                                                <option <c:if test="${speciality1 == s.id}"> selected </c:if>
                                                        value="${s.id}">${s.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <button type="submit" class="btn btn-primary">Lọc</button>
                            </div>
                        </form>
                        <div class="widget mb-4 pb-2">
                            <h5 class="widget-title">Sắp xếp</h5>
                            <div class="row align-items-center">
                                <div class="col-md-12">
                                    <select name="gender" onchange="Sort(this.value)" class="form-select">
                                        <option <c:if test="${sort == 'all'}"> selected </c:if> value="all">Tất cả
                                        </option>
                                        <option <c:if test="${sort == 'star'}"> selected </c:if> value="star">Star
                                        </option>
                                        <option <c:if test="${sort == 'latest'}"> selected </c:if> value="latest">Mới
                                            nhất
                                        </option>
                                        <option <c:if test="${sort == 'popular'}"> selected </c:if> value="popular">Phổ
                                            biến
                                        </option>
                                        <option <c:if test="${sort == 'fee-'}"> selected </c:if> value="fee-">Phí giảm
                                            dần
                                        </option>
                                        <option <c:if test="${sort == 'fee'}"> selected </c:if> value="fee">Phí tăng
                                            dần
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:set var="page" value="${page}"/>
        <div class="row text-center">
            <div class="col-12 mt-4">
                <div class="d-md-flex align-items-center text-center justify-content-between">
                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                        <c:forEach begin="${1}" end="${num}" var="i">
                            <li class="page-item ${i==page?"active":""}"><a class="page-link"
                                                                            href="${url}&page=${i}">${i}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../layout/footer.jsp"/>
<a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i
        data-feather="arrow-up" class="icons"></i></a>

<div class="modal fade" id="watchvideomodal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content video-modal rounded overflow-hidden">
            <div class="ratio ratio-16x9">
                <iframe src="https://www.youtube.com/embed/QIvIN8M91x4" title="YouTube video" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/libs/tobii/js/tobii.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>

</body>

</html>