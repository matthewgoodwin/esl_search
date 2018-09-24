class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user1)
    @user = user1

    mail (to: @user.email, subject: "Welcome, community member!")
    # This will render a view in `app/views/user_mailer`!
  end
end
