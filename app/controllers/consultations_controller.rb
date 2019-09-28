class ConsultationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :location, :type, :period, :language, :locations, :types, :periods, :languages]
  before_action :find_consultation, only: [:show, :edit, :update, :destroy]
  before_action :consultation_params, only: [:create]
  before_action :location_params, only: [:location]
  before_action :language_params, only: [:language]
  before_action :period_params, only: [:period]
  before_action :type_params, only: [:type]
  skip_after_action :verify_authorized, only: [:locations, :location, :languages, :language, :types, :type, :periods, :period]
  def index
    #@consultations = Consultation.all
    @consultations = policy_scope(Consultation).paginate(page: params[:page], per_page: 8)
    # @consultations.paginate(page: params[:pages])
# @consultations.each do |c|
# if c.reviews.all.map{|x| [x.star]} == []
# else
# @cons_rstars = c.reviews.all.map{|x| [x.star]}
# @r_stars = @cons_rstars.sum
# @total_rstars = @r_stars.sum
# @total_reviews = @cons_rstars.size
# @avg_star = (@total_rstars / @total_reviews)
# end
# end
  end # end of index

  def show
    @appointment = Appointment.new
    @message = Message.new
    @review = Review.new
    @lesson = Lesson.new
    @client = Client.new
    authorize @lesson
    @lesson_op = @consultation.lessons.all.map{|x| [x.lesson_section]}
    @lesson_dow_array = @consultation.lessons.all.map{|x| [x.lesson_dow]}
    @consultation_review_star = @consultation.reviews.all.map{|x| [x.star]}
    if @consultation_review_star != []
      # ^ creates and array of review stars ex: [[4],[1]]
      @review_stars = @consultation_review_star.sum
      # ^ @total_review_stars produces single array ex: [4,2] not sure why
      @total_review_stars = @review_stars.sum
      # ^ SAME as above: @total_review_stars = @review_stars.inject(0){|sum,x| sum + x }
      # ^^ sum of all stars ex[4 + 1] = 5
      @total_reviews = @consultation_review_star.size
      # ^ total number of reviews with stars ex: 2
      @avg_star = (@total_review_stars / @total_reviews)
    else
    end
    # raise
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
    # @consultation.save
    if @consultation.save
      flash[:notice] = "Your class has been created!"
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      flash[:alert] = "Your class was not created. Please try again!"
      respond_to do |format|
        format.html { render :new, consultation: @consultation }
        format.js  # <-- idem
      end
    end
    # redirect_to dashboard_path

  end # end of create

  def edit
  end

  def update
    if @consultation.update(consultation_params)
    # respond_to do |format|
    #     format.html { redirect_to dashboard_path }
    #   end
    flash[:notice] = "Your class has been updated!"
    redirect_to consultation_path(@consultation)
    else
    render :edit
    end
  end

  def destroy
    @consultation.destroy
    flash[:notice] = "Your class has been destroyed!"
    redirect_to dashboard_path
  end

  def locations
    # skip_authorization
    @consultations = policy_scope(Consultation)
    @consult_location_links = []
    @consults_locations = []

    @consultations.each do |c|
     unless @consult_location_links.include? c.consult_location
      @consult_location_links << c.consult_location
     end
    end
    # raise
  end

  def location
    @consult_loc_group = Consultation.where(consult_location: @consult_loc).paginate(page: params[:page], per_page: 8)
    # location param from Consultations#locations view as link 'cloc_link'
    # @consult_loc from private
    # raise
  end

  def languages
    # skip_authorization
    @consultations = policy_scope(Consultation)
    @consult_language_links = []
    @consultations.each do |c|
     unless @consult_language_links.include? c.consult_language
      @consult_language_links << c.consult_language
     end
    end
    # raise
  end

  def language
    @consult_lang_group = Consultation.where(consult_language: @consult_lang).paginate(page: params[:page], per_page: 8)
  end

  def types
    @consultations = policy_scope(Consultation)
    @consult_type_links = []
    @consultations.each do |c|
      unless @consult_type_links.include? c.consult_type
        @consult_type_links << c.consult_type
      end
    end
  end

  def type
    @consult_type_group = Consultation.where(consult_type: @consult_type).paginate(page: params[:page], per_page: 8)
  end

  def periods
    @consultations = policy_scope(Consultation)
    @consult_period_links = []
    @consultations.each do |c|
      unless @consult_period_links.include? c.consult_period
        @consult_period_links << c.consult_period
      end
    end
  end

  def period
    @consult_period_group = Consultation.where(consult_period: @consult_period).paginate(page: params[:page], per_page: 8)
  end

  private
  def find_consultation
    @consultation = Consultation.find(params[:id])
    authorize @consultation
  end
  def consultation_params
    params.require(:consultation).permit(:consult_language, :consult_sec_lang, :consult_focus, :consult_period, :consult_type, :consult_demo, :consultfee, :consult_title, :consult_desc, :consult_location, :matincluded)
  end
  def location_params
    @consult_loc = params[:consult_location]
  end
  def language_params
    @consult_lang = params[:consult_language]
  end
  def type_params
    @consult_type = params[:consult_type]
  end
  def period_params
    @consult_period = params[:consult_period]
  end
end
