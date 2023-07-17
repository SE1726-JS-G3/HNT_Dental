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
                        <h5 class="mb-0">Lịch hẹn chi tiết</h5>
                    </div>
                    <div class="p-4">
                        <form action="doctor?action=updateappointmentstatus&id=${a.id}" method="POST"
                              enctype="multipart/form-data">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Tên bệnh Nhân</label>
                                        <input readonly value="" type="email"
                                               class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Tên dịch vụ</label>
                                        <input readonly value="" type="email"
                                               class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Loại dịch vụ</label>
                                        <input readonly value="" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Giá</label>
                                        <input readonly value="" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Ngày đặt lịch</label>
                                        <input name="appointment_id" readonly value="" type="text"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Giờ đặt lịch</label>
                                        <input name="appointment_id" readonly value="" type="text"
                                               class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Nhân viên hỗ trợ</label>
                                        <input readonly value="" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Bác sĩ phụ trách</label>
                                        <input readonly value="" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Trạng thái</label>
                                        <input readonly value="" type="text" class="form-control">

                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="card border-0 shadow overflow-hidden mt-4">
                            <div class="p-4 border-bottom">
                                <h5 class="mb-0">Kết quả khám</h5>
                            </div>
                            <form action="${pageContext.request.contextPath}/management/booking/result"
                                  method="POST">
                                <div class="row tab-content p-4">
                                    <div class="col-lg-12">
                                        <input hidden="" name="id" value="${param.id}">
                                        <div class="mb-3">
                                            <label class="form-label">Kết quả khám bao gồm kết luần của bác sĩ + đơn thuốc + Phim XQ (nếu có)</label>
                                            <textarea name="result" class="form-control attachments"
                                                      rows="3">${bookingResult.result}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
<br> <br>
                        <div class="col-md-6">

                            <button class="btn btn-info active" type="button">
                                Hủy đặt lịch
                            </button>
                            <button class="btn btn-primary active" type="button">
                                Đánh giá
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Start Modal -->
<div class="modal fade" id="newblogadd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel">Đây là trang hiển thị kết quả khám</h5>
                <button type="button" class="btn btn-icon btn-close" data-bs-dismiss="modal" id="close-modal"><i
                        class="uil uil-times fs-4 text-dark"></i></button>
            </div>

            <div class="modal-body p-3 pt-4">
                <div class="row">
                    <div class="col-12">
                        <div class="ms-md-4">
                            <form>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Blog Title <span
                                                    class="text-danger">*</span></label>
                                            <input name="name" id="name" type="text" class="form-control"
                                                   placeholder="Title :">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label"> Date : </label>
                                            <input name="date" type="text" class="form-control start" id="date"
                                                   value="Select date:">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label"> Time to read : </label>
                                            <input name="time" type="text" class="form-control" id="time"
                                                   value="5 min read">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Tag</label>
                                            <select class="form-select form-control">
                                                <option value="EY">Eye Care</option>
                                                <option value="GY">Gynecologist</option>
                                                <option value="PS">Psychotherapist</option>
                                                <option value="OR">Orthopedic</option>
                                                <option value="DE">Dentist</option>
                                                <option value="GA">Gastrologist</option>
                                                <option value="UR">Urologist</option>
                                                <option value="NE">Neurologist</option>
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Description <span
                                                    class="text-danger">*</span></label>
                                            <textarea name="comments" id="comments" rows="4" class="form-control"
                                                      placeholder="Blog description :"></textarea>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-lg-12 text-end">
                                        <button type="submit" class="btn btn-primary">Add Blog</button>
                                    </div><!--end col-->
                                </div>
                            </form>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
                <div class="d-grid">
                    <label class="btn-upload btn btn-primary mt-4">Tải xuống</label>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End modal -->

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
