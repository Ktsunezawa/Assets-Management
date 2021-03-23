FactoryBot.define do
  factory :fixed_asset do
    staff_id { 1 }
    base_id { 1 }
    name { Faker::Lorem.characters(number:5) }
    cost { 5000000 }
    memo { Faker::Lorem.characters(number:50) }
    acquisition_date { "2021-03-31" }
  end

end
