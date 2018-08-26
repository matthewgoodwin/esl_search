class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # ^ `.all` is from the index action. scope gets the value of the policy
      # ^^ being called by the policy_scope in the `index` method
    end
  end
  def index?
    return true
  end
  def show?
    return true
  end
  def new?
    owner?
  end
  def create?
    owner?
  end
  def edit?
    owner?
  end
  def update?
    owner?
  end
  def destroy?
    owner?
  end
  private
  def owner?
    record.consultation.user == user
    # ^ same as: `record.consultation.user == user ? true : false`
    # ^^ lesson.consultation.user_id == current_user
    # ^^^ record == current lesson ; user == current_user
  end
end
