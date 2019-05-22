class RenterReview < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: %i[1 2 3 4 5] }
end
