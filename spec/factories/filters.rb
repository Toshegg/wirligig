FactoryGirl.define do
  factory :filter, class: "Api::Rest::Filter" do
    value { "{\"name\": \"sec\"}" }
  end
end
