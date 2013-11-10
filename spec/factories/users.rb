FactoryGirl.define do

  factory :user, class: User do
    name 'Johnny Bgood'
    nick 'johny_b_good'
    provider 'twitter'
    uid '76031517'
  end

end
