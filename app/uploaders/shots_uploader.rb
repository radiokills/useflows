class ShotsUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
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

  def extension_white_list
    %w(gif)
  end

end
