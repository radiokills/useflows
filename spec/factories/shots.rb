FactoryGirl.define do

  factory :shot_without_image, class: Shot do
    url "http://dlabs.si"
    visible false
    description "Some description"
    tag_list %w{menu dropdown}

    factory :shot do
      image ""
    end
  end

end
