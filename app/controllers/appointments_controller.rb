class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  before_action :find_consultation, only: [:create]
  before_action :appointment_params, only: [:create]
  def index
  end

  def new
    @appointment = Appointment.new
    authorize @appointment
  end

  def show
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.consultation_id = @consultation.id
    @appointment.user = current_user
    @appointment.invoice_number = Appointment.invoice_number #calls the appointment model
    # @appointment.reservation = Random.new_seed
    authorize @appointment # authorize before saving
    @appointment.save
    redirect_to appointment_path(@appointment)
  end

  def edit
  end

  def update
    @appointment.update(params[:appointment_params])
  end

  def destroy
    @appointment.destroy
  end

  private
  def find_appointment
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end
  def find_consultation
    @consultation = Consultation.find(params[:consultation_id])
  end
  def appointment_params
    params.require(:appointment).permit(:start, :end, :location, :pupil)
  end
end
