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
                                    <h5 class="">Tải lên ảnh của bạn </h5>
                                    <p class="text-muted mb-0">Để có kết quả tốt nhất , vui lòng sử dụng một hình ảnh ít nhất 600px x 600px trong
                                        định dạng .jpg hoặc .png</p>
                                </div><!--end col-->

                                <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                    <a href="#" class="btn btn-primary">Thêm ảnh</a>
                                    <a href="#" class="btn btn-soft-primary ms-2">Xóa ảnh</a>
                                </div><!--end col-->
                            </div><!--end row-->

                            <form class="mt-4"  action="${pageContext.request.contextPath}/management/doctor/create" method="post"  onSubmit="return validateForm()">
                                <div class="row">
                                    <div id="message-container"></div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label" for="name">Họ và tên</label>
                                            <input name="full_name" id="name" type="text" class="form-control" placeholder="Họ và tên">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label" for="dob">Ngày sinh</label>
                                            <input name="dob" id="dob" type="text" class="form-control" placeholder="YYYY-MM-DD" value="${param.dob}">
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
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Điện thoại</label>
                                            <input name="phone" id="phone" type="text" class="form-control" placeholder="Điện thoại">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Chuyên môn</label>
                                            <input name="position" id="position" type="text" class="form-control" placeholder="Chức vụ">
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
                                                <option value="doctor" selected>Bác sĩ</option>
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Mô tả</label>
                                            <textarea name="description" id="comments" rows="3" class="form-control" placeholder="Mô tả :"></textarea>
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
    function validateForm() {
        var fullName = document.getElementById('name').value;
        var dob = document.getElementById('dob').value;
        var email = document.getElementById('email').value;
        var address = document.getElementById('address').value;
        var phone = document.getElementById('phone').value;
        var position = document.getElementById('position').value;
        var rankId = document.getElementById('rankId').value;

        // Perform field validation
        if (fullName.trim() === '') {
            displayErrorMessage('Họ và tên không được bỏ trống');
            return false;
        }
        if (dob.trim() === '') {
            displayErrorMessage('Ngày sinh không được bỏ trống');
            return false;
        }
        if (!isValidDateFormat(dob)) {
            displayErrorMessage('Ngày sinh phải có định dạng YYYY-MM-DD');
            return false;
        }
        if (email.trim() === '') {
            displayErrorMessage('Email không được bỏ trống');
            return false;
        }
        if (!isValidEmailAddress(email)) {
            displayErrorMessage('Email không hợp lệ');
            return false;
        }
        if (address.trim() === '') {
            displayErrorMessage('Địa chỉ không được bỏ trống');
            return false;
        }
        if (phone.trim() === '') {
            displayErrorMessage('Điện thoại không được bỏ trống');
            return false;
        }
        if (!isValidPhoneNumber(phone)) {
            displayErrorMessage('Số điện thoại chỉ được nhập 10 chữ số');
            return false;
        }
        if (position.trim() === '') {
            displayErrorMessage('Chuyên môn không được bỏ trống');
            return false;
        }
        if (rankId.trim() === '') {
            displayErrorMessage('xếp hạng không được bỏ trống');
            return false;
        }
        if (!isValidRankId(rankId)) {
            displayErrorMessage('Xếp hạng phải chỉ có từ 1 đến 10');
            return false;
        }

        // If all fields are valid, display success message
        displaySuccessMessage('Thông tin đã được cập nhật thành công');
        return true;
    }

    function isValidDateFormat(dateString) {
        // Kiểm tra định dạng ngày sinh theo dạng YYYY-MM-DD
        var pattern = /^\d{4}-\d{2}-\d{2}$/;
        return pattern.test(dateString);
    }

    function isValidEmailAddress(email) {
        // Kiểm tra định dạng email hợp lệ
        var pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return pattern.test(email);
    }

    function isValidRankId(rankId) {
        // Kiểm tra xếp hạng chỉ từ 1 đến 10
        var rankNumber = parseInt(rankId, 10);
        return rankNumber >= 1 && rankNumber <= 10;
    }

    function isValidPhoneNumber(phone) {
        // Kiểm tra số điện thoại có 10 chữ số
        var pattern = /^\d{10}$/;
        return pattern.test(phone);
    }
    // Các hàm hiển thị thông báo lỗi và thành công không thay đổi.
    function displayErrorMessage(message) {
        Swal.fire({
            icon: 'error',
            title: 'Lỗi',
            text: message,
            timer: 50000, // Hiển thị thông báo trong 30 giây
            showConfirmButton: false // Ẩn nút xác nhận
        });
    }

    function displaySuccessMessage(message) {
        Swal.fire({
            icon: 'success',
            title: 'Thành công',
            text: message,
            timer: 50000, // Hiển thị thông báo trong 30 giây
            showConfirmButton: false // Ẩn nút xác nhận
        });
    }
</script>

</body>
</html>
