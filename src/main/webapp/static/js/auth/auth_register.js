$(document).ready(function () {
        const register = $('#register');
        register.validate({
            rules: {
                email: {
                    required: true,
                    email: true,
                },
                password: {
                    required: true,
                    maxlength: 50
                },
                fullName: {
                    required: true,
                    maxlength: 255
                },
                phone: {
                    required: true,
                    number: true,
                    maxlength: 10
                },
                dob: {
                    required: true
                },

                address: {
                    required: true,
                    maxlength: 200
                },
                confirmPassword: {
                    required: true,
                    equalTo: "#password"
                }

            },
            messages: {
                email: {
                    required: 'Vui lòng nhập Email',
                    email: 'Email không đúng định dạng',
                },
                password: {
                    required: 'Vui lòng nhập mật khẩu',
                    maxlength: 'Mật khẩu không được quá 50 ký tự',
                },
                fullName: {
                    required: 'Vui lòng nhập họ và tên',
                    maxlength: 'họ và tên không được quá 255 ký tự',
                },
                phone: {
                    required: 'Vui lòng nhập số điện thoại',
                    number: 'Số điện thoại không đúng định dạng',
                    maxlength: 'Số điện thoại không được quá 10 ký tự',
                },
                dob: {
                    required: 'Vui lòng nhập ngày sinh',
                },
                address: {
                    required: 'Vui lòng nhập địa chỉ',
                    maxlength: 'Địa chỉ không được quá 200 ký tự',
                },
                confirmPassword: {
                    required: 'Vui lòng nhập lại mật khẩu',
                    equalTo: 'Mật khẩu không trùng khớp',
                }
            },
            submitHandler: function () {
                getRegister();
            }
        });
    }
);

function getRegister() {
    document.getElementById('btn-register').disabled = true;
    $.ajax({
        url: '/auth/register',
        type: 'POST',
        data: $('#register').serialize(),
        beforeSend: function () {
            $('.preloader-custom').preloader();
        },
        success: function (data) {
            $('.preloader-custom').preloader('remove');
            switch (data.message) {
                case 'email_existed':
                    document.getElementById("content").style.color = "red";
                    document.getElementById("content").innerHTML = "Email đã tồn tại!";
                    break;
                case 'success':
                    document.getElementById("content").style.color = "green";
                    document.getElementById("content").innerHTML = "Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài khoản!";
                    break;
                default:
                    document.getElementById("content").style.color = "red";
                    document.getElementById("content").innerHTML = "Đăng ký thất bại!";
                    break;
            }
            document.getElementById('btn-register').disabled = false;
        },
        error: function (data) {
            console.log(data);
            document.getElementById("content").style.color = "red";
            document.getElementById("content").innerHTML = "Đăng ký thất bại!";
            document.getElementById('btn-register').disabled = false;
            $('.preloader-custom').preloader('remove');
        }
    });
}