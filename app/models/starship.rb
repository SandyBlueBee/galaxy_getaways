class Starship < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :passengers, presence: true

  before_destroy :purge_photos

  def purge_photos
    photos.destroy_all
  end
end
