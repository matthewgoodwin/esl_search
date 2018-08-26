class LessonsController < ApplicationController
  before_action :find_consultation, only: [:new, :create]
  before_action :find_lesson, only: [:show, :update, :edit, :destroy]
  before_action :lesson_params, only: [:create]
  def index
    @lessons = policy_scope(Lesson)
  end

  def show
    @appointment = Appointment.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.consultation_id = @consultation.id
    authorize @lesson
    @lesson.save
    redirect_to consultation_path(@consultation)

  end

  def update
  end

  def edit
  end

  def destroy
  end
  private
  def find_consultation
    @consultation = Consultation.find(params[:consultation_id])
    authorize @consultation
  end
  def find_lesson
    @lesson = Lesson.find(params[:id])
    authorize @lesson
  end
  def lesson_params
    params.require(:lesson).permit(:lesson_start, :lesson_end, :lesson_terminate, :lesson_dow=>[])
  end
end
