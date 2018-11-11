class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end # end of scope
  def show?
    return true
  end
  def new?
    return true
  end
  def create?
    return true
  end
  def edit?
    owner_or_client?
  end
  def update?
    owner_or_client?
  end
  def destroy?
    owner_or_client?
  end
  private
  def owner_or_client?
    record.user == user || record.consultation.user == user
  end
end
