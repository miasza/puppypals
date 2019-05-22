class Dog < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :dog_reviews
  has_many :renter_reviews
  has_many :visits, dependent: :destroy
  has_many :users, through: :visits
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :size, presence: true
  validates :breed, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
end
