class PostImage < ApplicationRecord

  belongs_to :fixed_asset

  attachment :image

end
