FactoryBot.define do
  factory :fixed_asset do
    staff_id { 1 }
    base_id { 1 }
    name { "MyString" }
    cost { 1 }
    memo { "MyText" }
    acquisition_date { "2021-03-07" }
  end
end
