class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :dog, presence: true, uniqueness: { scope: :date }
  validates :user, presence: true, uniqueness: { scope: :date }
  validates :date, presence: true
end
