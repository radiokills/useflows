if ENV["DELETE_ALL"]=="1"
  Shot.delete_all
end

100.times do |t|
  shot = Shot.create description: "My description",
    url: "http://demo.si/test",
    tag_list: "demo, test",
    image: File.open(Rails.root.join("spec","raw","test_block.gif").to_s)
  puts shot.valid?
  puts shot.errors.inspect
end
