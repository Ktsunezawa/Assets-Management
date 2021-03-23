FactoryBot.define do
  factory :classification_detail do
    classification { 'buildings' }
    detail { Faker::Lorem.characters(number:30) }
    useful_life { '31' }
  end
end
