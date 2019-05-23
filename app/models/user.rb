class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :dogs
  has_many :visits
  has_many :renter_reviews
  has_many :dog_reviews
  validates :username, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
