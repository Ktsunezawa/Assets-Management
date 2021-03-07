class Base < ApplicationRecord
  has_many :fixed_assets

  validates :name, presence: true
end
