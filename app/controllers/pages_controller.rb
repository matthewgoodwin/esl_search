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
    @appointments = current_user.appointments
    @consultations = current_user.consultations
    @privatemessages = current_user.privatemessages
     # raise
    @my_consultation_appointments_array = []
    @my_consultations_array = []
    @my_messages_array = []

    @consultations.each do |c|
      @my_consultations_array << c.id
      # ^takes consultation id's and adds them to array
      c.messages.each do |m|
        @my_messages_array << m.id
      end
      c.appointments.each do |a|
        # ^creates an object that counts all the consultations(only)
        # ^does not isolate the appointments
        @my_consultation_appointments_array << a.id
        # ^takes each appointment id and adds it to an empty array
        # ^^array size is called on the dashboard page
      end
    end
    # raise
  end

  def search
  end

  def userpage
  end
end
