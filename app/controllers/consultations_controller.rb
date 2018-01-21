class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show, :edit, :update, :destroy]
  before_action :consultation_params, only: [:create]
  def index
    #@consultations = Consultation.all
    @consultations = policy_scope(Consultation)
  end

  def show
    @appointment = Appointment.new
    # authorize @appointment
  end

  def new
    @consultation = Consultation.new
    authorize @consultation
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user = current_user
    authorize @consultation # authorize then save
    @consultation.save
    redirect_to consultation_path(@consultation)
  end

  def edit
  end

  def update
  end

  def destroy
    @consultation.destroy
  end
  private
  def find_consultation
    @consultation = Consultation.find(params[:id])
    authorize @consultation
  end
  def consultation_params
    params.require(:consultation).permit(:focus, :consulttype, :consultfee)
  end
end
