$(document).on("turbolinks:load", function(){
    $('.video-button').click(function(e) {
        var that = $(this);
        var href = that.data('href');

        $('#player').find('iframe').attr('src', href).parent().show();

        if (!that.hasClass('active')) {
            var saved = $(this).data('id');
            var anime_id = $('input[name="page_id"]').val();

            $('.video-button').removeClass('active');
            that.addClass('active');
            // $.ajax({
            //     url: '/saved/' + anime_id + '/' + saved,
            //     type: 'post',
            //     success: function(data) {
            //         if (data.message.length > 0) {
            //             $('.video-button').removeClass('active');
            //             that.addClass('active');
            //         }
            //     }
            // });
        }
    });
});
