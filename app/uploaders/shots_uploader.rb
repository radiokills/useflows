class ShotsUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include Sprockets::Rails::Helper

  def default_url
    "fallback/" + [version_name, "shot.gif"].compact.join('_')
  end

  def store_dir
    "uploads/s/#{mounted_as}/#{model.id}"
  end

  before :cache, :capture_size_before_cache
  def capture_size_before_cache(new_file)
    width, height = `identify -format "%wx%h" #{new_file.path}[0]`.split(/x/).map { |dim| dim.to_i }
    model.dimensions = [width, height]
  end

  version :thumb do
    process :resize_to_fill => [20, 20]
  end

  version :still do
    process :remove_animation
    process :make_it_bright
  end

  def extension_white_list
    %w(gif)
  end

  def remove_animation
    manipulate! do |img, index|
      index == 0 ? img : nil
    end
  end

  def make_it_bright
    manipulate! do |img|
      img.modulate( 1.3, 0.0, 1.0).selective_blur_channel(0, 1, '40%')
      img.opacity = 0.1
      img
      #img.sketch
      #img.selective_blur_channel(0, 1, '40%')


    end
  end

end
