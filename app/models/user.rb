class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :starships, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  before_destroy :purge_photo

  def purge_photo
    photo.purge
  end
end
