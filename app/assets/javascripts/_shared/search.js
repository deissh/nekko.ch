$(document).on("turbolinks:load", function() {
    $('#reset-form').click(function (e) {
        $(':input', '#search-form').not(':button, :submit, :reset, :hidden')
            .val('')
            .prop('checked', false)
            .prop('selected', false);
    })
});
