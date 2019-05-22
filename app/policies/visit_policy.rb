class VisitPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    record.user_id == user.id
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
