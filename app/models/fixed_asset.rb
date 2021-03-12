class FixedAsset < ApplicationRecord
  belongs_to :staff
  belongs_to :base

  belongs_to :classification_detail
  has_many :post_images
  accepts_nested_attributes_for :post_images, allow_destroy: true
  attachment :image

end
