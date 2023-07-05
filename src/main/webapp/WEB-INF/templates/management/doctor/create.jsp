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
                    <h5 class="mb-0">Thêm mới bác sĩ</h5>

                    <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                        <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                            <li class="breadcrumb-item"><a href="#">Quản lí</a></li>
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/management/doctor">bác sĩ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Thêm bác sĩ </li>
                        </ul>
                    </nav>
                </div>

                <div class="row">
                    <div class="col-lg-12 mt-4">
                        <div class="card border-0 p-4 rounded shadow">
                            <div class="row align-items-center">
                                <div class="col-lg-2 col-md-4">
                                    <img src="${pageContext.request.contextPath}/static/images/user.png"
                                         class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                                </div><!--end col-->

                                <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                    <h5 class="">Upload your picture</h5>
                                    <p class="text-muted mb-0">For best results, use an image at least 600px by 600px in
                                        either .jpg or .png format</p>
                                </div><!--end col-->

                                <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                    <a href="#" class="btn btn-primary">Thêm ảnh</a>
                                    <a href="#" class="btn btn-soft-primary ms-2">Xóa ảnh</a>
                                </div><!--end col-->
                            </div><!--end row-->

                            <form class="mt-4" id="your-form-id" action="${pageContext.request.contextPath}/management/doctor/create" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label" for="name">Họ và tên</label>
                                            <input name="full_name" id="name" type="text" class="form-control" placeholder="Họ và tên">
                                            <label id="name-error" class="error" for="name" style="display: none;"></label>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label" for="dob">Ngày sinh</label>
                                            <input name="dob" id="dob" type="text" class="form-control" placeholder="YYYY-MM-DD" value="${param.dob}">
                                            <label id="dob-error" class="error" for="dob" style="display: none;"></label>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <input name="email" id="email" type="email" class="form-control" placeholder="Email :">
                                            <label id="email-error" class="error" for="email" style="display: none;"></label>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ</label>
                                            <input name="address" id="address" type="text" class="form-control" placeholder="Địa chỉ">
                                            <label id="address-error" class="error" for="address" style="display: none;"></label>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Điện thoại</label>
                                            <input name="phone" id="phone" type="text" class="form-control" placeholder="Điện thoại">
                                            <label id="phone-error" class="error" for="phone" style="display: none;"></label>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Chuyên môn</label>
                                            <input name="position" id="position" type="text" class="form-control" placeholder="Chức vụ">
                                            <label id="position-error" class="error" for="position" style="display: none;"></label>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Giới tính</label>
                                            <select name="gender" class="form-select form-control">
                                                <option value="nam">Nam</option>
                                                <option value="nữ">Nữ</option>
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Xếp hạng</label>
                                            <input name="rankId" id="rankId" type="text" class="form-control" placeholder="Xếp hạng">
                                            <label id="rankId-error" class="error" for="rankId" style="display: none;"></label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Trạng thái</label>
                                            <select name="status" class="form-select form-control">
                                                <option value="Đang làm việc">Đang làm việc</option>
                                                <option value="Đã nghỉ việc">Đã nghỉ việc</option>
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Chức vụ</label>
                                            <select name="Role" class="form-select form-control">
                                                <option value="doctor" selected>Doctor</option>
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Mô tả</label>
                                            <textarea name="description" id="comments" rows="3" class="form-control" placeholder="Bio :"></textarea>
                                        </div>
                                    </div>
                                </div><!--end row-->

                                <button type="submit" class="btn btn-primary">Thêm bác sĩ</button>
                            </form>
                        </div>
                    </div><!--end col-->
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $(document).ready(function() {
        $('#your-form-id').validate({
            rules: {
                full_name: {
                    required: true
                },
                dob: {
                    required: true,
                    date: true
                },
                email: {
                    required: true,
                    email: true
                },
                address: {
                    required: true
                },
                phone: {
                    required: true
                },
                position: {
                    required: true
                },
                rankId: {
                    required: true
                }
                // Thêm các quy tắc kiểm tra cho các trường khác
            },
            messages: {
                full_name: {
                    required: "Vui lòng nhập họ và tên"
                },
                dob: {
                    required: "Vui lòng nhập ngày sinh",
                    date: "Vui lòng nhập ngày sinh hợp lệ (YYYY-MM-DD)"
                },
                email: {
                    required: "Vui lòng nhập email",
                    email: "Vui lòng nhập email hợp lệ"
                },
                address: {
                    required: "Vui lòng nhập địa chỉ"
                },
                phone: {
                    required: "Vui lòng nhập số điện thoại"
                },
                position: {
                    required: "Vui lòng nhập chức vụ"
                },
                rankId: {
                    required: "Vui lòng nhập xếp hạng"
                }
                // Thêm thông báo lỗi cho các trường khác
            },
            errorPlacement: function(error, element) {
                element.addClass('error');
                error.addClass('error-message');
                error.insertAfter(element);
            },
            success: function(label, element) {
                $(element).removeClass('error');
                $(element).addClass('is-valid');
                $(element).siblings('.error-message').hide();
            },
            invalidHandler: function(event, validator) {
                var errors = validator.errorList;
                for (var i = 0; i < errors.length; i++) {
                    var element = $(errors[i].element);
                    element.addClass('error');
                    var errorLabel = $('#' + element.attr('name') + '-error');
                    errorLabel.text(errors[i].message);
                    errorLabel.show();
                }

                showErrorAlert();
            },
            submitHandler: function(form) {
                showSuccessAlert(form);
            }
        });

        function showErrorAlert() {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi xác thực',
                text: 'Vui lòng kiểm tra lại các thông tin bên trên'
            }).then(function() {
                $('html, body').animate({
                    scrollTop: $('.error').first().offset().top - 100
                }, 500);
            });
        }

        function showSuccessAlert(form) {
            Swal.fire({
                icon: 'success',
                title: 'Thành công',
                text: 'Đã thêm thành công!'
            }).then(function() {
                form.submit();
            });
        }
    });
</script>
</body>
</html>
