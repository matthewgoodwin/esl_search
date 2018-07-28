class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show, :edit, :update, :destroy]
  before_action :consultation_params, only: [:create]
  def index
    #@consultations = Consultation.all
    @consultations = policy_scope(Consultation)
  end

  def show
    @appointment = Appointment.new
    @message = Message.new
    @review = Review.new
    # authorize @appointment
    # raise
  end

  def new
    @consultation = Consultation.new
    authorize @consultation
  end

  def create
    @consultation = Consultation.new(consultation_params)
    # raise
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
    redirect_to dashboard_path
  end

  private
  def find_consultation
    @consultation = Consultation.find(params[:id])
    authorize @consultation
  end
  def consultation_params
    params.require(:consultation).permit(:consult_language, :consult_sec_lang, :consult_native_speaker, :consult_focus, :consult_period, :consult_dur, :consult_type, :consultfee, :consult_title, :consult_desc, :consult_location, :matincluded, :consult_dow=>[])
  end
end
