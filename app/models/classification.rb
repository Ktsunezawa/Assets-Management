class Classification < ApplicationRecord
  belongs_to :fixed_asset
  has_many :classification_details
end
