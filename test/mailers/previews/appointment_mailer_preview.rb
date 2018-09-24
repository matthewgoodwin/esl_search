class AppointmentMailerPreview < ActionMailer::Preview
  def confirmation
    user1 = User.first
    user2 = User.last
    AppointmentMailer.confirmation(user1, user2)
    # calls app/mailers/appointment_mailer.rb
    # http://localhost:3000/rails/mailers/appointment_mailer/confirmation
  end
end
