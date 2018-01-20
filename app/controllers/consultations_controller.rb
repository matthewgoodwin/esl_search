class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show, :edit, :update, :destroy]
  before_action :consultation_params, only: [:create]
  def index
    @consultations = Consultation.all
  end

  def show
    @appointment = Appointment.new


  end

  def new
    @consultation = Consultation.new

  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user = current_user
    @consultation.save
    redirect_to consultation_path(@consultation)
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def find_consultation
    @consultation = Consultation.find(params[:id])
  end
  def consultation_params
    params.require(:consultation).permit(:focus, :consulttype, :consultfee)
  end
end
