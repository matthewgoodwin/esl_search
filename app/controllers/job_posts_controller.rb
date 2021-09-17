class JobPostsController < ApplicationController
  # created rails g JobPosts Sept 15, 2021
  skip_before_action :authenticate_user!, only:[:index, :show, :new, :create]
  skip_after_action :verify_authorized, only: [:index, :show, :new, :create]
  before_action :job_post_params, only:[:create]
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  def index
    @job_posts = policy_scope(JobPost)
  end
  def show
  end

  def new
    @job_post = JobPost.new
    # authorize @job_post
  end

  def create
    @job_post = JobPost.new(job_post_params)
    @job_post.user = current_user
    # authorize @job_post
    if @job_post.valid?
      @job_post.save
      redirect_to job_post_path(@job_post)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def job_post_params
    params.require(:job_post).permit(:job_lang, :job_type, :job_demo, :job_period, :job_env, :job_expert, :job_desc, :job_fee_low, :job_fee_high)
  end
  def find_job
    @job_post = JobPost.find(params[:id])
    authorize @job_post
  end
end
