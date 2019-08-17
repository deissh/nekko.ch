$(document).on("turbolinks:load", function() {
    $('#reset-form').click(function (e) {
        $('#search-form').trigger('reset');
    })
});
