class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_consultation, only: [:new, :create, :update, :destroy]
  before_action :review_params, only: [:new, :create]
  before_action :rating_params, only: [:new, :create]
  def index

  end
  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.consultation = @consultation
    @review.ravg = Review.ravg_star(rating_params) # calls Model -> sends ratings
    @review.ravg > 3.5? @review.succ = 1 : @review.succ = 0
# raise
    authorize @review
    if @review.save
      # flash[:notice] = "Your review has been added!"
      flash[:notice] = t(:review_save)
      respond_to do |format|
        format.html { redirect_to consultation_path(@consultation) }
        format.js
      end
    else
      # flash[:alert] = "Your review is too long or missing information. Try again!"
      flash[:notice] = t(:review_error)
      respond_to do |format|
        format.html { redirect_to consultation_path(@consultation) }
        format.js
    end
    # raise
    end #end of if review.save
  end

  def edit
  end

  def update
    if @review.update(review_params)
    # flash[:notice] = "Your review has been updated!"
    flash[:notice] = t(:review_update)
    redirect_to consultation_path(@consultation)
    else
    render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to consultation_path(@consultation)
  end

  private
  def find_review
    @review = Review.find(params[:id])
    authorize @review
  end
  def find_consultation
    @consultation = Consultation.find(params[:consultation_id])
    authorize @consultation
  end
  def review_params
    params.require(:review).permit(:comment, :review_title, :punct, :prep, :org, :know, :comm, :adapt, :respond, :succ)
    # add appointment reservation number above
  end
    def rating_params
    params.require(:review).permit(:punct, :prep, :org, :know, :comm, :adapt, :respond, :succ)
    # add appointment reservation number above
  end
end
