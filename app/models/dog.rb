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
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_address_and_date,
    against: [:address, :date],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
