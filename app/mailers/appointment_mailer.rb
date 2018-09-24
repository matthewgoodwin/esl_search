class AppointmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.confirmation.subject
  #
  def confirmation(user1, user2)
    @user1 = user1
    @user2 = user2
    mail to: @user1.email, subject: "appointment confirmation!"
    mail to: @user2.email, subject: "consultation confirmation!"
     # This will render a view in `app/views/appointment_mailer`!
  end
end
