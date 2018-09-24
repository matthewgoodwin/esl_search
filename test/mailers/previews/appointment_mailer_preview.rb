class AppointmentMailerPreview < ActionMailer::Preview
  def confirmation
    appointment = Appointment.last
    AppointmentMailer.confirmation(appointment)
    # calls app/mailers/appointment_mailer.rb
    # http://localhost:3000/rails/mailers/appointment_mailer/confirmation
  end
  def confirmationx
    appointment = Appointment.last
    AppointmentMailer.confirmationx(appointment)
    # calls app/mailers/appointment_mailer.rb
    # http://localhost:3000/rails/mailers/appointment_mailer/confirmationx
  end
end
