class ClickPlay

  constructor: (element)->
    @curently_playing = null
    @image = $(element)
    @image_src = @image.attr('src')

    $(document).on('click', '.still', (e)=>
      @play(e)
      if @curently_playing
        @stop(@curently_playing)
      @curently_playing = e
    )

  play: (e) =>
    img = $(e.currentTarget)
    $('.still').closest('.item').addClass('faded')
    img.closest('.item').removeClass('faded')
    img.prev('.overlay').hide()
    @switch_image(img)

  stop: (e) =>
    img = $(e.currentTarget)
    img.prev('.overlay').show()
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




$.fn.click_play = () ->
  new ClickPlay()
