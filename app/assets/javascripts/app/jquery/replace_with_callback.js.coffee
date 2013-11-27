$.fn.replaceWithCallback = (replace, callback)->
  ret = $.fn.replaceWith.call(this, replace)
  if(typeof callback == 'function')
    console.log 'calling function '
    callback.call(ret)
  return ret
