class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :edit, :update, :destroy]
  before_action :find_consultation, only: [:new, :create]
  before_action :message_params, only: [:new, :create]
  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.consultation_id = @consultation.id
    @message.user = current_user
    # raise
    authorize @message
    @message.save
    redirect_to consultation_path(@consultation)
  end

  def edit
  end

  def update
  end

  def destroy
    @message.destroy
  end

  private

  def find_message
    @message = Message.find(params[:id])
    authorize @message
  end
  def find_consultation
    @consultation = Consultation.find(params[:consultation_id])
    authorize @consultation
  end
  def message_params
    params.require(:message).permit(:subject, :textmess)
  end
end
