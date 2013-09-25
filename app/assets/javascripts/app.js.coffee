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

