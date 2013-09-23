$(document).ready ()->

  $("a.new_shot").bind "click", (event)->
    event.preventDefault() if event.preventDefault?
    $(document).trigger "shot_form:open"

  $(".shot-form").bind "click", (event)->
    if $(event.target).hasClass("shot-form-inner-wrap") or $(event.target).hasClass("shot-form")
      $(document).trigger "shot_form:close"

  $(document).bind "shot_form:open", (event)->
    unless (form = $(".shot-form")).is(":visible")
      form.fadeIn("slow")

  $(document).bind "shot_form:close", (event)->
    if (form = $(".shot-form")).is(":visible")
      form.fadeOut()
