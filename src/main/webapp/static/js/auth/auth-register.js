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
                fullname: {
                    required: true,
                    maxlength: 100
                },
                phone: {
                    required: true,
                    maxlength: 10
                },
                dateOfBirth: {
                    required: true,
                    maxlength: 50
                },
                address: {
                    required: true,
                    maxlength: 200
                },

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
                fullname: {
                    required: 'Vui lòng nhập họ và tên',
                    maxlength: 'họ và tên không được quá 1pp ký tự',
                },
                phone: {
                    required: 'Vui lòng nhập mật khẩu',
                    maxlength: 'Số điện thoại không được quá 10 số',
                },
                dateOfBirth: {
                    required: 'Vui lòng nhập ngày sinh',
                    maxlength: 'Date không phù hợp',
                },
                address: {
                    required: 'Vui lòng nhập địa chỉ',
                    maxlength: 'Địa chỉ không được quá 200 ký tự',
                },
            },
            submitHandler: function () {
                getRegister();
            }
        });
    }
);

function getRegister() {
    $.ajax({
        url: '/auth/register',
        type: 'POST',
        data: $('#register').serialize(),
        success: function (data) {
            switch (data.message) {
                case 'email_incorrect':
                    document.getElementById("content").innerHTML = "Email không tồn tại!";
                    break;
                case 'success':
                    window.location.href = "/auth/login";
                    break;
            }
        },
        error: function (data) {
            console.log(data);
        }
    });
}