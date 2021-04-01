class PostImage < ApplicationRecord
  belongs_to :fixed_asset
  has_many :tags, dependent: :destroy

  after_create :create_tags

  def create_tags
      vision_tags = Vision.get_image_data(self)
      vision_tags.each do |tag|
        self.tags.create(name: tag)
      end
  end

  attachment :image
end
