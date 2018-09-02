class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  # before_action :find_consultation, only: [:create]
  before_action :find_lesson, only: [:create, :edit, :update, :destroy]
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
    @appointment.user = current_user
    @appointment.consultation_id = @lesson.consultation.id
    @appointment.lesson_id = @lesson.id
    @appointment.invoice_number = Appointment.invoice_number #calls the appointment model
    # raise
    # @appointment.reservation = Random.new_seed
    authorize @appointment # authorize before saving
    if @appointment.valid?
      @appointment.save
      redirect_to appointment_path(@appointment)
    else
      flash[:notice] = 'missing info'
      redirect_to consultation_path(@lesson.consultation.id)
    end
  end

  def edit
  end

  def update
    @appointment.update(params[:appointment_params])
  end

  def destroy
    @appointment.destroy
    redirect_to dashboard_path
  end

  private
  def find_appointment
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end
  # def find_consultation
  #   @consultation = Consultation.find(params[:consultation_id])
  # end
  def find_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
  def appointment_params
    params.require(:appointment).permit(:start, :end, :location, :pupil)
  end
end
