class Base < ApplicationRecord
  include Discard::Model

  has_many :fixed_assets

  validates :name, uniqueness: true
  validates :name, presence: true
end
