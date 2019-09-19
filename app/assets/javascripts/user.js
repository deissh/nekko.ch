//= require moment
//= require tempusdominus-bootstrap-4.js

$(document).on("turbolinks:load", function(){
    $('#birthdayselect').datetimepicker({
        format: 'L'
    });

    $("#background").change(function () {
        if (this.files && this.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                $('#background-preview').attr('src', e.target.result);
            };

            reader.readAsDataURL(this.files[0]);
        }
    });
    $("#avatar").change(function () {
        if (this.files && this.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                $('#avatar-preview').attr('src', e.target.result);
            };

            reader.readAsDataURL(this.files[0]);
        }
    });
});