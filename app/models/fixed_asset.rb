class FixedAsset < ApplicationRecord

  belongs_to :staff
  belongs_to :strongpoint

  belongs_to :classification_detail
  accepts_nested_attributes_for :classification_detail

  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image

  enum request_status: { requesting: 0, approved: 1, fix: 2, deleted: 3 }

  validates :name, :acquisition_date, :memo, :post_images_images, presence: true
  validates :cost, numericality: { only_integer: true, greater_than_or_equal_to: 200000 }
end
