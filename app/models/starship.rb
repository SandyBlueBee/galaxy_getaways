class Starship < ApplicationRecord
  belongs_to :user

  has_many :booking, dependent: :destroy
  has_many_attached :photos

  validates :passengers, presence: true

end
