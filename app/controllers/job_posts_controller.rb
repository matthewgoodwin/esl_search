class JobPostsController < ApplicationController
  # created rails g JobPosts Sept 15, 2021
  skip_before_action :authenticate_user!, only:[:index, :show]
  skip_after_action :verify_authorized, only: [:index, :show]
  def index
    @job_posts = policy_scope(JobPost)
  end
  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
end
