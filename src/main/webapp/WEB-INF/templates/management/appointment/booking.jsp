<%--
  Created by IntelliJ IDEA.
  User: hungkv
  Date: 5/27/2023
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
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
                <div class="modal-body p-3 pt-4">
                    <form>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label">Tên bệnh nhân <span
                                            class="text-danger">*</span></label>
                                    <input name="name" id="name" type="text" class="form-control">
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-6 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Dịch vụ</label>
                                    <select class="form-select form-control">
                                        <option value="PS">Khám tổng quát</option>
                                        <option value="EY">Nhổ răng</option>
                                        <option value="GY">Niềng răng</option>
                                        <option value="PS">Răng sứ</option>
                                        <option value="OR">Điều trị tủy</option>
                                        <option value="DE">Lấy cao răng</option>
                                    </select>
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Bác sĩ</label>
                                    <select class="form-select form-control">
                                        <option value="CA">Dr. Minh</option>
                                        <option value="CR">Dr. Truong</option>
                                        <option value="AL">Dr. An</option>
                                        <option value="TO">Dr. Huy</option>
                                        <option value="JE">Dr. Huyen</option>
                                        <option value="EL">Dr. Hieu</option>
                                        <option value="BE">Dr. Linh</option>
                                        <option value="LO">Dr. Trang</option>
                                    </select>
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Email <span
                                            class="text-danger">*</span></label>
                                    <input name="email" id="email" type="email" class="form-control">
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Điện thoại <span class="text-danger">*</span></label>
                                    <input name="phone" id="phone" type="tel" class="form-control">
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label"> Ngày khám : </label>
                                    <input name="date" type="text" class="form-control start">
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="input-time">Thời gian : </label>
                                    <input name="time" type="text" class="form-control timepicker"
                                           id="input-time">
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">Ghi chú <span
                                            class="text-danger">*</span></label>
                                    <textarea name="comments" id="comments" rows="4" class="form-control"
                                              placeholder=" Hãy viết lưu ý của bạn :"></textarea>
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-12">
                                <div class="w=5">
                                    <button type="submit" class="btn btn-primary">Đặt lịch</button>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
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
