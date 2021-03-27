FactoryBot.define do
  factory :strongpoint do
    name { Faker::Lorem.characters(number:5) }
  end
end
