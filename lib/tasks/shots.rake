require 'rest_client'
require 'oj'

def upload_file tag_list, image_path
  host = ENV["host"] || "uxscreen.dev"
  url = "http://#{host}/admin/shots.json"
  request = RestClient::Request.new(
    method: :post,
    url: url,
    user: "admin",
    password: "notsleep",
    payload: {
      multipart: true,
      shot: {
        tag_list: tag_list,
        image: File.new(image_path, 'rb')
      }
    },
    headers: { :accept => :json, content_type: :json }
  )

  begin
    response = request.execute
    Oj.load(response)
  rescue
    "Not. Sure."
  end
end

def tags_from file
  file.gsub!(/\.gif/,"")
  tags = file.split("_").reject do |t|
    t.size < 2
  end

  tags.join(", ")
end

namespace :shots do

  desc "Upload shots from folder"
  task upload: :environment do
    file_or_dir = ENV["from"]

    Dir.chdir(file_or_dir)

    Dir.glob("*.gif").each do |file|
      full_path = File.join(Dir.getwd, file)
      tags = tags_from(file)
      puts upload_file(tags, full_path)
    end

  end

end
