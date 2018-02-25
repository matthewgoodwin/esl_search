class ReviewController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_consultation, only: [:new, :create, :update, :destroy]
  before_action :review_params, only: [:new, :create]
  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.consultation = @consultation
    authorize @review
    @review.save
    redirect_to consultation_path(@consultation)
  end

  def edit
  end

  def update
  if @review.update(review_params)
    redirect_to consultation_path(@consultation)
  else
    render :edit
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
    params.require(:review).premit(:comment, :star)
  end
end
