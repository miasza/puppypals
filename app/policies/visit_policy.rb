class VisitPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    record.user_id == user.id
  end

  def accept?
    Dog.where(id: record.dog_id, user: user).present?
  end

  def decline?
    accept?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
