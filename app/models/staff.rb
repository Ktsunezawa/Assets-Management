class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include Discard::Model

  has_many :fixed_assets

  validates :name, presence: true

  def active_for_authentication?
    super && kept?
  end
end
