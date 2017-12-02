class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :contact, :search]

  def home
  end

  def about
  end

  def contact
  end

  def dashboard

  end

  def search

  end
end
