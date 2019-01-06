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
    @consultation = Consultation.new
    @appointments = current_user.appointments
    @consultations = current_user.consultations
    @privatemessages = current_user.privatemessages
     # raise
    @my_cons_appointments_array = [] #ids of consultation appointments(for count)
    @my_clients_array = [] # list of clients (no repeats clients)
    @my_consult_array = [] # consults with clients
    @my_consultations_array = [] # array of consultations(only)
    @my_messages_id_array = [] # array of consulation messages
    @my_messages_array = [] # array of consulation messages
    @my_reviews_array = [] # ids of reviews
    @my_client_list
    @client = Client.all

    @consultations.each do |c|
      @my_consultations_array << c.id
      # ^takes consultation id's and adds them to array
      c.messages.each do |m|
        @my_messages_id_array << m.id
        @my_messages_array << m
      end
      c.appointments.each do |a|
        # ^creates an object that counts all the consultations(only)
        # ^does not isolate the appointments
        @my_cons_appointments_array << a.id
        @my_consult_array << a # consultations in order of latest appointment
        # @my_consult_array
        # check here!!
        if @my_clients_array.include? User.find(a.user_id)
        # ^Filter users
        # ^^if true do nothing
        else
          @my_clients_array << User.find(a.user_id) # adds the entire user to the client array ONLY ONCE!
          # @my_clients_array << User.find(a.user_id)
          # @my_clients_array << User.find(a.user_id)
        #   # @my_consultation_appointment_clients_array << User.find(a.user_id).fname

        end
        # raise
        # ^takes each appointment id and adds it to an empty array
        # ^^array size is called on the dashboard page
      end
      c.reviews.each do |r|
        @my_reviews_array << r.id
      end
    end # end of @consultations.each
    # raise
  end

  def search
  end

  def userpage
  end
end
