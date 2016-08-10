FactoryGirl.define do
  factory :game, class: "Api::Rest::Game" do
    name { Faker::Lorem.characters(20) }
    players_number { (rand * 10).to_i }
  end
end
