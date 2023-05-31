class Starship < ApplicationRecord
  belongs_to :user

  has_one :booking
  has_many_attached :photos
end
