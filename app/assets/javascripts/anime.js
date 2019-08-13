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

    $('.head-menu li:has(ul) > a').click(function() {
        $(this).next('.hidden-menu').stop(true,true).slideToggle(200);
        $(this).parent().toggleClass('menuactive').siblings().removeClass('menuactive').children('ul').fadeOut(100);
        return false;
    });

    $("#show-menu").click(function(){
        if(localStorage.getItem('search-panel') === false) {
            $("#menu-inner").show().slideDown(200);
            localStorage.setItem('search-panel', true);
            $(this).find('.fa').toggleClass('fa-folder-o fa-times');
        } else {
            $("#menu-inner").hide().slideUp(200);
            localStorage.setItem('search-panel', false);
            $(this).find('.fa').toggleClass('fa-folder-o fa-times');
        };
        return false;
    });
});
