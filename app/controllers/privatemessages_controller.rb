class PrivatemessagesController < ApplicationController
  before_action :find_privatemessage, only: [:show, :edit, :update, :destroy]
  before_action :privatemessage_params
  before_action :find_user
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
    authorize @privatemessage
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
  end
  def find_user
    @user = User.find(params[:user_id])
  end
  def privatemessage_params
    params.require(:privatemessage).permit(:subject, :pm)
  end
end
