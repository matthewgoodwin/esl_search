class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # ^ `.all` is from the index action. scope gets the value of the policy
      # ^^ being called by the policy_scope in the `index` method
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    owner_or_consultant?
  end

  def update?
    owner_or_consultant?
  end

  def destroy?
    owner_or_consultant?
  end

  private
  def owner_or_consultant?
    record.user == user || record.consultation.user == user
    # ^ @appointment.user == current_user || @appointment.consultation.user == current_user
    # ^^ from the `find_appointment` before_action in the appointment#controller
  end
end
