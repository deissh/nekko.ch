function openEpisode(anime_id, translator_id, episode_id) {
    const ep = $('#translator-btn-' + translator_id).collapse().find("[data-id='" + episode_id + "']");
    ep.addClass('active');
    $('#player')
        .removeClass('hide')
        .find('iframe')
        .attr('src', ep.data('href'))
        .parent()
        .show();

    localStorage.setItem('anime_' + anime_id, JSON.stringify({
        episode_id,
        translator_id
    }));
}

function saveEpisode(anime_id, translator_id, episode_id) {
    localStorage.setItem('anime_' + anime_id, JSON.stringify({
        episode_id,
        translator_id
    }));

    $.ajax({
        url: '/api/v1/anime/' + anime_id + '/progress',
        type: 'post',
        data: {
            translator_id,
            episode_id
        },
        success: function(data) {
            console.info('Прогресс успешно сохранен');
        }
    });
}

$(document).on("turbolinks:load", function(event){
    const anime_id = $('input[name="page_id"]').val();
    if (anime_id === undefined) {
        return
    }

    // загрузка если мы уже смотрели это
    $.ajax({
        url: '/api/v1/anime/' + anime_id + '/progress',
        type: 'get',
        success: function(data) {
            console.info('Прогресс успешно загружен', data);
            openEpisode(data.anime_id, data.anime_translator_id, data.episode_id);
        },
        error: function (e) {
            console.info('Не удалось загрузить прогресс с сервера');
            const selected = JSON.parse(localStorage.getItem('anime_' + anime_id) || '{}');
            if (selected.translator_id !== undefined && selected.episode_id !== undefined) {
                openEpisode(anime_id, selected.translator_id, selected.episode_id);
            }
        }
    });

    // загрузка статуса для данного аниме
    $.ajax({
        url: '/api/v1/anime/' + anime_id + '/status',
        type: 'get',
        success: function(data) {
            console.info('Прогресс успешно загружен', data);
            $('#anime_status > button').removeClass('active');
            $('#anime_status > button[data-status="' + data.status + '"]').addClass('active');
        },
        error: function (e) {
            console.info('Не удалось загрузить статус аниме с сервера', e);
        }
    });

    $('.video-button').click(function(e) {
        const that = $(this);
        const href = that.data('href');

        $('#player')
            .removeClass('hide')
            .find('iframe')
            .attr('src', href)
            .parent()
            .show();

        if (!that.hasClass('active')) {
            const episode = $(this).data('id');
            const translator = $(this).data('translator-id');

            // переключаем серию (меняем активную кнопку)
            $('.video-button').removeClass('active');
            that.addClass('active');

            // сохраняем в текущем клиенте
            saveEpisode(anime_id, translator, episode);
        }
    });

    $('#anime_status > button').click(function(e) {
        const that = $(this);
        const status = that.data('status');

        $('#anime_status > button').removeClass('active');
        that.addClass('active');

        $.ajax({
            url: '/api/v1/anime/' + anime_id + '/status',
            type: 'post',
            data: {
                status
            },
            success: function(data) {
                console.info('Статус данного аниме успешно сохранен', data);
            },
            error: function (e) {
                alert('Произошла ошибка при сохранении, больше информции можно найти в консоли');
                console.error(e);
            }
        });
    });
});
