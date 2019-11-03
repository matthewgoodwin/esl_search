class LessonsController < ApplicationController
  before_action :find_consultation, only: [:new, :create, :update]
  before_action :lesson_params, only: [:new, :create]
  before_action :find_lesson, only: [:show, :enrollment, :destroy]
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
    if @consultation.lessons.empty?
      @lesson.lesson_section = 1
    else
      @i = @consultation.lessons.last.lesson_section.to_i
      @n = @i +1
      @lesson.lesson_section = @n
    end
    if @lesson.consultation.consult_period == 'hourly'
      @max_mins = @lesson.lesson_max_dur * 60
      @lesson.lesson_end = @lesson.lesson_start + @max_mins
    else
    end

    authorize @lesson
    if @lesson.save
      flash[:notice] = "Your lesson has been added!"
      respond_to do |format|
        format.html { redirect_to consultation_path(@consultation) }
        format.js
      end
    else
      flash[:alert] = "Your lesson could not be saved.. Please try again!"
      respond_to do |format|
        format.html { redirect_to consultation_path(@consultation) }
        format.js
      end # end respond
    end #end if
  end

  def destroy
    @lesson.destroy
    flash[:notice] = "Your lesson has been dropped!"
    redirect_to consultation_path(@consult_lesson)
  end

  def enrollment
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
    params.require(:lesson).permit(:lesson_level, :lesson_section, :lesson_capacity, :lesson_start, :lesson_end, :lesson_terminate, :lesson_max_dur, :lesson_dow=>[])
  end
end
