class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :starship
  enum status: { "in progress": 0, "accepted": 1, "refused": 2 }
end
