class PrivatemessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    owner_creater?
  end
  def new?
    return true
  end
  def create?
    return true
  end
  def edit?
    owner_creater?
  end
  def update?
    owner_creater?
  end
  def destroy?
    owner_creater?
  end
  private
  def owner_creater?
    record.user == user || record.sender_id == user.id
  end
end
