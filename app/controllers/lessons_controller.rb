class LessonsController < ApplicationController
  before_action :find_consultation, only: [:create]
  before_action :lesson_params, only: [:create]
  before_action :find_lesson, only: [:enrollment, :destroy]
  def index
    @lessons = policy_scope(Lesson)
  end

  def show
    @appointment = Appointment.new
    # @lesson_appoint = @consultation.lessons.all.map{|x| x.stall}
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.consultation = @consultation
    authorize @lesson
    @lesson.save
    redirect_to consultation_path(@consultation)

  end

  def enrollment
  end

  def destroy
  end

  private
  def find_consultation
    @consultation = current_user.consultations.find(params[:consultation_id])
    authorize @consultation
  end
  def find_lesson
    @lesson = Lesson.find(params[:id])
    authorize @lesson
  end
  def lesson_params
    params.require(:lesson).permit(:lesson_level, :lesson_section, :lesson_capacity, :lesson_start, :lesson_end, :lesson_terminate, :lesson_dow=>[])
  end
end
