class FixedAsset < ApplicationRecord
  belongs_to :staff
  belongs_to :base

  belongs_to :classification_detail
  accepts_nested_attributes_for :classification_detail

  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image

  enum request_status: { 申請中: 0,  承認済: 1, 修正中: 2 }

  validates :name, :base_id, :acquisition_date, :memo, :post_images_images, presence: true
  validates :cost, numericality: { only_integer: true, greater_than_or_equal_to: 200000 }
  validates :classification_detail, presence: true

end
