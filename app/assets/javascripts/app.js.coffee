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
$(document).image_swapper()

$(window).load ->
  container = document.querySelector('.item-list');
  window.pckry = new Packery( container, {

        itemSelector: '.item',
        gutter: 80
      });



