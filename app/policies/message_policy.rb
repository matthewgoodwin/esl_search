class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
    def new?
      return true
    end
    def create?
      return true
    end
    def update?
      owner_user?
    end
    def destroy
      owner_user?
    end
  private
  def owner_user?
    record.user == user || record.message.user == user
  end
end
