class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :dog, presence: true, uniqueness: { scope: :date }
  validates :user, presence: true, uniqueness: { scope: :date }
  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: ["pending", "approved", "declined"] }
end
