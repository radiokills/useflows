# By Oto Brglez - <oto.brglez@dlabs.si>

#= require jquery
#= require jquery_ujs
#= require_tree ./app/jquery
#= require_tree ./vendor
#= require_self

$(document).ready -> NProgress.start()
$(window).load -> NProgress.done()

$(document).ajaxStart -> NProgress.start()

$(document).ajaxStop -> NProgress.done()

# Now we use 'click to play madafaka'
#$(document).image_swapper()
$(document).click_play()

$(window).load ->
    container = document.querySelector('.item-list');
    window.pckry = new Packery( container, {
        itemSelector: '.item',
        gutter: 80
    });


    $('p.info i').click ->
        currentPosition = $(window).scrollTop();
        $('.footer-full').slideUp(500).css('display', 'block');

        $('html, body').animate({
            scrollTop: $('.about p.top').offset().top - 40
        }, 500);

        $(this).hide();
        $('p.social').hide();
        $('header').css('position','absolute');
        $('.about p.top').show();

    $('.about p.top i').click ->
        $('.footer-full').slideDown(250);

        $("html, body").animate({
            scrollDown: $('.bottom').offset().top
        }, 500);

        $('p.info i').show();
        $('p.social').show();
        $('header').css('position','fixed');
        $('.footer-full').delay(500).css('display', 'none');