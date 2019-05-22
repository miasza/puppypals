class DogPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
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
