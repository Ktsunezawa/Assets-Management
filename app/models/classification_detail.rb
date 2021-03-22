class ClassificationDetail < ApplicationRecord
  include Discard::Model

  has_one :fixed_asset

  enum classification: {
    buildings: 0,
    buildings_and_acconpanying_facilities: 1,
    structures: 2,
    vessels: 3,
    vehicles: 4,
    tools: 5,
    furniture_and_fixtures: 6,
    machinery_and_equipment: 7,
    land: 8,
    software: 9,
    other_intangeble_assets: 10,
  }

  validates :classification, :detail, presence: true
  validates :useful_life, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

end
