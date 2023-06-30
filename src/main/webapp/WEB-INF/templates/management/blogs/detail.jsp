<%--
  Created by IntelliJ IDEA.
  User: Huyen Nguyen
  Date: 6/21/2023
  Time: 7:45 PM
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
                    <div class="card border-0 shadow overflow-hidden">
                        <div class="tab-content p-4" id="pills-tabContent">
                            <div class="modal-content">
                                <div class="modal-header border-bottom p-3">
                                    <h5 class="modal-title" id="exampleModalLabel">Chi tiết Blog</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body p-3 pt-4">
                                    <form  action="${pageContext.request.contextPath}/management/blog/update" method="POST">
<%--                                        <input value="${blog_id}" name="id" type="hidden">--%>
                                        <input value="${blog_id}" name="id">
<%--                                        <input value="${blog_id}" name="id">--%>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Danh Mục<span class="text-danger">*</span></label>
                                                    <select name="category_id" class="form-select"
                                                            aria-label="Default select example">
                                                        <c:forEach var="c" items="${category}">
                                                            <option value="${c.name}"
                                                                    <c:if test="${c.name eq blogs.categoryBlog.name}">selected=""</c:if>
                                                            >${c.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Tiêu đề <span
                                                        class="text-danger">*</span></label>
                                                <input name="title" id="title" type="text" class="form-control"
                                                       value="${blogs.title}"
                                                       placeholder="Tiêu đề:">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Ảnh <span class="text-danger">*</span></label>
                                                <div class="form-group">
                                                    <div class="col-lg-offset-5 col-lg-15">
                                                        <div class="profile-pic">
                                                            <br><br>
                                                            <input id="file" type="file" onchange="loadFile(event)"
                                                                   name="image"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Thông Tin Tóm Tắt<span
                                                        class="text-danger">*</span></label>
                                                <textarea rows="3" cols="70" class="brief" name="brief" id="brief" placeholder="Thông tin tóm tắt">${blogs.brief}</textarea>



                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Mô tả<span
                                                        class="text-danger">*</span></label>

                                                <textarea rows="10" cols="70" class="describe" name="description" id="describe" placeholder="Mô tả:">${blogs.description}</textarea>





                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label"> Ngày đăng: </label>
                                                    <input name="create_at" type="text" class="form-control start" id="createdAt"
                                                           value="${blogs.createdAt}"
                                                           placeholder="Ngày đăng :">

                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label"> Người đăng: </label>
                                                    <input name="create_by" type="text" class="form-control start" id="created_by"
                                                           value="${blogs.employee.fullName}"
                                                           placeholder="Ngày đăng :">

                                                </div>
                                            </div><!--end col-->


                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label"> Ngày cập nhật : </label>
                                                    <input name="update_at" type="text" class="form-control start" id="updatedAt"
                                                           value="${blogs.updatedAt}"
                                                           placeholder="Ngày đăng :">

                                                </div>
                                            </div><!--end col-->






                                            <div class="mb-3">
                                                <label class="form-label">Trạng thái <span
                                                        class="text-danger"></span></label>
                                                <table>
                                                    <tbody>
                                                    <tr class="d-flex align-items-center">
                                                        <td><input id="credit" name="status" value="true" type="radio"
                                                                   class="form-check-input"
                                                                   checked required></td>
                                                        <td><label class="form-check-label">status</label></td>
                                                        <td></td>
                                                        <td><input id="debit" name="status" value="false" type="radio"
                                                                   class="form-check-input"
                                                                   required></td>
                                                        <td><label class="form-check-label">Disable</label></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="../layout/footer.jsp"/>
    </main>
</div>


<script>
    // function Sort(type) {
    //     window.location.href = "blogmanage?action=sort&type=" + type;
    // }


    ClassicEditor.create(document.querySelector(".describe"), {
        toolbar: {
            items: [
                "heading",
                "|",
                "bold",
                "italic",
                "link",
                "bulletedList",
                "numberedList",
                "|",
                "indent",
                "outdent",
                "|",
                "imageUpload",
                "blockQuote",
                "mediaEmbed",
                "undo",
                "redo",
            ],
        },
        image: {
            toolbar: ["imageTextAlternative", "imageStyle:full", "imageStyle:side"],
        },
    }).then((editor) => {
        window.editor = editor;
    })

    ClassicEditor.create(document.querySelector(".brief"), {
        toolbar: {
            items: [
                "heading",
                "|",
                "bold",
                "italic",
                "link",
                "bulletedList",
                "numberedList",
                "|",
                "indent",
                "outdent",
                "|",
                "imageUpload",
                "blockQuote",
                "mediaEmbed",
                "undo",
                "redo",
            ],
        },
        image: {
            toolbar: ["imageTextAlternative", "imageStyle:full", "imageStyle:side"],
        },
    }).then((editor) => {
        window.editor = editor;
    })

    function readURL(input, thumbimage) {
        if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#thumbimage").attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        } else { // Sử dụng cho IE
            $("#thumbimage").attr('src', input.value);
        }
        $("#thumbimage").show();
        $('.filename').text($("#uploadfile").val());
        $(".Choicefile").hide();
        $(".Update").show();
        $(".removeimg").show();
    }

    var editor = '';
    $(document).ready(function () {
        editor = CKEDITOR.replace('brief');
        editor = CKEDITOR.replace('describe');
        $(".Choicefile").bind('click', function () {
            $("#uploadfile").click();
        });
        $(".removeimg").click(function () {
            $("#thumbimage").attr('src', '').hide();
            $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
            $(".removeimg").hide();
            $(".Choicefile").show();
            $(".Update").hide();
            $(".filename").text("");
        });
    })


</script>
<script src="${pageContext.request.contextPath}/static/libs/tobii/js/tobii.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins.init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/app.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/date/flatpickr.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/date/flatpickr.init.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/date/jquery.timepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/date/timepicker.init.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
