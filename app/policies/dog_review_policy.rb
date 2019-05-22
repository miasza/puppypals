class DogReviewPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    record.user_id == user.id && Visit.where(user_id: user.id, dog_id: record.dog_id)[0].present? && DogReview.where(user_id: user.id, dog_id: record.dog_id)[0].nil?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
