class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :starship
  enum status: {0: "en cours", 1: "accepte", 2: "refuse"}
end
