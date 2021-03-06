CarrierWave.configure do |config|
  
  if Rails.env.test?  or Rails.env.development?
    config.storage = :file
    config.enable_processing = false if Rails.env.test?
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider => ENV['FOG_PROVIDER'],
      :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
    config.fog_directory = ENV['FOG_DIRECTORY']
  end

end