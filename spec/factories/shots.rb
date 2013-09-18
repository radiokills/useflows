FactoryGirl.define do

  factory :shot, class: Shot do
    url "http://dlabs.si"
    visible true
    description "Some description"
#    tag_list %w{menu dropdown test testing}
    image File.open(Rails.root.join("spec","raw","test_block.gif").to_s)

    pattern_group

    factory :shot_without_image do
      image nil
    end

  end

end
