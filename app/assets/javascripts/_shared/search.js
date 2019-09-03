//= require @nobleclem/jquery-multiselect/jquery.multiselect.js

function GenreSelect () {
    $('.ms-options-wrap').remove();
    $('.selectpicker').removeClass('jqmsLoaded');
    $('.selectpicker').multiselect({
        texts: {
            placeholder: 'Выбрать жанры',
            search: 'Поиск по названию',
            selectAll: 'Выбрать все',
            unselectAll: 'Снять выбор со всех',
            noneSelected: 'Ничего не выбрано',
            selectedOptions: ' выбрано'
        },
        search   : true,
        selectAll: true,
        maxPlaceholderOpts: 3,
        defaultSelected: []
    });
}

$(document).on("turbolinks:load", function() {
    GenreSelect();

    $('#reset-form').click(function (e) {
        $(':input', '#search-form').not(':button, :submit, :reset, :hidden')
            .val('')
            .prop('checked', false)
            .prop('selected', false);
        $(".selectpicker > option:selected")
            .removeAttr("selected")
            .parent()
            .multiselect('reset');
    })
});
