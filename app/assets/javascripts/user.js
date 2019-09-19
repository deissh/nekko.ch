//= require moment
//= require tempusdominus-bootstrap-4.js

$(document).on("turbolinks:load", function(){
    $('#birthdayselect').datetimepicker({
        format: 'L'
    });
});