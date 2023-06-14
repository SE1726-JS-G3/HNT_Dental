<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<jsp:include page="layout/header.jsp"/>

<body>
<jsp:include page="layout/preloader.jsp"/>

<jsp:include page="layout/menu-header-default.jsp"/>
<section class="bg-half-170 d-table w-100" id="home" style="background-size:cover;background-repeat: no-repeat;background-position: center -300px;background-image: url('${pageContext.request.contextPath}/static/images/banner.jpg') ">
    <div class="bg-overlay bg-overlay-dark"></div>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-xl-10">
                <div class="heading-title text-center pt-5">
                    <img src="#" height="50" alt="">
                    <h4 class="heading fw-bold text-white title-dark mt-3 mb-4">Hệ thống đặt lịch trực tuyến</h4>
                    <p class="para-desc mx-auto text-white-50 mb-0">Chúng tôi luôn đồng hành cùng bạn trên con đường chăm sóc
                        răng miệng</p>

                    <div class="mt-4 pt-2">
                        <form class="rounded text-start shadow p-4 bg-white-50">
                            <div class="row align-items-center">
                                <div class="col-md">
                                    <div class="input-group bg-white border rounded" style="opacity: 0.7;">
                                        <span class="input-group-text border-0"><i class="ri-map-pin-line text-primary h5 fw-normal mb-0"></i></span>
                                        <input name="name" id="location" type="text" class="form-control border-0" placeholder="Bác sĩ:">
                                    </div>
                                </div><!--end col-->

                                <div class="col-md mt-4 mt-sm-0">
                                    <div class="input-group bg-white border rounded" style="opacity: 0.7;">
                                        <span class="input-group-text border-0"><i class="ri-user-2-line text-primary h5 fw-normal mb-0"></i></span>
                                        <input name="name" id="name" type="text" class="form-control border-0" placeholder="Dịch vụ:">
                                    </div>
                                </div><!--end col-->

                                <div class="col-md-auto mt-4 mt-sm-0">
                                    <div class="d-grid d-md-block">
                                        <button type="submit" class="btn btn-primary">Đặt lịch ngay</button>
                                    </div>
                                </div><!--end col-->
                            </div><!--end row-->
                        </form><!--end form-->
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section><!--end section-->


<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10">
                <div class="features-absolute bg-white shadow rounded overflow-hidden card-group">
                    <div class="card border-0 bg-light p-4">
                        <i class="ri-heart-pulse-fill text-primary h2 mb-0"></i>
                        <h5 class="mt-1">Dịch vụ sức khỏe</h5>
                        <p class="text-muted mt-2">Chúng tôi đem đến cho bạn những dịch vụ chất lượng tốt nhất trên thị
                            trường.</p>
                        <a href="#" class="text-primary">Tìm hiểu ngay <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>

                    <div class="card border-0 p-4">
                        <i class="ri-dossier-fill text-primary h2 mb-0"></i>
                        <h5 class="mt-1">Đặt lịch trực tuyến</h5>
                        <p class="text-muted mt-2">Đội ngũ bác sĩ luôn sẵn sàng tư vấn và thăm khám dành riêng cho
                            bạn.</p>
                        <br>
                        <a href="#" class="text-primary">Tìm hiểu ngay <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>

                    <div class="card border-0 bg-light p-4">
                        <i class="ri-time-fill text-primary h2 mb-0"></i>
                        <h5 class="mt-1">Thời gian hoạt động</h5>
                        <ul class="list-unstyled mt-2">
                            <li class="d-flex justify-content-between">
                                <p class="text-muted mb-0">Thứ 2 - Thứ 6</p>
                                <p class="text-primary mb-0">8.00 - 20.00</p>
                            </li>
                            <li class="d-flex justify-content-between">
                                <p class="text-muted mb-0">Thứ 7</p>
                                <p class="text-primary mb-0">8.00 - 18.00</p>
                            </li>
                            <li class="d-flex justify-content-between">
                                <p class="text-muted mb-0">Chủ nhật</p>
                                <p class="text-primary mb-0">8.00 - 14.00</p>
                            </li>
                        </ul>
                        <a href="#" class="text-primary">Tìm hiểu ngay <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container mt-100 mt-60">
        <div class="row align-items-center">

            <div class="container mt-100 mt-60">
                <div class="row align-items-center">
                    <div class="col-lg-5 col-md-6">
                        <div class="position-relative">
                            <img src="https://th.bing.com/th/id/OIP.1Kgp-3ykxQUzsKXgie0N3AHaE8?pid=ImgDet&w=1920&h=1281&rs=1" class="img-fluid" alt="">
                            <div class="play-icon">
                                <a href="#" data-type="youtube" data-id="yba7hPeTSjk" class="play-btn lightbox video-play-icon">
                                    <i class="mdi mdi-play text-primary rounded-circle shadow"></i>
                                </a>
                            </div>
                        </div>
                    </div><!--end col-->

            <div class="col-lg-7 col-md-6 mt-4 mt-lg-0 pt- pt-lg-0">
                <div class="ms-lg-4">
                    <div class="section-title">
                        <h4 class="title mb-4">Vì sao nên chọn HNT Dental?</h4>
                        <p class="text-muted para-desc">Chúng tôi quy tụ đội ngũ chuyên gia, bác sĩ, dược sĩ và điều
                            dưỡng có trình độ chuyên môn cao, tay nghề giỏi, tận tâm và chuyên nghiệp</p>
                        <p class="text-muted para-desc mb-0">Luôn đặt người bệnh làm trung tâm, Doctris cam kết đem đến
                            dịch vụ chăm sóc sức khỏe tốt nhất cho khách hàng.</p>
                    </div>

                    <div class="mt-4">
                        <a href="#" class="btn btn-primary">Tìm hiểu nhiều hơn.. <i
                                class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="section-title text-center mb-4 pb-2">
                    <span class="badge badge-pill badge-soft-primary mb-3">Dịch vụ chăm sóc sức khỏe</span>
                    <h4 class="title mb-4">Những dịch vụ nổi bật của chúng tôi</h4>
                    <p class="text-muted mx-auto para-desc mb-0">Đội ngũ Doctris luôn đem đến cho bạn những dịch vụ chăm
                        sóc sức khỏe hiện đại và tốt nhất trên thị trường với những bác sĩ chuyên sâu trong các lĩnh vực
                        .</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-md-4 col-12 mt-5">
                <div class="card features feature-primary border-0">
                    <div class="icon text-center rounded-md">
                        <i class="ri-eye-fill h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Niềng răng</a>
                        <p class="text-muted mt-3">Niềng răng là giải pháp chỉnh nha được rất nhiều người lựa chọn để cải thiện thẩm mỹ răng miệng khi răng bị các khuyết điểm như: móm, hô, thưa, khấp khểnh để trở nên tự tin hơn trong giao tiếp.</p>
                        <a href="departments.html" class="link">Đọc thêm <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-md-4 col-12 mt-5">
                <div class="card features feature-primary border-0">
                    <div class="icon text-center rounded-md">
                        <i class="ri-psychotherapy-fill h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Tẩy trắng răng</a>
                        <p class="text-muted mt-3">Tẩy trắng răng là phương pháp để làm sạch các vết ố vàng, lớp mảng bám trên răng</p>
                        <a href="departments.html" class="link"> Đọc thêm <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-md-4 col-12 mt-5">
                <div class="card features feature-primary border-0">
                    <div class="icon text-center rounded-md">
                        <i class="ri-stethoscope-fill h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Nhổ răng</a>
                        <p class="text-muted mt-3">Nhổ răng không đau bằng những phương pháp tiên tiến</p>
                        <a href="departments.html" class="link">Đọc thêm  <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-md-4 col-12 mt-5">
                <div class="card features feature-primary border-0">
                    <div class="icon text-center rounded-md">
                        <i class="ri-capsule-fill h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Làm răng sứ</a>
                        <p class="text-muted mt-3">dịch vụ điều trị có sử dụng răng sứ như: bọc răng sứ, trồng răng sứ và kể cả phục hình răng sứ trên Implant.</p>
                        <a href="departments.html" class="link">Đọc thêm <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-md-4 col-12 mt-5">
                <div class="card features feature-primary border-0">
                    <div class="icon text-center rounded-md">
                        <i class="ri-microscope-fill h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Khám tổng quát</a>
                        <p class="text-muted mt-3">Đây là gói dịch vụ dành cho người muốn khám tổng quát răng miệng</p>
                        <a href="departments.html" class="link">Đọc thêm <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-md-4 col-12 mt-5">
                <div class="card features feature-primary border-0">
                    <div class="icon text-center rounded-md">
                        <i class="ri-pulse-fill h3 mb-0"></i>
                    </div>
                    <div class="card-body p-0 mt-3">
                        <a href="departments.html" class="title text-dark h5">Điều trị sâu răng</a>
                        <p class="text-muted mt-3">Điều trị sâu răng bằng nhiều phương pháp tiên tiến , có tể không phải nhổ bỏ răng cữ</p>
                        <a href="departments.html" class="link">Đọc thêm <i class="ri-arrow-right-line align-middle"></i></a>
                    </div>
                </div>
            </div><!--end col-->

        </div><!--end row-->

        <div class="row align-items-center">
            <c:forEach items="${service}" var="s">
                <div class="col-xl-4 col-lg-4 col-md-6 mt-4 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-img position-relative">
                            <img style="height: 14rem;width: 100%" src="data:image/png;base64,${s.img}"
                                 class="img-fluid" alt="">
                        </div>
                        <div class="card-body content text-center">
                            <a href="#" class="title text- h5 d-block mb-0">${s.title}</a>
                            <small class="text-muted speciality">${s.setting.name}</small>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="col-12 mt-4 pt-2 text-center">
                <a href="#" class="btn btn-primary">Tìm kiếm nhiều hơn</a>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="section-title text-center mb-4 pb-2">
                    <span class="badge badge-pill badge-soft-primary mb-3">Dịch vụ bác sĩ</span>
                    <h4 class="title mb-4">Đội ngũ chuyên gia</h4>
                    <p class="text-muted mx-auto para-desc mb-0">Doctris quy tụ đội ngũ chuyên gia, bác sĩ, dược sĩ và
                        điều dưỡng được đào tạo bài bản đến chuyên sâu tại Việt nam và nhiều nước có nên y học phát
                        triển như Mỹ, Anh, Pháp...
                        Luôn lấy người bệnh là trung tâm, Vinmec cam kết mang lại dịch vụ chăm sóc sức khỏe toàn diện và
                        chất lượng cao cho khách hàng.</p>
                </div>
            </div>
        </div>

        <div class="row align-items-center">
            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-img position-relative">
                        <img src="https://th.bing.com/th/id/OIP.3td4iXrLIVfcLZPkZvBTOgHaLG?pid=ImgDet&rs=1" class="img-fluid" alt="">
                        <ul class="list-unstyled team-social mb-0">
                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body content text-center">
                        <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Nguyễn Thị Huyền</a>
                        <small class="text-muted speciality">Niềng răng</small>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-img position-relative">
                        <img src="https://th.bing.com/th/id/R.f174a8ddd6e945ccd74f8870d2b23ea6?rik=Q%2fVrj5h%2f1nYyWw&riu=http%3a%2f%2fhlm.tzuchi.com.tw%2fen-GB%2fmedia%2fk2%2fitems%2fcache%2fd6086de322f98f66cc694f32ea284557_XL.jpg&ehk=%2f0kjLNmtRl5mEZCs6MNk6hjkJj9PavFGiJcgfoah6XM%3d&risl=&pid=ImgRaw&r=0" class="img-fluid" alt="">
                        <ul class="list-unstyled team-social mb-0">
                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body content text-center">
                        <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Trinh Tứ Bảo</a>
                        <small class="text-muted speciality">Tẩy trắng răng</small>
                    </div>
                </div>
            </div><!--end col-->

            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-img position-relative">
                        <img src="https://cih.com.vn/images/aJVU_9229-400x600.jpg" class="img-fluid" alt="">
                        <ul class="list-unstyled team-social mb-0">
                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body content text-center">
                        <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Bùi Minh Mạnh</a>
                        <small class="text-muted speciality">Làm răng sứ</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                <div class="card team border-0 rounded shadow overflow-hidden">
                    <div class="team-img position-relative">
                        <img src="https://th.bing.com/th/id/OIP.IYThokm9bu4ctcCMDgjo6QHaLI?pid=ImgDet&w=1363&h=2048&rs=1" class="img-fluid" alt="">
                        <ul class="list-unstyled team-social mb-0">
                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                        </ul>
                    </div>
                    <div class="card-body content text-center">
                        <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Đào Xuân Trung</a>
                        <small class="text-muted speciality">Khám tổng quát</small>
                    </div>
                </div>
            </div>

        <div class="row">
            <c:forEach items="${doctor}" var="d">
                <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                    <div class="card team border-0 rounded shadow overflow-hidden">
                        <div class="team-img position-relative">
                            <img src="data:image/png;base64,${d.img}"
                                 style="display: block;margin-left: auto;margin-right: auto;" class="rounded img-fluid"
                                 alt="">
                        </div>
                        <div class="card-body content text-center">
                            <a href="doctor?action=detail&id=${d.doctor_id}"
                               class="title text- h5 d-block mb-0">${d.doctor_name}</a>
                            <small class="text-muted speciality">${d.setting.name}</small>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div class="col-12 mt-4 pt-2 text-center">
                <a href="#" class="btn btn-primary">Tìm kiếm nhiều hơn</a>
            </div>
        </div>
    </div>
    </div>
</section>

<section class="section pt-0">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 text-center">
                <div class="video-solution-cta position-relative" style="z-index: 1;">
                    <div class="position-relative">
                        <img src="assets/images/bg/banner.jpg" class="img-fluid rounded-md shadow-lg" alt="">
                        <div class="play-icon">

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>


<jsp:include page="layout/footer.jsp"/>
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