// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require popper.js
//= require bootstrap
//= require_tree .

/*
==========
Components
==========
 */
//= require './_shared/search.js'

// top navbar
$(document).on("turbolinks:load", function(){
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

