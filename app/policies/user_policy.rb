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
      owner?
    end
    def user_privatemessages?
      owner?
    end
    def user_products?
      return true
    end
    def user_clients?
      owner?
    end
    def user_reviews?
      owner?
    end
    private
    def owner?
      record == user
    end
end

