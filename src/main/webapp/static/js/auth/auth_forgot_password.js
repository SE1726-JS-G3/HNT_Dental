$(document).ready(function () {
        const forgot = $('#forgot');
        forgot.validate({
            rules: {
                email: {
                    required: true,
                    email: true,
                }
            },
            messages: {
                email: {
                    required: 'Vui lòng nhập Email',
                    email: 'Email không đúng định dạng',
                },

            },
            submitHandler: function () {
                getForgotPassword() ;
            }
        });
    }
);

function getForgotPassword() {
    $.ajax({
        url: '/auth/forgotPassword',
        type: 'POST',
        data: $('#forgot').serialize(),
        success: function (data) {
            switch (data.message) {
                case 'email_incorrect':
                    document.getElementById("content").innerHTML = "Email không tồn tại!";
                    break;
                case 'password_incorrect':
                    document.getElementById("content").innerHTML = "Mật khẩu không đúng!";
                    break;
                case 'account_not_verified':
                    document.getElementById("content").innerHTML = "Tài khoản đã bị khóa!";
                    break;
                case 'success':
                    window.location.href = "/home";
                    break;
            }
        },
        error: function (data) {
            console.log(data);
        }
    });
}