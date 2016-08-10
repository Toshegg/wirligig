FactoryGirl.define do
  factory :meeting, class: "Api::Rest::Meeting" do
    name { Faker::Lorem.characters(20) }
    starts_at { DateTime.now }
    ends_at { DateTime.now + 2.days }
    lat { rand * 100 }
    lng { rand * 100 }
  end
end
