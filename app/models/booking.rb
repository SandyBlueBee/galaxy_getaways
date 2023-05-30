class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :starship

  validates :content, presence: true
end
