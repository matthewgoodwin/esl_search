class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    def index?
      return true
    end
    def show?
      return true
    end
  end
    def user_consultations?
      # ^ outside the Scope < Scope bc does not exist in 'application_policy'
      return true
    end
    def user_appointments?
      return true
    end
    def user_messages?
      return true
    end
    def user_privatemessages?
      pm_owner_creater?
    end
    def user_products?
      return true
    end
    def user_clients?
      return true
    end
    def user_reviews?
      return true
    end
    private
  def pm_owner_creater?
    record.user == user || record.sender_id == user.id
  end
end

