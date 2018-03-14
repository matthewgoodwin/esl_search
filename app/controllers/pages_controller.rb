class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :contact, :search]

  def home
  end

  def about
    # raise
  end

  def contact
  end

  def dashboard

    @consultations = current_user.consultations
    # raise
  end

  def search
  end
end
