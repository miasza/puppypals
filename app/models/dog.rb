class Dog < ApplicationRecord
  belongs_to :user
  has_many :visits
  has_many :users, through: :visits
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :size, presence: true
  validates :breed, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true
end
