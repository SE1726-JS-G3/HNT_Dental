<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<jsp:include page="layout/header.jsp"/>

<body>
<jsp:include page="layout/menu-header-white.jsp"/>

<section class="bg-dashboard">
    <div class="container">
        <div class="row justify-content-center">
            <jsp:include page="layout/profile-sidebar.jsp"/>
            <div class="col-xl-8 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
                <h3 class="mb-0"></h3>
                <div class="rounded shadow mt-4">
                    <div class="p-4 border-bottom">
                        <h5 class="mb-0">Lịch hẹn của tôi</h5>
                        <p style="color: blue; text-align: center;">
                            ${requestScope.updatesuccess}
                        </p>
                    </div>
                    <div class="p-4">
                        <form action="/management/doctor/my-appointment-detail" method="post" onsubmit="return confirmSubmit(${details.id});"><!-- Fix: Added form action -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">ID cuộc hẹn</label>
                                        <input readonly value="${details != null ? details.id : ''}" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Tên bệnh nhân</label>
                                        <input readonly value="${details != null ? details.patient.fullName : ''}" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">ID bệnh nhân</label>
                                        <input readonly value="${details != null ? details.patient.id : ''}" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Ngày đặt lịch</label>
                                        <input readonly value="${details != null ? details.date : ''}" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Giờ đặt lịch</label>
                                        <input readonly value="${details != null ? details.time : ''}" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Trạng thái</label>
                                        <input readonly value="${details != null ? details.status : ''}" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="hidden" name="id" value="${details.id}"> <!-- Fix: Added hidden input field for id -->
                                    <input type="hidden" name="status" value="1"> <!-- Fix: Hard-coded status value as 1 for "Chấp nhận" -->
                                    <input type="submit" id="submit" name="send" class="btn btn-primary active" value="Hoàn thành lịch hẹn"> <!-- Added "active" class to the button -->
                                </div>
                            </div>
                        </form>
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


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath}/static/libs/tobii/js/tobii.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>

<script>
    function confirmSubmit(id) {
        var id = $("input[name='id']").val(); // Lấy giá trị của trường id
        swal({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn muốn hoàn thành lịch hẹn?",
            buttons: ["Hủy bỏ", "Đồng ý"],
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                // Sử dụng Ajax để gửi yêu cầu hoàn thành lịch hẹn
                $.ajax({
                    url: "/management/doctor/my-appointment-detail",
                    type: "POST",
                    data: { id: id, status: 1 },
                    success: function (data) {
                        // Xử lý kết quả trả về từ server
                        if (data.success) {
                            swal("Thành công!", "Lịch hẹn đã được hoàn thành.", "success").then(() => {
                                window.location = "${pageContext.request.contextPath}/management/doctor/my-appointment-detail?id=" + id;
                            });
                        } else {
                            swal("Lỗi!", "Có lỗi xảy ra khi hoàn thành lịch hẹn.", "error");
                        }
                    },
                    error: function () {
                        swal("Lỗi!", "Có lỗi xảy ra khi hoàn thành lịch hẹn.", "error");
                    }
                });
            }
        });

        return false; // Ngăn chặn việc gửi yêu cầu submit của form
    }
</script>
</body>

</html>
