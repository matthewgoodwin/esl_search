class UsersController < ApplicationController
  before_action :find_user, only: [:show, :user_consultations]
  def index
    # @users = User.all
    @user = policy_scope(User).order(created_at: :desc)
  end
  def show
    @message = Message.new
    @privatemessage = Privatemessage.new
  end

  def user_consultations
    @user_consultations = policy_scope(Consultation)
    @user_consultations = current_user.consultations.all
    # raise
  end

  def search
  end
  private
  def find_user
    @user = User.find(params[:id])
    authorize @user
  end
end
