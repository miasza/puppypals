class DogPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true
  end

  def destroy?
    record.user_id == user.id
  end

  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude: nil)
    end
  end
end
