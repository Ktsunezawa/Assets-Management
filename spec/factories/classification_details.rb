FactoryBot.define do
  factory :classification_detail do
    classification_id { 1 }
    detail { "MyString" }
    useful_life { 1 }
    period { 1 }
  end
end
