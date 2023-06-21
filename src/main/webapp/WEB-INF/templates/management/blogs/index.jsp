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
                    <div class="col-md-10 row">
                        <div class="col-md-6">
                            <div class="search-bar p-0 d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form action="blogmanage?action=search" method="POST" id="searchform"
                                          class="searchform">
                                        <div>
                                            <input value="${requestScope.content}" type="text" class="border rounded"
                                                   name="content" id="s" placeholder="Nhập từ khóa">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 row align-items-center">
                            <a href="#" class="btn btn-primary">Thêm mới</a>
                        </div>

                    </div>

                </div>
                <br>
                <br>

                <div class="row">
                    <form action="blogmanage?action=filter" method="POST"
                          onSubmit="document.getElementById('submit').disabled = true;">
                        <div class="row">
                            <div class="col-md-4 row align-items-center">
                                <div class="col-md-4">
                                    <label class="form-label">Danh Mục</label>
                                </div>
                                <div class="col-md-8">
                                    <select name="category_id" class="form-select" aria-label="Default select example">
                                        <option
                                                <c:if test="${category_id == 'all'}">selected</c:if> value="all">Tất cả
                                        </option>
                                        <c:forEach items="${categories}" var="c">
                                            <option
                                                    <c:if test="${category_id == c.id}">selected
                                                    checked="checked"</c:if> value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3 row align-items-center">
                                <div class="col-md-5">
                                    <label class="form-label">Status</label>
                                </div>
                                <div class="col-md-7">
                                    <select name="status" class="form-select" aria-label="Default select example">
                                        <option
                                                <c:if test="${status == 'all'}">selected checked="checked"</c:if>
                                                value="all">Tất cả
                                        </option>
                                        <option
                                                <c:if test="${status == '1'}">selected checked="checked"</c:if>
                                                value="1">Active
                                        </option>
                                        <option
                                                <c:if test="${status == '0'}">selected checked="checked"</c:if>
                                                value="0">Disable
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-1 md-0">
                                <button type="submit" class="btn btn-primary">Lọc</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row">
                            <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                                    <img src="https://trivia-nextdoor.com/wp-content/uploads/2022/02/noiroze-study-man.png"
                                         class="img-fluid" alt="">
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3"><i
                                                    class="uil uil-calendar-alt text-dark h6 me-1"></i>21/06/2023
                                            </li>
                                            <li class="list-inline-item text-muted small"><i
                                                    class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                            </li>
                                        </ul>
                                        <a href="#" class="text-dark title h5">Easily connect to doctor and make a
                                            treatment</a>
                                        <br>
                                        <br>
                                        <div class="post-meta d-flex justify-content-between mt-3">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="p-3 text-center">
                                                        <a href="#">
                                                            <button class="btn btn-primary">Hide</button>
                                                        </a>
                                                        <a href="#">
                                                            <button class="btn btn-danger">View</button>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
                            <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                                    <img src="https://trivia-nextdoor.com/wp-content/uploads/2022/02/noiroze-study-man.png"
                                         class="img-fluid" alt="">
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3"><i
                                                    class="uil uil-calendar-alt text-dark h6 me-1"></i>21/06/2023
                                            </li>
                                            <li class="list-inline-item text-muted small"><i
                                                    class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                            </li>
                                        </ul>
                                        <a href="#" class="text-dark title h5">Easily connect to doctor and make a
                                            treatment</a>
                                        <br>
                                        <br>
                                        <div class="post-meta d-flex justify-content-between mt-3">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="p-3 text-center">
                                                        <a href="#">
                                                            <button class="btn btn-primary">Hide</button>
                                                        </a>
                                                        <a href="#">
                                                            <button class="btn btn-danger">View</button>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
                            <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                                    <img src="https://trivia-nextdoor.com/wp-content/uploads/2022/02/noiroze-study-man.png"
                                         class="img-fluid" alt="">
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3"><i
                                                    class="uil uil-calendar-alt text-dark h6 me-1"></i>21/06/2023
                                            </li>
                                            <li class="list-inline-item text-muted small"><i
                                                    class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                            </li>
                                        </ul>
                                        <a href="#" class="text-dark title h5">Easily connect to doctor and make a
                                            treatment</a>
                                        <br>
                                        <br>
                                        <div class="post-meta d-flex justify-content-between mt-3">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="p-3 text-center">
                                                        <a href="#">
                                                            <button class="btn btn-primary">Hide</button>
                                                        </a>
                                                        <a href="#">
                                                            <button class="btn btn-danger">View</button>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
                            <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                                    <img src="https://trivia-nextdoor.com/wp-content/uploads/2022/02/noiroze-study-man.png"
                                         class="img-fluid" alt="">
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3"><i
                                                    class="uil uil-calendar-alt text-dark h6 me-1"></i>21/06/2023
                                            </li>
                                            <li class="list-inline-item text-muted small"><i
                                                    class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                            </li>
                                        </ul>
                                        <a href="#" class="text-dark title h5">Easily connect to doctor and make a
                                            treatment</a>
                                        <br>
                                        <br>
                                        <div class="post-meta d-flex justify-content-between mt-3">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="p-3 text-center">
                                                        <a href="#">
                                                            <button class="btn btn-primary">Hide</button>
                                                        </a>
                                                        <a href="#">
                                                            <button class="btn btn-danger">View</button>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
                            <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                                    <img src="https://trivia-nextdoor.com/wp-content/uploads/2022/02/noiroze-study-man.png"
                                         class="img-fluid" alt="">
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3"><i
                                                    class="uil uil-calendar-alt text-dark h6 me-1"></i>21/06/2023
                                            </li>
                                            <li class="list-inline-item text-muted small"><i
                                                    class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                            </li>
                                        </ul>
                                        <a href="#" class="text-dark title h5">Easily connect to doctor and make a
                                            treatment</a>
                                        <br>
                                        <br>
                                        <div class="post-meta d-flex justify-content-between mt-3">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="p-3 text-center">
                                                        <a href="#">
                                                            <button class="btn btn-primary">Hide</button>
                                                        </a>
                                                        <a href="#">
                                                            <button class="btn btn-danger">View</button>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
                            <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                                    <img src="https://trivia-nextdoor.com/wp-content/uploads/2022/02/noiroze-study-man.png"
                                         class="img-fluid" alt="">
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3"><i
                                                    class="uil uil-calendar-alt text-dark h6 me-1"></i>21/06/2023
                                            </li>
                                            <li class="list-inline-item text-muted small"><i
                                                    class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                            </li>
                                        </ul>
                                        <a href="#" class="text-dark title h5">Easily connect to doctor and make a
                                            treatment</a>
                                        <br>
                                        <br>
                                        <div class="post-meta d-flex justify-content-between mt-3">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="p-3 text-center">
                                                        <a href="#">
                                                            <button class="btn btn-primary">Hide</button>
                                                        </a>
                                                        <a href="#">
                                                            <button class="btn btn-danger">View</button>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->

                        <div class="row">
                            <div class="col-12 mt-4">
                                <ul class="pagination justify-content-end mb-0 list-unstyled">
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"
                                                             aria-label="Previous">Prev</a></li>
                                    <li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0)"
                                                             aria-label="Next">Next</a></li>
                                </ul><!--end pagination-->
                            </div><!--end col-->
                        </div><!--end row-->
                    </div>
                </div><!--end container-->

                <!-- Footer Start -->


            </div>
            <jsp:include page="../layout/footer.jsp"/>
    </main>
</div>

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

<script>
    function Sort(type) {
        window.location.href = "blogmanage?action=sort&type=" + type;
    }

    var editor = '';
    $(document).ready(function () {
        editor = CKEDITOR.replace('describe');
    });

</script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/simplebar.min.js"></script>
<script src="assets/js/select2.min.js"></script>
<script src="assets/js/select2.init.js"></script>
<script src="assets/js/flatpickr.min.js"></script>
<script src="assets/js/flatpickr.init.js"></script>
<script src="assets/js/jquery.timepicker.min.js"></script>
<script src="assets/js/timepicker.init.js"></script>
<script src="assets/js/feather.min.js"></script>
<script src="assets/js/app.js"></script>

</body>
</html>