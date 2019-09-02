//= require bootstrap-select

$(document).ready(function () {
    $('.selectpicker').selectpicker({
        noneSelectedText: 'Ничего не выбрано',
        noneResultsText: 'Ничего не найдено',
        selectAllText: 'Выбрать все',
        deselectAllText: 'Отменить выбор',
        title: 'Не указано',
        selectedTextFormat: 'count > 1',
        style: 'color-btn',
        styleBase: 'form-control',
        countSelectedText: "{0} жанров выбрано"
    });
});

$(document).on("turbolinks:load", function() {
    $('.selectpicker').selectpicker('render').trigger('load.bs.select.data-api');
    $(document);

    $('#reset-form').click(function (e) {
        $(':input', '#search-form').not(':button, :submit, :reset, :hidden')
            .val('')
            .prop('checked', false)
            .prop('selected', false);
        $('.selectpicker').selectpicker('val', []);
    })
});
