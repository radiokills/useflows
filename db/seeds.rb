if ENV["DELETE_ALL"]=="1"
  PatternGroup.delete_all
  Shot.delete_all
end

pgs=["Search","Autocomplete","Autosuggest","Menu","Slider","Pop-up","Checkbox","Button","Transition","Animation","Hover","Move"]

pgs.each do |pg|
  PatternGroup.create name: pg
end

100.times do |t|
  shot = Shot.create description: "My description",
    url: "http://demo.si/test",
    pattern_group_id: PatternGroup.find_by_name(pgs.sample).id,
    image: File.open(Rails.root.join("spec","raw","test_block.gif").to_s)
  puts shot.valid?
  puts shot.errors.inspect
end
