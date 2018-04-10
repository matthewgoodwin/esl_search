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
    @appointments_array = []
    @appointments = current_user.appointments
    @consultations = current_user.consultations
    @privatemessages = current_user.privatemessages
     # raise
    @consultations.each do |c|
      @count = c.appointments
      @appointments_array << @count
    end
  end

  def search
  end

  def userpage
  end
end
