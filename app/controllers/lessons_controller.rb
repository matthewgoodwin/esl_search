class LessonsController < ApplicationController
  before_action :find_consultation, only: [:new, :create, :update]
  before_action :lesson_params, only: [:new, :create]
  before_action :find_lesson, only: [:enrollment, :destroy]
  before_action :find_consultation_lesson, only:[:destroy]
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
    if @lesson.save
      respond_to do |format|
        format.html { redirect_to consultation_path(@consultation) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to consultation_path(@consultation) }
        format.js
      end # end respond
    end #end if
  end

  def enrollment
  end

  def destroy
    @lesson.destroy
    redirect_to consultation_path(@consult_lesson)
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
  def find_consultation_lesson
    @consult_lesson = @lesson.consultation_id
  end
  def lesson_params
    params.require(:lesson).permit(:lesson_level, :lesson_section, :lesson_capacity, :lesson_start, :lesson_end, :lesson_terminate, :lesson_dow=>[])
  end
end
