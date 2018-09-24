class AppointmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.confirmation.subject
  #
  def confirmation(appointment)
    # from controller : AppointmentMailer.confimation(@appointment)
    @appointment = appointment
    mail(
      to: @appointment.user.email,
      subject: "appointment confirmation!"
      )
     # This will render a view in `app/views/appointment_mailer`!
  end
  def confirmationx(appointment)
    @appointment = appointment
    mail(
      to: @appointment.consultation.user.email,
      subject: "consultation confirmation!"
      )
  end
end
