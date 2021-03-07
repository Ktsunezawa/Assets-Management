class FixedAsset < ApplicationRecord
  belongs_to :staff
  belongs_to :base
  has_many :classifications
  has_many :post_images
end
