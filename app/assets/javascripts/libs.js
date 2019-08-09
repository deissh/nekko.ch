/* Datalife Engine template by: redissx (ICQ: 275116000, E-mail: redissx@gmail.com, Website: webrambo.ru )  */

// $(document).ready(function(){
//
// 	$("body").addClass("js");
//
// 	$(document).on('click','.ps-link',function(){
// 			var $url = $(this).attr("data-link");
// 			window.location.href=$url;
// 	});
// 	$('.head-menu li:has(ul) > a').click(function() {
// 			$(this).next('.hidden-menu').stop(true,true).slideToggle(200);
// 			$(this).parent().toggleClass('menuactive').siblings().removeClass('menuactive').children('ul').fadeOut(100);
// 			return false;
// 	});
// 	$("#show-menu").click(function(){
// 		if($.cookie('vis-menu') != '1' ) {
// 			$("#menu-inner").slideDown(200);
// 			$.cookie('vis-menu', 1, { path: '/', expires : 7});
// 			$(this).find('.fa').toggleClass('fa-folder-o fa-times');
// 		} else {
// 			$("#menu-inner").slideUp(200);
// 			$.cookie('vis-menu', 0, { path: '/', expires : 7});
// 			$(this).find('.fa').toggleClass('fa-folder-o fa-times');
// 		};
// 		return false;
// 	});
// 	if($.cookie('vis-menu') != '1' ) {
// 		$("#menu-inner").hide();
// 	} else {
// 		$("#menu-inner").show();
// 		$('#show-menu').find('.fa').removeClass('fa-folder-o').addClass('fa-times');
// 	};
//
// 	if ($(window).width() > 1220) {
// 		$('#grid').on({
// 			mouseenter: function () {
// 					if($.cookie('grid-view') != 'grid-list' ) {
// 						$(this).closest('.short').addClass('s-active').find('.short-d').fadeIn(200);
// 					};
// 			},
// 			mouseleave: function () {
// 					if($.cookie('grid-view') != 'grid-list' ) {
// 						$(this).closest('.short').removeClass('s-active').find('.short-d').fadeOut(200);
// 					};
// 			}
// 		},'.short-mask');
// 		$('.m-rate').wrate();
// 		$('.tops-r').wrate();
// 		$('.fp-rate').wrate();
// 	} else {
// 		$(document).on('click','.short-i',function(){
// 				var $url = $(this).find('.ps-link:first').attr("data-link");
// 				window.location.href=$url;
// 		});
// 		$('.tops-r').wrate();
// 		$('.fp-rate').wrate();
// 		$('#head-menu > li:not(.head-ic').each(function(){
// 			var $item = $(this);
// 			$item.appendTo('#mob-menu');
// 		});
// 		$(".show-menu").click(function(){
// 			$("#mob-menu").fadeToggle(0);
// 			$(this).find('.fa').toggleClass('fa-bars fa-times');
// 			$('.main, .section, .foot').toggleClass('fada');
// 		});
// 	};
// 	$(".scrolla").click(function(){
// 		$('html, body').animate({scrollTop: $(".tabs-box").offset().top - 140}, 800);
// 	});
// 	$('.tabs-box').wtabs();
// 	$('.rate3').each(function(){
//         var ratebox = $(this);
//         var raterate = parseInt(ratebox.find('.ratingtypeplusminus').text());
//         var ratecount = parseInt(ratebox.find('span[id]:last').text());
//         if ( ratecount >= raterate ) {
// 		ratebox.append('<div class="ratebar"><div class="ratefill"></div></div>');
//         var minusik = (ratecount - raterate)/2;
//         var plusik = ratecount - minusik;
// 		if ( ratecount > 0 ) {
// 			var ratefill = ratebox.find('.ratefill');
// 			var fill = Math.round(plusik/ratecount*100);
// 			ratefill.css({'width':''+fill+'%'});
// 		};
//         $(this).children('.pluss').append('<span class="plusik">'+plusik+'</span>');
//         $(this).children('.minuss').append('<span class="minusik">'+minusik+'</span>');
//         };
//     });
// 	$('#loginbtn, #ac-av').html($('#avatar-box').html());
// 	$('.login-social a').on('click',function(){
// 	   var href = $(this).attr('href');
//        var width  = 820;
//        var height = 420;
//        var left   = (screen.width  - width)/2;
//        var top   = (screen.height - height)/2-100;
//
//        auth_window = window.open(href, 'auth_window', "width="+width+",height="+height+",top="+top+",left="+left+"menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no");
//        return false;
// 	});
// 	$("#add-commbtn").click(function(){
// 		$("#add-comm-form").fadeToggle(200);
// 	});
// 	$(".comm-q").click(function(){
// 		$("#add-comm-form").fadeIn(200);
// 	});
//     $('#dle-content > #dle-ajax-comments').appendTo($('#full-comms'));
// 	if ($(window).width() > 750) {
// 		$('body').append('<div id="gotop"><span class="fa fa-chevron-up"></span></div>');
// 		var $gotop=$('#gotop');
// 		$ (window).scroll (function () {
// 			if ($ (this).scrollTop () > 300) {$gotop.fadeIn(200);
// 			} else {$gotop.fadeOut(200);}
// 		});
// 		$gotop.click(function(){
// 		$('html, body').animate({ scrollTop : 0 }, 'slow');
// 		});
// 	};
// });
// function doAlert() {
// 	DLEalert("Регистрируйтесь, и вы сможете добавлять в закладки, оценивать и многое другое!", 'Необходима регистрация');
// };
// function doRateLD( rate, id ) {
// 	ShowLoading('');
// 	$.get(dle_root + "engine/ajax/controller.php?mod=rating", { go_rate: rate, news_id: id, skin: dle_skin, user_hash: dle_login_hash }, function(data){
// 		HideLoading('');
// 		if ( data.success ) {
// 			var rating = data.rating;
// 			rating = rating.replace(/&lt;/g, "<");
// 			rating = rating.replace(/&gt;/g, ">");
// 			rating = rating.replace(/&amp;/g, "&");
// 			$("#ratig-layer-" + id).html(rating);
// 			$("#vote-num-id-" + id).html(data.votenum);
// 			var ratingtext = parseInt($(rating).text());
// 			var minusik = (data.votenum - ratingtext)/2;
// 			var plusik = data.votenum - minusik;
// 			$("#pluss-" + id).children('.plusik').text(plusik);
// 			$("#minuss-" + id).children('.minusik').text(minusik);
// 			var ratefill = $("#pluss-" + id).parent().find('.ratefill');
// 			var fill = Math.round(plusik/data.votenum*100);
// 			ratefill.css({'width':''+fill+'%'});
// 		} else if (data.error) {DLEalert ( data.errorinfo, dle_info );}
// 	}, "json");
// };
// jQuery.fn.wrate = function(){
// 	return this.each(function() {
// 		var wrbox = $(this);
// 		var wrr = parseInt(wrbox.find('.ratingtypeplusminus').text());
// 		var wrv = parseInt(wrbox.find('span[id]:last').text());
//         if ( wrv >= wrr && wrv > 0) {
//         var wrtext = (Math.round((wrv - (wrv - wrr)/2)/wrv*100))/10;
//         wrbox.text(wrtext+'/10');
//         } else {wrbox.text('0/10');};
// 	});
// };
// jQuery.fn.wtabs = function(){
// 	return this.each(function() {
// 		var tabsbox = $(this);
// 		tabsbox.find('.tabs-sel span:first').addClass('current');
// 		tabsbox.find('.tabs-b:first').addClass('visible');
// 		tabsbox.find('.tabs-sel').on('click', 'span:not(.current)', function() {
// 			$(this).addClass('current').siblings().removeClass('current');
// 		    tabsbox.find('.tabs-b').hide().eq($(this).index()).fadeIn(400);
// 		});
// 	});
// };
	
/*!
 * jQuery Cookie Plugin v1.3
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2011, Klaus Hartl
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */
 (function(e,h,j){function k(b){return b}function l(b){return decodeURIComponent(b.replace(m," "))}var m=/\+/g,d=e.cookie=function(b,c,a){if(c!==j){a=e.extend({},d.defaults,a);null===c&&(a.expires=-1);if("number"===typeof a.expires){var f=a.expires,g=a.expires=new Date;g.setDate(g.getDate()+f)}c=d.json?JSON.stringify(c):String(c);return h.cookie=[encodeURIComponent(b),"=",d.raw?c:encodeURIComponent(c),a.expires?"; expires="+a.expires.toUTCString():"",a.path?"; path="+a.path:"",a.domain?"; domain="+
a.domain:"",a.secure?"; secure":""].join("")}c=d.raw?k:l;a=h.cookie.split("; ");f=0;for(g=a.length;f<g;f++){var i=a[f].split("=");if(c(i.shift())===b)return b=c(i.join("=")),d.json?JSON.parse(b):b}return null};d.defaults={};e.removeCookie=function(b,c){return null!==e.cookie(b)?(e.cookie(b,null,c),!0):!1}})(jQuery,document);
//
// /*! end */
// $(document).ready(function(){
//
// 	$('.frate').each(function(){
//         var rate = $(this),
// 			rdata = rate.find('.rate-data'),
// 			rrate = parseInt(rdata.find('.ratingtypeplusminus').text(), 10),
// 			rvote = parseInt(rdata.find('span[id*=vote]').text(), 10);
// 			rate.append('<div class="rbar"><div class="rfill"></div></div>');
// 			rate.find('.rate-plus').after('<div class="rate-perc">0%</div>');
// 		if ( rvote >= rrate && rvote > 0 ) {
// 			var m = (rvote - rrate)/2,
// 				p = rvote - m,
// 				perc = Math.round(p/rvote*100);
// 			rate.find('.rate-plus span.rcount').html(p);
// 			rate.find('.rate-minus span.rcount').html(m);
// 			rate.find('.rfill').css({'width':''+perc+'%'});
// 			rate.find('.rate-perc').html(''+perc+'%');
// 			perc < 49 ? rate.find('.rate-perc').addClass('low') : rate.find('.rate-perc').addClass('high');
// 		} else {
// 			rate.find('.rate-plus span.rcount').html('0');
// 			rate.find('.rate-minus span.rcount').html('0');
//
// 		};
// 		rate.addClass('done');
//     });
//
// });
//
// function doRateLD( rate, id ) {
// 		ShowLoading('');
// 		$.get(dle_root + "engine/ajax/controller.php?mod=rating", { go_rate: rate, news_id: id, skin: dle_skin, user_hash: dle_login_hash }, function(data){
// 			HideLoading('');
// 			if ( data.success ) {
// 				var rating = data.rating;
// 				rating = rating.replace(/&lt;/g, "<");
// 				rating = rating.replace(/&gt;/g, ">");
// 				rating = rating.replace(/&amp;/g, "&");
// 				$("#ratig-layer-" + id).html(rating);
// 				$("#vote-num-id-" + id).html(data.votenum);
// 				var rt = parseInt($(rating).text()),
// 					m = (data.votenum - rt)/2,
// 					p = data.votenum - m,
// 					perc = Math.round(p/data.votenum*100),
// 					fRate = $("#frate-" + id);
// 				fRate.find('.rate-plus span.rcount').html(p);
// 				fRate.find('.rate-minus span.rcount').html(m);
// 				fRate.find('.rfill').css({'width':''+perc+'%'});
// 				fRate.find('.rate-perc').html(''+perc+'%');
// 			} else if (data.error) {DLEalert ( data.errorinfo, dle_info );}
// 		}, "json");
// };
//
// $(document).ready(function(){
// 	$('.short-rate-perc').wRatePercent();
// });
//
// jQuery.fn.wRatePercent = function(){
// 	return this.each(function() {
// 		var a = $(this);
// 		var b = parseInt(a.find('.ratingtypeplusminus').text(),10);
// 		var c = parseInt(a.find('span[id*=vote]').text(),10);
//         if ( c >= b && c > 0 ) {
//         var t = Math.round((c - (c - b)/2)/c*100);
//         a.text(t+'%').addClass('high');
// 		if ( t < 50 ) { a.addClass('low'); }
//         } else {a.text('0%');};
// 		a.addClass('wdone');
// 	});
// };
//
// $(window).on('load', function () {
//     var $preloader = $('#p_prldr'),
//         $svg_anm   = $preloader.find('.svg_anm');
//     $svg_anm.fadeOut();
//     $preloader.delay(500).fadeOut('slow');
// });