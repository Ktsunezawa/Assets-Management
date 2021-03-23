FactoryBot.define do
  factory :base do
    name { Faker::Lorem.characters(number:5) }
  end
end
