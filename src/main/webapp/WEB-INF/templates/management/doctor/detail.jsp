<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 6/21/2023
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
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
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded" id="pills-tab"
                            role="tablist">
                            <li class="nav-item">
                                <a class="nav-link rounded active" id="pills-cloud-tab" data-bs-toggle="pill"
                                   href="#info" role="tab" aria-controls="infor" aria-selected="false">
                                    <div class="text-center pt-1 pb-1">
                                        <h4 class="title font-weight-normal mb-0">Thông tin</h4>
                                    </div>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link rounded" id="pills-smart-tab" data-bs-toggle="pill" href="#edit"
                                   role="tab" aria-controls="edit" aria-selected="false">
                                    <div class="text-center pt-1 pb-1">
                                        <h4 class="title font-weight-normal mb-0">Chỉnh sửa</h4>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content" id="1">
                    <div class="tab-pane show active row" id="info" role="tabpanel" aria-labelledby="info">
                        <div class="col-lg-12 col-md-12 mt-4">
                            <div class="bg-white rounded shadow overflow-hidden">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0">Thông tin cá nhân</h5>
                                </div>
                                <br><br><br><br><br>
                                <div class="text-center margin-nagative mt-n5 position-relative pb-4 border-bottom">

                                    <img src="https://taimuihongsg.com/wp-content/uploads/2018/05/Kim-Bun-ThuongE_taimuihongsg.jpg"
                                         class="img-fluid avatar avatar-large rounded" alt="">

                                    <h5 class="mt-3 mb-1">${doctor.fullName}</h5>
                                    <p class="text-muted mb-0">#</p>
                                </div>

                                <div class="p-4">
                                    <div class="d-flex align-items-center mt-2">
                                        <i class="uil uil-user align-text-bottom text-primary h5 mb-0 me-2"></i>
                                        <h6 class="mb-0">Giới tính</h6>
                                        <c:if test="${doctor.gender == true}">
                                            <p class="text-muted mb-0 ms-2">Nam</p>
                                        </c:if>
                                        <c:if test="${doctor.gender == false}">
                                            <p class="text-muted mb-0 ms-2">Nữ</p>
                                        </c:if>
                                    </div>
                                    <div class="d-flex align-items-center mt-2">
                                        <i class="uil uil-envelope align-text-bottom text-primary h5 mb-0 me-2"></i>
                                        <h6 class="mb-0">Ngày sinh</h6>
                                        <p class="text-muted mb-0 ms-2">${doctor.dob}</p>
                                    </div>
                                    <div class="d-flex align-items-center mt-2">
                                        <i class="uil uil-book-open align-text-bottom text-primary h5 mb-0 me-2"></i>
                                        <h6 class="mb-0">Số điện thoại</h6>
                                        <p class="text-muted mb-0 ms-2">0${doctor.phone}</p>
                                    </div>

                                    <div class="d-flex align-items-center mt-2">
                                        <i class="uil uil-italic align-text-bottom text-primary h5 mb-0 me-2"></i>
                                        <h6 class="mb-0">Email</h6>
                                        <p class="text-muted mb-0 ms-2">${doctor.account.email}</p>
                                    </div>

                                    <div class="d-flex align-items-center mt-2">
                                        <i class="uil uil-italic align-text-bottom text-primary h5 mb-0 me-2"></i>
                                        <h6 class="mb-0">Mô tả</h6>
                                        <p class="text-muted mb-0 ms-2">${doctor.description}</p>
                                    </div>

                                    <div class="d-flex align-items-center mt-2">
                                        <i class="uil uil-medical-drip align-text-bottom text-primary h5 mb-0 me-2"></i>
                                        <h6 class="mb-0">Role</h6>
                                        <p class="text-muted mb-0 ms-2">Doctor</p>
                                    </div>

                                    <div class="d-flex align-items-center mt-2">
                                        <i class="uil uil-medical-drip align-text-bottom text-primary h5 mb-0 me-2"></i>
                                        <h6 class="mb-0">Trạng thái</h6>
                                        <c:if test="${doctor.status == true}">
                                            <p class="text-muted mb-0 ms-2">Hoạt động</p>
                                        </c:if>
                                        <c:if test="${doctor.status == false}">
                                            <p class="text-muted mb-0 ms-2">Khóa</p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 mt-4">
                            <div class="bg-white rounded shadow overflow-hidden">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0">Danh sách cuộc hẹn</h5>
                                </div>
                                <table class="table p-4 mb-0 table-center">
                                    <thead>
                                    <tr>
                                        <th class="border-bottom p-3">ID</th>
                                        <th class="border-bottom p-3">Bệnh nhân</th>
                                        <th class="border-bottom p-3">Ngày</th>
                                        <th class="border-bottom p-3">Thời gian</th>
                                        <th class="border-bottom p-3">Trạng thái</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <tr>
                                        <th class="p-3">1</th>
                                        <td class="p-3">Huyenxinhgai</td>
                                        <td class="p-3">21/05/2023</td>
                                        <td class="p-3">$10AM</td>
                                        <td class="p-3">done</td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 mt-4">
                            <div class="bg-white rounded shadow overflow-hidden">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0">Đánh giá từ bệnh nhân</h5>
                                </div>
                                <ul class="media-list list-unstyled p-4 mb-0">
                                    <c:forEach items="${rate}" var="r">
                                        <li class="mt-4">
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <a class="pe-3" href="#">
                                                        <img src="https://trivia-nextdoor.com/wp-content/uploads/2022/02/noiroze-study-man.png"
                                                             class="img-fluid avatar avatar-md-sm rounded-circle shadow"
                                                             alt="img">

                                                    </a>
                                                    <div class="commentor-detail">
                                                        <h6 class="mb-0"><a href="javascript:void(0)"
                                                                            class="text-dark media-heading">${r.user.username}</a>
                                                        </h6>
                                                        <small class="text-muted"><fmt:formatDate
                                                                pattern="dd/MM/yyyy hh:mm"
                                                                value="${r.date}"/></small>
                                                    </div>
                                                </div>
                                                <ul class="list-unstyled text-warning h5 mb-0">
                                                    <c:if test="${r.star != 0}">
                                                        <c:forEach var="i" begin="1" end="${r.star}">
                                                            <li class="list-inline-item"><i
                                                                    class="mdi mdi-star"></i></li>
                                                        </c:forEach>
                                                    </c:if>
                                                </ul>
                                            </div>
                                            <div class="mt-3">
                                                <p class="text-muted font-italic p-3 bg-light rounded">${r.feedback}</p>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>

                        </div>
                    </div>

                    <div class="tab-pane fade" id="edit" role="tabpanel" aria-labelledby="edit">
                        <div class="card border-0 shadow overflow-hidden">
                            <div class="tab-content p-4" id="pills-tabContent">
                                <form action="${pageContext.request.contextPath}/management/doctor/detail" method="POST"
                                      enctype="multipart/form-data"
                                      onSubmit="document.getElementById('submit').disabled = true;">
                                    <h5 class="mb-0">Chỉnh sửa thông tin :</h5>
                                    <div>
                                        <p class="text-muted">Cập nhật ảnh đại diện.</p>
                                        <div id="myfileupload">
                                            <input type="file" name="image" id="uploadfile" name="ImageUpload"
                                                   onchange="readURL(this);"/>
                                        </div>
                                        <div id="thumbbox">
                                            <img class="rounded" height="20%" width="30%" alt="Thumb image"
                                                 id="thumbimage" style="display: none"/>
                                            <a class="removeimg" href="javascript:"></a>
                                        </div>
                                        <div id="boxchoice">
                                            <a href="javascript:" class="Choicefile"><i
                                                    class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                                            <p style="clear:both"></p>
                                            <input type="submit" id="" style="display: none" name="send"
                                                   class="Update btn btn-primary"
                                                   value="Cập nhật">
                                            <p style="clear:both"></p>
                                        </div>
                                    </div>
                                </form>

                                <form action="${pageContext.request.contextPath}/management/doctor/detail" method="POST"
                                      class="mt-4" onSubmit="document.getElementById('submit').disabled = true;">
                                    <input value="${doctor.account.id}" name="id" type="hidden">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Họ và tên</label>
                                                <input name="full_name" id="name" type="text" class="form-control"
                                                       value="${doctor.fullName}"
                                                       placeholder="Họ và tên :">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Ngày sinh</label>
                                                <input name="dob" id="name2" type="text" class="form-control"
                                                       value="${doctor.dob}"
                                                       placeholder="YYYY-MM-DD">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Email</label>
                                                <input name="email" id="email" type="email" class="form-control"
                                                       value="${doctor.account.email}"
                                                       placeholder="Email :">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Địa chỉ</label>
                                                <input name="address" id="address" type="text" class="form-control"
                                                       placeholder="Địa chỉ" value="${doctor.address}">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Điện thoại</label>
                                                <input name="phone" id="phone" type="text" class="form-control"
                                                       placeholder="Điện thoại" value="${doctor.phone}">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Chức vụ</label>
                                                <input name="position" id="position" type="text" class="form-control"
                                                       placeholder="Chức vụ" value="${doctor.position}">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Giới tính</label>
                                                <select name="gender" class="form-select form-control">
                                                    <option value="Nam">Nam</option>
                                                    <c:if test="${doctor.gender == true}">
                                                        selected
                                                    </c:if>
                                                    <option value="Nữ">Nữ</option>
                                                    <c:if test="${doctor.gender == false}">
                                                        selected
                                                    </c:if>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Xếp hạng</label>
                                                <input name="doctorRank" id="doctorRank" type="text" class="form-control"
                                                       value="${doctor.doctorRank.name}"
                                                       placeholder="Xếp hạng">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label class="form-label">Trạng thái <span
                                                        class="text-danger"></span></label>
                                                <tbody>
                                                <tr>
                                                    <td><input id="credit"
                                                               name="status" ${doctor.status==true?"checked":""}
                                                               value="true" type="radio"
                                                               class="form-check-input"
                                                               checked required></td>
                                                    <td><label class="form-check-label">Hoạt động</label></td>
                                                    <td></td>
                                                    <td><input id="debit"
                                                               name="status" ${doctor.status==false?"checked":""}
                                                               value="false" type="radio"
                                                               class="form-check-input"
                                                               required></td>
                                                    <td><label class="form-check-label">Khóa</label></td>
                                                </tr>
                                                </tbody>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Mô tả</label>
                                                <textarea name="description" id="comments" rows="3" class="form-control"
                                                          placeholder="Bio :">${doctor.description}</textarea>
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
<style>
    .Choicefile {
        display: block;
        background: #396CF0;
        border: 1px solid #fff;
        color: #fff;
        width: 150px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        padding: 5px 0px;
        border-radius: 5px;
        font-weight: 500;
        align-items: center;
        justify-content: center;
    }

    .Choicefile:hover {
        text-decoration: none;
        color: white;
    }

    #uploadfile,
    .removeimg {
        display: none;
    }

    #thumbbox {
        position: relative;
        width: 100%;
        margin-bottom: 20px;
    }

    .removeimg {
        height: 25px;
        position: absolute;
        background-repeat: no-repeat;
        top: 5px;
        left: 5px;
        background-size: 25px;
        width: 25px;
        border-radius: 50%;
    }

    .removeimg::before {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        content: '';
        border: 1px solid red;
        background: red;
        text-align: center;
        display: block;
        margin-top: 11px;
        transform: rotate(45deg);
    }

    .removeimg::after {
        content: '';
        background: red;
        border: 1px solid red;
        text-align: center;
        display: block;
        transform: rotate(-45deg);
        margin-top: -2px;
    }
</style>
</html>

