class AppointmentsController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :find_consultation, only: [:create]
  before_action :appointment_params, only: [:create]
  def index
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.consultation_id = @consultation.id
    @appointment.user = current_user
  end

  def edit
  end

  def update
    @appointment.update(params[:appointment_params])
  end

  def destroy
  end

  private
  def find_order
    @order = Order.find(params[:id])
  end
  def find_consultation
    @consultation = Consultation.find(params[:consultation_id])
  end
  def appointment_params
    params.require(:appointment).permit(:start, :end, :location, :pupname)
  end
end
