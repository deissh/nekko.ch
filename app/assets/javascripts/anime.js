$(document).on("turbolinks:load", function(event){
    var anime_id = $('input[name="page_id"]').val();

    // загрузка если мы уже смотрели это
    // todo: load in all translators
    var selected = JSON.parse(localStorage.getItem('anime_' + anime_id) || '{}');
    if (selected.translator !== undefined && selected.episode !== undefined) {
        var ep = $('#translator-btn-' + selected.translator).collapse().find("[data-id='" + selected.episode + "']");
        ep.addClass('active');
        $('#player')
            .removeClass('hide')
            .find('iframe')
            .attr('src', ep.data('href'))
            .parent()
            .show();
    }

    $('.video-button').click(function(e) {
        var that = $(this);
        var href = that.data('href');

        $('#player')
            .removeClass('hide')
            .find('iframe')
            .attr('src', href)
            .parent()
            .show();

        if (!that.hasClass('active')) {
            var episode = $(this).data('id');
            var translator = $(this).data('translator-id');

            // переключаем серию (меняем активную кнопку)
            $('.video-button').removeClass('active');
            that.addClass('active');

            // сохраняем в текущем клиенте
            localStorage.setItem('anime_' + anime_id, JSON.stringify({
                episode,
                translator
            }));

            if (typeof gtag === "function") {
                gtag('send', {
                    hitType: 'event',
                    eventCategory: 'Video',
                    eventAction: 'play',
                    eventLabel: 'anime__' + anime_id + '__' + translator + '__' + episode
                });
            }

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
