class Base < ApplicationRecord
  belongs_to :staff
  has_many :fixed_assets

  validates :name, presence: true
end
