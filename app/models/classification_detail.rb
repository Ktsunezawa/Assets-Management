class ClassificationDetail < ApplicationRecord
  has_one :fixed_asset

  enum classification: {
    建物: 0,
    建物附属: 1,
    構築物: 2,
    船舶: 3,
    車両及び運搬具: 4,
    工具: 5,
    器具及び備品: 6,
    機械装置: 7,
    ソフトウェア: 8,
    その他無形資産: 9
  }

  validates :detail, presence: true
  validates :useful_life, numericality: { only_integer: true }
  validates :period, numericality: { only_integer: true }

end
