class Starship < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :passengers, presence: true

end
