class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :user_consultations, :user_appointments, :user_messages, :user_products, :user_clients, :user_reviews, :user_privatemessages]
  before_action :find_sender
  def index
    # @users = User.all
    @user = policy_scope(User).order(created_at: :desc)
  end
  def show
    @message = Message.new
    @privatemessage = Privatemessage.new
  end
  def edit
  end
  def update
  end
  def user_consultations
    # @user_consultations = policy_scope(Consultation)
    @user_consultations = current_user.consultations.all
    # raise
  end
  def user_appointments
    @user_appointments = @user.appointments
    # raise
  end
  def user_messages
    @user_consultations = @user.consultations
    # raise
  end
  def user_privatemessages
    @user_privatemessages = @user.privatemessages
    # @sender = User
  end
  def user_products
    @user_products = @user.consultations
  end
  def user_clients
    @privatemessage = Privatemessage.new
    @consultations = current_user.consultations
    @my_clients_array = []
    @consultations.each do |c|
      c.appointments.each do |a|
        unless @my_clients_array.include? User.find(a.user_id)
         @my_clients_array << User.find(a.user_id)
         @my_client = User.find(a.user_id)
        # raise
        end
      end
    end
  end
  def user_reviews
    @user_consultations = @user.consultations
  end
  def search
  end

  private
  def find_user
    @user = User.find(params[:id])
    authorize @user
  end
  def find_sender
    # @sender = User.find()
  end
end
