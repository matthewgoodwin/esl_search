class PrivatemessagesController < ApplicationController
  before_action :find_privatemessage, only: [:show, :edit, :update, :destroy]
  before_action :privatemessage_params, only: [:new, :create]
  before_action :find_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_sender, only: [:show]
  def index
  end

  def show
  end

  def new
    @privatemessage = Privatemessage.new
  end

  def create
    @privatemessage = Privatemessage.new(privatemessage_params)
    @privatemessage.user_id = @user.id
    @privatemessage.sender_id = current_user.id
    # ^ migration: 20180407044833_add_sender_id_to_privatemessages
    # ^^ User.find(@privatemessage.sender_id)
    authorize @privatemessage
    # raise
    @privatemessage.save
    redirect_to user_path(@user.id)
  end

  def edit
  end

  def update
  end

  def destroy
    @privatemessage.destroy
  end
  private
  def find_privatemessage
    @privatemessage = Privatemessage.find(params[:id])
    authorize @privatemessage
  end
  def find_user
    @user = User.find(params[:user_id])
    authorize @user
  end
  def find_sender
    @sender = User.find(@privatemessage.sender_id)
    # authorize @sender
  end
  def privatemessage_params
    params.require(:privatemessage).permit(:subject, :pm)
  end
end
