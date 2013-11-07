class ImageSwapper

  constructor: (element)->
    console.log 'initialized'
    @image = $(element)
    @image_src = @image.attr('src')
    @image.hover(@mouse_in, @mouse_out)

  mouse_in: (e) =>
    img = $(e.currentTarget)
    img.removeClass('faded')
    @switch_image(img)

  mouse_out: (e) =>
    img = $(e.currentTarget)
    img.addClass('faded')
    @switch_image(img)


  replace_name: (file_name) ->
    if file_name.indexOf('still_') == 0
      return file_name.replace('still_', '')
    else
      return "still_#{file_name}"

  switch_image: (img) =>
    src = img.attr('src')
    src_arr = src.split("/")
    file_name = src_arr.pop()
    new_file_name = @replace_name(file_name)
    src_arr.push(new_file_name)
    new_path = src_arr.join("/")
    img.attr('src', new_path)




$.fn.image_swapper = () ->
  new ImageSwapper(this)
