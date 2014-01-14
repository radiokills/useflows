$(document).ready ()->
  enquire.register "screen and (max-width:768px)",

    # OPTIONAL
    # If supplied, triggered when a media query matches.
    match: ->
      console.log 'test'
      $('img[id^=still_]').click ->
        console.log 'click!'
        #$(this).attr('src', 'animated_file.gif')

    # OPTIONAL
    # If supplied, triggered when the media query transitions
    # *from a matched state to an unmatched state*.
    unmatch: ->

    # If supplied, triggered when handler is unregistered.
    # Place cleanup code here
    destroy: ->