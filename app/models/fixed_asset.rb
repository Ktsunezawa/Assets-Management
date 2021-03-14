class FixedAsset < ApplicationRecord
  belongs_to :staff
  belongs_to :base

  belongs_to :classification_detail
  accepts_nested_attributes_for :classification_detail

  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image

end
